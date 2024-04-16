^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package libyaml_vendor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1.6.3 (2024-04-16)
------------------
* Update quality declaration documents (`#62 <https://github.com/ros2/libyaml_vendor/issues/62>`_)
* Contributors: Christophe Bedard

1.6.2 (2023-10-09)
------------------
* remove rcpputils and rcutils dependency (`#61 <https://github.com/ros2/libyaml_vendor/issues/61>`_)
* Contributors: Kenta Yonekura

1.6.1 (2023-07-11)
------------------
* Set to C++17. (`#59 <https://github.com/ros2/libyaml_vendor/issues/59>`_)
* Switch to ament_cmake_vendor_package (`#58 <https://github.com/ros2/libyaml_vendor/issues/58>`_)
* Contributors: Chris Lalancette, Scott K Logan

1.6.0 (2023-04-27)
------------------

1.5.0 (2023-02-13)
------------------
* Fix system package dependency (`#54 <https://github.com/ros2/libyaml_vendor/issues/54>`_)
* Update libyaml_vendor to C++17. (`#55 <https://github.com/ros2/libyaml_vendor/issues/55>`_)
* [rolling] Update maintainers - 2022-11-07 (`#53 <https://github.com/ros2/libyaml_vendor/issues/53>`_)
* Contributors: Audrow Nash, Chris Lalancette, Scott K Logan

1.4.2 (2022-11-02)
------------------
* Remove a warning message. (`#51 <https://github.com/ros2/libyaml_vendor/issues/51>`_)
* check if libyaml is already present before building it (take 2) (`#45 <https://github.com/ros2/libyaml_vendor/issues/45>`_)
* Contributors: Chris Lalancette, Silvio Traversaro

1.4.1 (2022-09-13)
------------------
* Mirror rolling to master
* Support WindowsStore builds for ROS2 (`#50 <https://github.com/ros2/libyaml_vendor/issues/50>`_)
  * libyaml for uwp
* Contributors: Audrow Nash, Lou Amadio

1.4.0 (2022-05-04)
------------------

1.3.0 (2022-04-29)
------------------

1.2.2 (2022-03-31)
------------------
* Add a buildtool dependency on git. (`#48 <https://github.com/ros2/libyaml_vendor/issues/48>`_)
* Contributors: Steven! Ragnarök

1.2.1 (2022-03-28)
------------------
* Install headers to include/${PROJECT_NAME} (`#46 <https://github.com/ros2/libyaml_vendor/issues/46>`_)
* Merge pull request `#43 <https://github.com/ros2/libyaml_vendor/issues/43>`_ from ros2/update-maintainers
* Update maintainers to Audrow Nash
* Contributors: Audrow Nash, Shane Loretz

1.2.0 (2021-04-06)
------------------
* updating quality declaration links (re: `ros2/docs.ros2.org#52 <https://github.com/ros2/docs.ros2.org/issues/52>`_) (`#38 <https://github.com/ros2/libyaml_vendor/issues/38>`_)
* Update libyaml_vendor to 0.2.5. (`#37 <https://github.com/ros2/libyaml_vendor/issues/37>`_)
* Contributors: Chris Lalancette, shonigmann

1.1.1 (2021-03-10)
------------------
* Fix linker flags for tests when CMake < 3.13 (`#35 <https://github.com/ros2/libyaml_vendor/issues/35>`_)
* Always preserve source permissions in vendor packages (`#31 <https://github.com/ros2/libyaml_vendor/issues/31>`_)
* Contributors: Scott K Logan

1.1.0 (2021-01-25)
------------------
* Fix target_link_directories/link_directories in cmake (`#29 <https://github.com/ros2/libyaml_vendor/issues/29>`_)
* Included benchmark tests (`#20 <https://github.com/ros2/libyaml_vendor/issues/20>`_)
* Update Quality Declaration (`#23 <https://github.com/ros2/libyaml_vendor/issues/23>`_)
* Update package maintainers. (`#22 <https://github.com/ros2/libyaml_vendor/issues/22>`_)
* Bump QD to 3 and some minor style fixes (`#19 <https://github.com/ros2/libyaml_vendor/issues/19>`_)
* Add Security Vulnerability Policy pointing to REP-2006. (`#18 <https://github.com/ros2/libyaml_vendor/issues/18>`_)
* Add quality declaration libyaml_vendor (`#12 <https://github.com/ros2/libyaml_vendor/issues/12>`_)
* Contributors: Alejandro Hernández Cordero, Chris Lalancette, Jorge Perez, Michel Hidalgo

1.0.2 (2020-05-07)
------------------
* Quality declaration for external dependency libyaml (`#14 <https://github.com/ros2/libyaml_vendor/issues/14>`_)
* Add missing Contributing.md file (`#17 <https://github.com/ros2/libyaml_vendor/issues/17>`_)
* Export modern CMake interface target (`#16 <https://github.com/ros2/libyaml_vendor/issues/16>`_)
* Contributors: Dirk Thomas, Jorge Perez

1.0.1 (2020-04-24)
------------------
* Add missing export of yaml (`#15 <https://github.com/ros2/libyaml_vendor/issues/15>`_)
* Only propagate CMAKE_BUILD_TYPE for single configuration generators (`#13 <https://github.com/ros2/libyaml_vendor/issues/13>`_)
* Enable linter tests on libyaml_vendor (`#8 <https://github.com/ros2/libyaml_vendor/issues/8>`_)
* Add missing LICENSE file, apache2 (`#7 <https://github.com/ros2/libyaml_vendor/issues/7>`_)

1.0.0 (2018-06-25)
------------------
* remove version from CMake, use the one from package.xml instead (`#5 <https://github.com/ros2/libyaml_vendor/issues/5>`_)
  * remove version from CMake, use the one from package.xml instead
  * removing version keyword as well
* Export libyaml library (`#4 <https://github.com/ros2/libyaml_vendor/issues/4>`_)
  * Export libyaml library
  * Remove lib prefix
* Added support for Android (`#2 <https://github.com/ros2/libyaml_vendor/issues/2>`_)
* create libyaml_vendor (`#1 <https://github.com/ros2/libyaml_vendor/issues/1>`_)
  * create libyaml
  * Don't install to include/config.h
* Initial commit
* Contributors: Mickael Gaillard, Mikael Arguedas, dhood
