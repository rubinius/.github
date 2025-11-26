# The Rubinius Language Platform

Rubinius is a platform for building programming languages. It began as an implementation of the Ruby programming language, but it has grown beyond that.

While it is still very much an evolving work-in-progress, Rubinius intends to provide:

* An end-to-end compiler based on LLVM that takes various programming language syntax and generates either bytecode for the virtual machine or machine code for the underlying CPU.
* A variety of memory heaps using garbage collection, reference counting, or explicit allocation control.
* Full native-thread concurrency with no global interpreter lock.
* Content-addressable code similar to the [Unison programming language](https://www.unison-lang.org).
* Telemtry from the virtual machine and subsystem or from the native CPU executable.
* Tools like debuggers, profilers, type analysis, etc.
