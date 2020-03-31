# External Dependency Quality declaration libyaml

This document is a declaration of software quality for the `libyaml` external dependency, based on the guidelines in [REP-2004](https://github.com/ros-infrastructure/rep/blob/rep-2004/rep-2004.rst).

The [libyaml](https://github.com/yaml/libyaml) external dependency is a C library for parsing and emitting YAML. Maintained in the YAML Project Github organization together with other 115 repositories. First, a summary discussing how this library is qualified is presented, and then it will be listed how this library matches the standards defined for ROS packages.

## Summary

The `libyaml` meets the basic requirements for a software platform in terms of testing its basic functionality, providing a valid license for the code used and a public github repository with the changes made to the code over time.

Even if the library does not provide an API/ABI policy targeting the desired use of the library, the fact that it deals with the YAML standard and this one hasn’t changed since 2009, allows us to infer that the functionality needed for the ROS core from this library is not going to be changed.

There is no explicit support for any OS platform, however their [Github repository](https://github.com/yaml/libyaml) installation appears to be targeting Linux. The first version of this library was developed in 2006, and it is used widely. There is no explicit metric of how much the library is used, but the equivalent library for python, developed by the same organization is required for at least 150k repositories (According to [Github metrics](https://github.com/yaml/pyyaml/network/dependents?package_id=UGFja2FnZS01MjUyMjEzNQ%3D%3D)) and the `libyaml` library is used for some optional fast functionality. The [safe_yaml](https://rubygems.org/gems/safe_yaml) ruby gem has over 80million downloads and one of its implementations uses `libyaml` through psych. There are various big projects leveraging functionality from the `libyaml` library.

To study the library as an external dependency, it might not be necessary to require high code coverage, but to check if the used parts in the ROS packages are tested, and this is the case for this library.

Considering the previously mentioned reasons, we consider this library to be robust and reliable, and hence we declare it to qualify as a level 1 external dependency.

## Comparison with ROS packages quality standards

### Version policy

1.  *Must have a version policy*    

It is not stated if the library supports any kind of version policy

2.  *Must be at a stable version (e.g. for semver that means version >= 1.0.0)*
    
Current version is 0.22

3.  *Must have a strictly declared public API*
    
As a C library, elements available in its `yaml.h` are considered to be their public API.

4.  *Must have a policy for API stability*
    
There is no policy for API stability. This is not a problem because the `libyaml_vendor` package importing the `libyaml dependency` is using a fixed version, in this case, the [0.18](https://github.com/yaml/libyaml/tree/release-0.1.8)

5.  *Must have a policy for ABI stability*
    
There is no policy for ABI stability. This is not a problem because the `libyaml_vendor` package importing the `libyaml` dependency is using a fixed version, in this case, the [0.18](https://github.com/yaml/libyaml/tree/release-0.1.8)

6.  *Must have a policy that keeps API and ABI stability within a released ROS distribution*
    
There is not a direct correlation between the `libyaml` releases and the ROS distributions, however this is not a problem because the `libyaml_vendor` package importing the `libyaml` dependency is using a fixed version, in this case, the [0.18](https://github.com/yaml/libyaml/tree/release-0.1.8)


### Change Control Process

7.  *Must have all code changes occur through a change request (e.g. pull request, merge request, etc.)*
    
Checking through the commits history, it can be seen is not the case.

8.  *Must have confirmation of contributor origin (e.g. [DCO](https://developercertificate.org/), CLA, etc.)*
    
Does not have it (or it does not seem like it’s the case)

9.  *Must have peer review policy for all change requests (e.g. require one or more reviewers)*
    
Seems to be followed for pull requests on the github repository, but as not all code changes occur through change requests, this can not be confirmed for these changes.

10.  *Must have Continuous Integration (CI) policy for all change requests*    

If any, it not publicly available

11.  *Must have documentation policy for all change requests*
    
Not available

### Documentation

12.  *Must have documentation for each "feature" (e.g. for rclcpp: create a node, publish a message, spin, etc.)*
    
Provided [doxygen documentation](https://github.com/yaml/libyaml/tree/master/doc) for the whole project. It is not provided as a document, it has to be built separately when downloading.

13.  *Must have documentation for each item in the public API (e.g. functions, classes, etc.)*
    
Yes, doxygen documentation is available for library .h headers.

14.  *Must have a declared license or set of licenses*
    
MIT license declared for the repository, it can be found [here](https://github.com/yaml/libyaml/blob/master/LICENSE).

15.  *Must have a copyright statement in each source file*
    
Is not available
 
16.  *Must have a "quality declaration" document, which declares the quality level and justifies how the package meets each of the requirements*
    
This document represents the Quality Declaration document for the `libyaml` ROS dependency.

### Testing

17.  *Must have system tests which cover all items in the "feature" documentation*
    
Tests provided to cover the expected usage of the library, for the version of the library used can be found [here](https://github.com/yaml/libyaml/tree/release-0.1.8/tests).

18.  *Must have system, integration, and/or unit tests which cover all of the public API*
   
Not clear without coverage results to check if all the API is covered

19.  *Must have code coverage, and a policy for changes*

 Code coverage and internal policies are not public, if any

20.  *Performance tests, and performance regression policy*
    
Performance tests, and performance regression policy are not public, if any

21.  *Linters and Static Analysis*
    
Not available publicly, if any

### Dependencies

22.  *Must not have direct runtime "ROS" dependencies which are not at the same level as the package in question ('Level N'), but…*
    
The `libyaml` library does not add additional dependencies, it only requires C++ standard libraries to be built and used.

### Platform Support:

23.  *Must support all tier 1 platforms for ROS 2, as defined in [REP-2000](https://www.ros.org/reps/rep-2000.html#support-tiers)*
    
Does not define support for any specific platform.