cmake_minimum_required(VERSION 3.10)
project(libyaml_vendor)

# Default to C++17
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
find_package(yaml 0.2.5 EXACT QUIET)

ament_vendor(libyaml_vendor
  SATISFIED ${yaml_FOUND}
  VCS_URL https://github.com/yaml/libyaml.git
  VCS_VERSION 0.2.5
  CMAKE_ARGS
    "-DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}$<$<BOOL:${MSVC}>: /wd4244 /wd4267 /wd4996>"
)

ament_export_dependencies(yaml)

if(BUILD_TESTING)
  if(TARGET libyaml_vendor)
    add_library(yaml_library INTERFACE)
    externalproject_get_property(libyaml_vendor INSTALL_DIR)
    target_include_directories(yaml_library INTERFACE "${INSTALL_DIR}/include")
    target_link_directories(yaml_library INTERFACE "${INSTALL_DIR}/lib")
    target_link_libraries(yaml_library INTERFACE ${CMAKE_LINK_LIBRARY_FLAG}yaml)
    add_dependencies(yaml_library libyaml_vendor)
  else()
    add_library(yaml_library ALIAS yaml)
  endif()

  # We need to install a Findyaml.cmake file that does not respect
  # ament_cmake_lint_cmake's convention/filename and package/stdargs rules
  # See https://github.com/ros2/libyaml_vendor/pull/45#issuecomment-1087559657
  list(APPEND AMENT_LINT_AUTO_EXCLUDE
    ament_cmake_lint_cmake
  )
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
  find_package(ament_cmake_lint_cmake REQUIRED)
  ament_lint_cmake("--filter=-convention/filename,-package/stdargs")

  find_package(ament_cmake_gtest REQUIRED)
  find_package(rcpputils REQUIRED)
  find_package(performance_test_fixture REQUIRED)
  # Give cppcheck hints about macro definitions coming from outside this package
  get_target_property(ament_cmake_cppcheck_ADDITIONAL_INCLUDE_DIRS
    performance_test_fixture::performance_test_fixture INTERFACE_INCLUDE_DIRECTORIES)

  ament_add_gtest(test_yaml_reader test/test_reader.cpp
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")
  if(TARGET test_yaml_reader)
    target_link_libraries(test_yaml_reader yaml_library)
    ament_target_dependencies(test_yaml_reader rcpputils)
  endif()

  add_performance_test(benchmark_reader test/benchmark/benchmark_reader.cpp
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")
  if(TARGET benchmark_reader)
    target_link_libraries(benchmark_reader yaml_library)
    ament_target_dependencies(benchmark_reader rcpputils)
  endif()
endif()

install(DIRECTORY cmake DESTINATION share/${PROJECT_NAME})

ament_package(CONFIG_EXTRAS libyaml_vendor-extras.cmake)
