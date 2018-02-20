### Lesson 1: First Steps

You will Learn:
Linux systems
Networking
Software development
Tools and why they matter

You will build:
Functioning applications on the cloud
Cloud infrastructures

General Topics:
Software: A program that runs on a computer.
Operating System: Computer software that manages other software.
GNU/Linux: A free Operating System.
Computer Security: Like physical security but harder to solve with a baseball bat.
Virtual Machine: A computer emulated in software.
Containers: Not virtual machines, but basically virtual machines.
Development:
Version Control: A way to track changes and contributions to a project.
Continuous Integration: Releasing updates continuously.
Buzzwords:
FOSS: Free (and Libre) Open Source Software. Free as in Speech, not Free as in Pizza (but that too usually).
‘The Cloud’: Computers somewhere else.
Docker: Software that manages Linux containers

SSH: Secure Shell
Secure Shell (SSH) provides a secure channel to access a Linux machine remotely via command line.
It’s a primary tool for almost every DevOps engineer
Designed as a replacement to Telnet which provides unsecured remote shell access
Allows for password logins and private/public key-based logins which are more secure
Some tricks you can do with SSH
Run a single command remotely
Secure file transfer (via scp or WinSCP)
Port forwarding, SOCKS proxy or tunnel
SSHFS – userspace filesystem which uses SSH

### Lesson 2: Operating Systems

An Operating System is the software which manages physical computing resources, interfaces between the hardware and the applications on a computer, and what exposes a creates a number of APIs for giving developers access to low-level applications / hardware.
The OS is not always one thing or another. Some Operating systems are behemoths while others are minimal. Some are designed for teaching purposes while others are optimized for managing data centers.

The general diagram, from you -> hardware, looks like this:

User Interface: What you interact with. Window Managers for instance.
Application Layer: What developers use to make software run.
Kernel: The Core of the OS. Makes communication between hardware and applications sane.
Hardware: What does the actual computations. The thing your keyboard is plugged into.


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
