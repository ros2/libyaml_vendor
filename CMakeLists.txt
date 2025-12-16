cmake_minimum_required(VERSION 3.20)
project(libyaml_vendor)

# Default to C++17
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)

if(BUILD_TESTING)
  list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules)
  find_package(yaml REQUIRED)

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
  find_package(performance_test_fixture REQUIRED)
  # Give cppcheck hints about macro definitions coming from outside this package
  get_target_property(ament_cmake_cppcheck_ADDITIONAL_INCLUDE_DIRS
    performance_test_fixture::performance_test_fixture INTERFACE_INCLUDE_DIRECTORIES)

  ament_add_gtest(test_yaml_reader test/test_reader.cpp
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")
  if(TARGET test_yaml_reader)
    target_link_libraries(test_yaml_reader yaml)
  endif()

  add_performance_test(benchmark_reader test/benchmark/benchmark_reader.cpp
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")
  if(TARGET benchmark_reader)
    target_link_libraries(benchmark_reader yaml)
  endif()
endif()

install(DIRECTORY cmake
  DESTINATION share/${PROJECT_NAME})

ament_package(
  CONFIG_EXTRAS "libyaml_vendor-extras.cmake"
)
