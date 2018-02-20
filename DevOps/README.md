## Topics
* 1: First Steps
* 2: Operating Systems
* 3: Docs & Communication
* 4: Shell Navigation
* 5: Users, Groups, Permissions
* 6: Files
* 7: Packages, Software, Libraries
* 8: Version Control
* 9: Programming
* 10: Frameworks
* 11: Testing
* 12: Continuous Integration
* 13: Security
* 14: Databases
* 15: Dev Processes & Tools
* 16: DNS
* 17: Configuration Management
* 18: Application Isolation
* 19: Cloud Infrastructure
* 20: Contributing to Open Source

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

---

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

---

### Lesson 3: Docs & Communication

IRC is a very old protocol for communicating online with other people. On IRC it is easy to create a new channel (chat-room) and talk with people in public or privately.

It has become the long-standing de facto mode of online communication right next to mailing lists in the technology community.

Quick Facts:
Internet Relay Chat (IRC)
Very old (RFC 1459, May 1993)
Works on everything (Terminal, GUI, Web-browser, etc)

*Ssh into it*

---

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
```

---

### Lesson 5: Users, Groups, Permissions

Users have:
* Username
* UID
* Group
* Shell
* Usually (but not always) password
* Usually (but not always) home directory


**Super users**
All users have a specific set of permissions, i.e., things they can and cannot do. The Linux super-user root is not burdened by this and so it can do pretty much whatever it wants. As a person this is important because you can become root and get things done that your user is unable to do.

The way you act as root is one of two ways:
* `su root` Is like logging in as root. Prompts you for the root user’s password.
* `sudo <command>` runs a single command as root. Prompts you for your password, but requiresyou to be on the sudoers list.

---

### Lesson 6: Files

The basic understanding of a file is “Some chunk of data stored on your hard drive/solid state drive/floppy disk/etc.” However, the concept of files can be extended to include more than just data. Unix and Linux systems represent nearly everything – data, processes, storage devices, sockets, and more – as files.

By representing everything as files, Linux provides a consistent interface to easily access all kinds of things. This abstraction allows users to interact with data, software, and hardware alike by reading from and writing to files.

File metadata:
* `ls -alt`
* `stat /etc/services`

Many programs use files that begin with . to store configuration options. These configuration files are aptly called “dotfiles”.

Can edit file metadata with:
* `chown`: edit the owner
* `chmod`: change read/write/execute
* `chgrp`: change the group permission

**Executing a File?:** When a file has the +x bit set it means you can invoke this as if it were a program.

(Anastassia note: Ah, I've symlinked specs before. Type of file, cool.)

---

### Lesson 7: Packages, Software, Libraries

Popular Linux System Package Managers:

These are package managers used to install system packages like Web-browsers, terminals, network managers, etc. Although they are default OS package managers, a package manager itself is really just a package itself, so one can install any package manager they want.

.rpm
* yum - RPM Package manager with repo support
* rpm - low level package manager tool used by yum
* Used by RedHat, CentOS, Fedora and others

.deb
* apt - Debian package manager with repo support
* dpkg - low level package manager tool used by apt
* Used by Debian, Ubuntu, Linux Mint and others

Yum vs. Apt

Yum
* XML repository format
* Automatic metadata syncing
* Supports a plugin module system to make it extensible
* Checks all dependencies before downloading

Apt
* Upgrade and Dist-Upgrade
* Dist-Upgrade applies intelligent upgrading decisions during a major system upgrade
* Can completely remove all files including config files

---

### Lesson 8: Version Control

- [x] Totally good with this section.

---

### Lesson 9: Programming

**Static Vs Dynamic Typing**

In statically typed languages, types are either known or deduced at compile time. When you run a program, the computer knows which variables are integers, which variables are strings, etc. Examples of statically typed languages include C, C++, and Java.

In dynamically typed languages, you don’t know what the type of a variable is until it has been assigned. Examples of dynamically typed languages include Python, Ruby, and PHP.

**Strong Vs Weak Typing**

Strongly typed languages enforce type safety. What this means is that you can’t, for example, use an int in the place of a float. However, this can be useful for catching bugs that would otherwise hide themselves in large codebases and cause problems.

Weakly typed languages are permissive in allowing types to act like different types. In reality, though, no language is either strongly or weakly typed. However, some languages are more strongly typed than others.

**Functions, Structs, and Objects**

* Structs are collections of logically grouped variables. They can be treated as variables with sub-variables.
* Objects are collections of logically grouped functions and variables. They are declared in a class and an instance of a class is an object. The class can be thought of as the blueprint for an object.

Duck-typing:  As long as an object implements the proper interfaces, it can act like any type it wants.

When developing a Python project you will want to use a virtual environment. This isolates the dependencies of your project from the Python software installed on your computer.

---

### Lesson 10: Frameworks

Frameworks are collections of classes, functions, and constants designed to make completing a task easier.
Examples include:
* Web-app frameworks
* Game frameworks
* GUI frameworks
* Testing frameworks

Frameworks:
* are meant to make the life of a developer easier by supplying programmers with tools and design patterns to accomplish a task in an expressive and relatively simple way.
* simplify a program by implementing tedious parts of a to let the programmer focus on the “Big Picture” and “Application Specific Needs”.
* tend to exist for commonly developed types of applications to reduce the amount of time spent on repeated development steps like recieving HTTP requests or drawing sprites to a screen.

**Static vs Dynamic Sites**

Static:
* A static site delivers the same content to anybody visiting. Static sites can either be written in pure HTML/CSS/Javascript, or a static site generator can be used to write content in another markup language to be compiled to HTML
* Rarely changes, looks the same for all visitors (Blog, News, Document)

Dynamic:
* A dynamic site changes as the user or users interact with it. Social networks and search engines are good examples of dynamic sites. Web Frameworks are primarily used in dynamic sites and rarely in static sites.
* Changes based on who you are and what you do. (Search Engine, Login)

Note: Dynamic websites are vulnerable to a much wider variety of attacks than static websites are.

Python: Django, Flask
Ruby: Rails, Sinatra
Node.js: ExpressJS

- [x] MVC Architecture

**URL Routing:** A core component in every web framework is URL routing. This is where you tell a framework what to do when a user performs an action on a specific URL.

**Templating Engines**: Templating engines are the “Views” part of the MVC architecture. They take a string, or file, with places for variables and stick the specific values in.

**HTTP Concepts:**
* Resource: A thing that exists and is accessible using HTTP
* URI: A string that is used to identify the location of a resource
* Request: Data that is sent by the client to the server, asking the server to perform some action
* Method: The part of the request specifying the action that the client wants the server to perform
* Response: The server’s response back to the client after processing the client’s request
* Error Code: The part of the response summarizing the server’s response to the request

**REST**

REST (Representational State Transfer) is a web architecture that takes advantage of HTTP’s features by defining a set of rules for how servers handle client requests and format their responses. There are many of these rules, but the most important are:
* Servers are stateless
* Resources are self-contained
* HTTP methods have predictable side-effects

---

### Lesson 11: Testing

With automated testing you spend a slightly longer up-front in writing the tests up, but then you can run all of your tests with a single command (or with Continuous Integration, no commands at all!)

Most tests consist of the same general structure:
* Set-up: Any pre-testing steps occur here. For instance, your application may use a database; this is where you would populate that database with test data.
* Expected output: The expected results of your function calls are outlined.
* Actual output: The functionality being tested is implemented and its results are recorded.
* Comparison: Now the two values (expected and actual) are compared, usually using some form of the syntax expect(expected == actual). If the contents of the expect call is false, then the test-runner (more on that later) raises an error, continues running the test, and produces a traceback at the end of all tests.
* Tear-down: The setup and the tests are undone. If data was populated during the test that data is removed; if files were written they are deleted. This is to ensure that each test is completed in the same environment and each one is self-contained.

**Testing Pyramid**

1. Unit Testing
  *  Testing each component (function, struct, class, etc) individually, ignoring how the program works as a whole in favor of verifying each piece.
2. Integration Testing
    * Testing how each function works together. Ensuring the components do what they are expected to do.
3. Systems Testing
    * Testing the program as a whole in an environment (computer, operating system) similar to its target platform(s).

**Concept: Mocking**
* Simulating behavior external to a program so your tests can run independently of other platforms.
* You’re testing your program, not somebody else’s. Mock other people’s stuff, not your own.
* For example: If you are writing a library that wraps a web API you would mock that API so you can ensure the tests run even when the website it wraps is down.

---

### Lesson 12: Continuous Integration

Continuous Integration is a name for any kind of automated tool that performs the following tasks:
* Detects changes to your project
* Runs a suite of tests on the changed code
* Alerts the people that care if something good/bad happened

CI tools are also known to do a slew of other things:
* Builds and releases new versions of a package when they’re needed
* Builds documentation and other parts of a project with each new release

Automated Testing is the most common/easiest.
(Travis, Jenkins, CircleCI)

---

### Lesson 13: Security

Physical Security
  * Use physical barriers to prevent unauthorized access to data
Software Security
  * Fix flaws in your application that could grant attackers unwanted levels of access to your systems
Network Security
  * Security pertaining to networked services (websites, databases, etc).
  * Active: in which an intruder initiates commands to disrupt the network’s normal operation (Denial-of-Service, Ping of Death)
  * Passive: a network intruder intercepts data traveling through the network. (Man-in-the-Middle, Wiretapping, Idle Scan)

**Access Control**

Identification: Who is this person?
* Identification is the first step in granting access. During this step, the user identifies themselves to the system they wish to access. One example of an identifying piece of information is a username. In most cases, however, identification isn’t enough. It’s easy enough to claim to be someone that you aren’t, which is why you have to perform Authentication alongside identification.

Authentication: Is this person who they say they are?
* An example of Authentication would be asking for a password or passphrase. When you are logging into a website or computer you are authenticating.

Authorization: Is this person allowed to perform this action?
* An example of Authorization is when you try to open a file on a shared computer and you are denied access. Your user (that you authenticated as) is not allowed to access that file.

#### Certificates
Certificates are what allows your computer to create a secure connection with a server and transfer sensitive data across the wire.

**HTTPS**

Hyper Text Transfer Protocol Secure.

This is an extension of the HTTP protocol designed for secure web communication, but it’s a good idea to ensure that you’re using it everywhere by replacing http:// with https:// or by using a browser extension like HTTPS Everywhere.

**Certificate Authorities**

An entity that issues digital certificates for HTTPS connections. These certificates are trusted by Browsers through a web of trust. Anybody can create their own certificates, but only certificate authorities can issue a certificate signed by a trusted organization.

**SSL/TLS**

Secure Socket Layer/Transport Layer Security.

This is the actual protocol used for secure connections over the web. TLS is the new protocol that replaced SSL, but they are sometimes discussed as one / interchangeably.

#### Code Injection Attacks

SQL Injection
* SQL Injection is when you take advantage of the fact that a form input is inserted directly into a SQL query. You write some password and then write a new SQL query which drops all tables, or returns all data, exploiting an easy security hole.

Cross-Site Scripting (XSS)
* Cross-Site Scripting is when a malicious script is sent to, and run on, a person’s computer. This tends to take advantage of the fact that your browser blindly runs any JavaScript you tell it to.

Cross-Site Request Forgery (CSRF)
* CSRF is when one website on your browser tries to carry out an action as you on a different website. For instance you’re an admin of some big social media website, you get an email, embedded in the email is a CSRF script which tries to delete all user accounts on your website. Since you’ve got your credentials cached your browser doesn’t know better and can run that command becuase it looks like any other command.

#### Defenses
Sanitize Inputs
* Input sanitation is when your code sniffs a piece of input to see if it looks like a SQL or code of any kind. If it does look like code it’s probably malicious so your program errors out and tells the user to enter a real input.

CSRF Tokens
* A CSRF token is a unique string that has to be tied to each request you send to a server. You don’t need to log back in each time you get a new one but the application won’t complete your action unless the token is included in your query. This means only the website you’re logged into can send a real query because only that website knows the CSRF token.


---

### Lesson 14: Databases

When people talk about databases they tend to talk about the underlying Database Management System (DBMS). These are programs like MySQL or PostgreSQL which are designed to complete the tasks of storing, retrieving, updating, caching, deleting, and other data manipulation. SQL databases are based on around Relational Algebra

Some DBMS are optimal for specific situations. For instance SQLite is good for small databases since it stores data in a file on disk. MySQL is good for large projects, but can be a pain to setup and manage.

Databases are very good at efficiently storing large amounts of data. The catch is that your data must be well structured by a schema. You can’t just dump data into a database, the data must first be defined in a schema and inserted to fit in that schema. That is almost always a worth-while tradeoff when dealing with big data.

#### Concurrent Read/Write

In order to quantify how well a database engine handles the demands of a concurrent world, it is assessed by the properties of ACID:

* Atomicity: Either the entire transaction succeeds or it fails completely
* Consistency: Transactions always leave the database in a valid state
* Isolation: Concurrent operations look like they took place sequentially
* Durability: Transactions are permanent after they’re committed

#### Types
SQL:
* Stores data in tables organized by column and field.
* SQL Databases are interfaced with SQL Queries (more on that later) and require a great deal of structure. SQL databases are not known for their flexibility and require a lot of forethought before being created. That said they tend to be very fast and are standardized in the industry.
* MySQL/MariaDB, PostgreSQL, SQLite

NoSQL:
* Stores data differently than an SQL database.
* In cases like these a NoSQL database can be used to store you database in different / more flexible ways. NoSQL databases can also offer more flexibilty in storage options, allowing one to spread data across many machines more easily than SQL databases tend to do.
* MongoDB, Apache Casandra, Dynamo, Redis

NewSQL:
* A middle-ground between SQL and NoSQL

- [x] Schemas, Migrations
- [x] Raw Queries, Native Queries, ORMs

**Object Relational Mappers**

An Object Relational Mapper (ORM) is a library which allows you to write in a native programming language to interface with a database. So instead of crafting SQL queries you express in your native language what you want the database to do. This means you don’t write any SQL, the programming language handles those specifics for you.

The real benefit of an ORM is that you can use any database backend you want and the ORM will compile your native code into a query for that database.

As an example you can write all of your queries for your database. In testing you use an in-memory SQLite database (very fast) and in production you use a PostgreSQL database. Testing with a Postgres database is a pain to setup, but you probably wouldn’t want to run SQLite in production.

* Maps an Object in an application to a database table or relationship.
* Talks SQL to the database, your favorite language to you.
* Lets you point to different databases with the same syntax.
* Intelligently manages transactions to the database.

---

### Lesson 15: Dev Processes & Tools

---

### Lesson 16: DNS

---

### Lesson 17: Configuration Management

---

### Lesson 18: Application Isolation

---

### Lesson 19: Cloud Infrastructure

---

### Lesson 20: Contributing to Open Source
