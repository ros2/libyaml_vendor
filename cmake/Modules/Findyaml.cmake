# Copyright 2022 Open Source Robotics Foundation, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include(FindPackageHandleStandardArgs)
find_package(yaml CONFIG QUIET)
if(yaml_FOUND)
  find_package_handle_standard_args(yaml FOUND_VAR yaml_FOUND CONFIG_MODE)
else()
  # Otherwise, rely on pkg-config
  find_package(PkgConfig QUIET)

  if(PKG_CONFIG_FOUND)
    pkg_check_modules(YAML_PKG_CONFIG IMPORTED_TARGET yaml-0.1)
    find_package_handle_standard_args(yaml DEFAULT_MSG YAML_PKG_CONFIG_FOUND)

    if(yaml_FOUND)
      if(NOT TARGET yaml)
        add_library(yaml INTERFACE IMPORTED)
        set_property(TARGET yaml PROPERTY INTERFACE_LINK_LIBRARIES PkgConfig::YAML_PKG_CONFIG)
      endif()
      set(yaml_LIBRARIES yaml)
      set(yaml_VERSION ${YAML_PKG_CONFIG_VERSION})
    endif()
  endif()
endif()
