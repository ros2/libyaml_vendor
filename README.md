# libyaml_vendor
CMake wrapper to provide libyaml.

The CMake script in this package checks if a `libyaml` that has exactly the version required by ROS 2 is available in the system.

If such `libyaml` is available in the system, it only installs a [`Findyaml.cmake`](cmake/Modules/Findyaml.cmake) CMake find module,
to ensure that the library can be always found via:
~~~cmake
find_package(yaml REQUIRED)
~~~
and linked via:
~~~cmake
target_link_libraries(<target> PRIVATE yaml)
~~~
even if no CMake config file for `yaml` is installed in the system.

If a `libyaml` that has exactly the version required by ROS 2 is not available in the system, then it downloads and installs
`libyaml` as part of this package thanks to [CMake's ExternalProject module](https://cmake.org/cmake/help/latest/module/ExternalProject.html).

The `FORCE_BUILD_VENDOR_PKG` CMake option (that by default is `OFF`) is provided to allow forcing a `libyaml` build, regardless
of what can be found in the system.

## Quality Declaration files

Quality declaration for this package: [libyaml_vendor QD](QUALITY_DECLARATION.md).

Quality declaration of external dependency [libyaml](./libyaml_q_declaration.md).
