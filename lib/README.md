# Flutter Animations Masterclass
This repository contains coursework from Andrea's class on Flutter Animations.  The code within is not a 1:1 copy of the instructions, but has been modified or improved.

You can find the class at https://codewithandrea.com.

---

## **Gotchas**

### Pathing & Naming
- Including an ampersand (&) in a project's path causes Gradle to illusively fail.  More on the topic can be found here: https://stackoverflow.com/a/40430312.
- I discovered by accident that when the path length is too long (I am estimating 150+ characters), Flutter will fail to build for Windows and throw the following CMake-related error: *"No CMAKE_CXX_COMPILER could be found."*
