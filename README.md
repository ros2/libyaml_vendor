# libyaml_vendor
CMake wrapper to provide libyaml cmake modules.

It only installs a [`Findyaml.cmake`](cmake/Modules/Findyaml.cmake) CMake find module,
to ensure that the library can be always found via:
~~~cmake
find_package(yaml REQUIRED)
~~~
and linked via:
~~~cmake
target_link_libraries(<target> PRIVATE yaml)
~~~
even if no CMake config file for `yaml` is installed in the system.

## Quality Declaration files

Quality declaration for this package: [libyaml_vendor QD](QUALITY_DECLARATION.md).

Quality declaration of external dependency [libyaml](./libyaml_q_declaration.md).
