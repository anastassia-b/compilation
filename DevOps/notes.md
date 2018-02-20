## Topics
##### 1: First Steps
##### 2: Operating Systems
##### 3: Docs & Communication
##### 4: Shell Navigation
##### 5: Users, Groups, Permissions
##### 6: Files
##### 7: Packages, Software, Libraries
##### 8: Version Control
##### 9: Programming
##### 10: Frameworks
##### 11: Testing
##### 12: Continuous Integration
##### 13: Security
##### 14: Databases
##### 15: Dev Processes & Tools
##### 16: DNS
##### 17: Configuration Management
##### 18: Application Isolation
##### 19: Cloud Infrastructure
##### 20: Contributing to Open Source

---

### Lesson 1: First Steps

You will Learn:
* Linux systems
* Networking
* Software development
* Tools and why they matter

You will build:
* Functioning applications on the cloud
* Cloud infrastructures

General Topics:
* Software: A program that runs on a computer.
* Operating System: Computer software that manages other software.
* GNU/Linux: A free Operating System.
* Computer Security: Like physical security but harder to solve with a baseball bat.
* Virtual Machine: A computer emulated in software.
* Containers: Not virtual machines, but basically virtual machines.
* Version Control: A way to track changes and contributions to a project.
* Continuous Integration: Releasing updates continuously.
* FOSS: Free (and Libre) Open Source Software.
* ‘The Cloud’: Computers somewhere else.
* Docker: Software that manages Linux containers

**SSH: Secure Shell**

Secure Shell (SSH) provides a secure channel to access a Linux machine remotely via command line.
It’s a primary tool for almost every DevOps engineer
Designed as a replacement to Telnet which provides unsecured remote shell access
Allows for password logins and private/public key-based logins which are more secure

Some tricks you can do with SSH:
* Run a single command remotely
* Secure file transfer (via scp or WinSCP)
* Port forwarding, SOCKS proxy or tunnel
* SSHFS – userspace filesystem which uses SSH

### Lesson 2: Operating Systems

An Operating System is the software which manages physical computing resources, interfaces between the hardware and the applications on a computer, and what exposes a creates a number of APIs for giving developers access to low-level applications / hardware.

The OS is not always one thing or another. Some Operating systems are behemoths while others are minimal. Some are designed for teaching purposes while others are optimized for managing data centers.

* User Interface: What you interact with. Window Managers for instance.
* Application Layer: What developers use to make software run.
* Kernel: The Core of the OS. Makes communication between hardware and applications sane.
* Hardware: What does the actual computations. The thing your keyboard is plugged into.


Popular Operating Systems

There are many popular (used daily by many people) Operating Systems out there. The ones listed below all get the same jobs done (browsing the web, editing documents, playing games, etc), but they approach the problem in a technically or philosophically different way.

UNIX
Linux
Android
Debian
RHEL
MacOS / Darwin
FreeBSD
Windows

Linux is the kernel the powers many flavors (or Distros/Distributions) of GNU/Linux. Each flavor was created because of philosophical, technical, or social difference in opinions with the existing flavors of Linux on the market.

The reason some people call it GNU/Linux is because the OS you use is a Linux kernel with GNU utilities on top of it; things like basic command-line tools and other software that turns a kernel into a full-fledged OS. We will flip-flop between calling this OS GNU/Linux and just Linux throughout this course, but we mean the former unless we are talking about Linux Kernel.

GNU/Linux runs everything from smart-phones (Android) to the International Space Station (Debian) and Data Centers in between.

Flavors of Linux
Variants (forks) of Linux Operating Systems are called flavors. These are grouped into families based on their operating system ancestry. More Information.

Debian
Ubuntu
LinuxMint
RedHat
RHEL
Fedora
Centos
Gentoo
ChromeOS
Slackware
ArchLinux

**Exercise: Pop Quiz**

What are some different types of Operating Systems?
* Single/Multi-user OS, Embedded OS, Real-time OS, Single/Multi-tasking OS.

What constitutes a ‘Distribution’ of Linux?
* Distros are a version of Linux which is distributed to others. Your personal installation, with all of it’s tricked out changes, is not a distro, but if you were to package it into an ISO and have other people download it, that would be a distro.

How is Linux different from Windows? OSX?
* Linux is different from Windows in that it is a Unix-like OS, and Free & Open Source. It is different from OSX in that it is Free & Open Source.

How is Debian different from Gentoo?
* Each distro (including Debian vs Gentoo) differ in ideology. Gentoo wants to be a Linux distro that does one thing well while Debian wants to do something different well. Very few distros have identical philosophies.


### Lesson 3: Docs & Communication

IRC is a very old protocol for communicating online with other people. On IRC it is easy to create a new channel (chat-room) and talk with people in public or privately.

It has become the long-standing de facto mode of online communication right next to mailing lists in the technology community.

Quick Facts:
Internet Relay Chat (IRC)
Very old (RFC 1459, May 1993)
Works on everything (Terminal, GUI, Web-browser, etc)

*Ssh into it*


### Lesson 4: Shell Navigation

A shell is a text-based user-interface for a computer.

Shells are the programs which allows you use a computer via text-based commands. Not to be confused with a **terminal, which is the environment a shell runs in** (GNOME terminal, tty1, etc). A shell is run in a terminal, a terminal is the widow you use the shell in.

Shell examples: `sh`, `bash`, `csh`...

Navigation Concepts:
* Invoking a program
* Flags
* Environment Variables: `env`
* Pipe
* Directory / Root / Tree

```sh
# Prints the current working directory (where you are)
$ pwd
# Prints the contents of the current working directory
$ ls
# Navigates to a new directory.
$ cd <path/to/other/directory>
# Prints a string to the screen.
$ echo "some thing $AND_VARS"
# Prints the contents of a file(s) to the screen.
$ cat foo.txt bax.txt
# Searches `file.txt` for the string `foo`
$ grep foo file.txt
# Prints a file to the screen so you can arrow up/down.
$ less file.txt
# Prints environment variables to the screen.
$ env
# Prints out current user
$ whoami
# When in doubt, always type help.
$ help
```

Shell Scripts



### Lesson 5: Users, Groups, Permissions


### Lesson 6: Files


### Lesson 7: Packages, Software, Libraries


### Lesson 8: Version Control


### Lesson 9: Programming


### Lesson 10: Frameworks


### Lesson 11: Testing


### Lesson 12: Continuous Integration


### Lesson 13: Security


### Lesson 14: Databases


### Lesson 15: Dev Processes & Tools


### Lesson 16: DNS


### Lesson 17: Configuration Management


### Lesson 18: Application Isolation


### Lesson 19: Cloud Infrastructure


### Lesson 20: Contributing to Open Source
