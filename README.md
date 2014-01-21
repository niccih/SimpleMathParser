SimpleMathParser
================

SimpleMathParser

This repository includes scripts in Ruby and Java, that provide a simple maths parser
that takes a specific input and calculates the result, without giving precendence to
operators, other than braces. The equation is literally evaluated from left to right.

The requirement for this was set outside the scope of the repository, and is purposefully
meant to exclude prefix/infix/postfix solutions to standard equation evaluation.

#To run on Windows 7

##Ruby

To be able to run the ruby scripts on Windows 7, you will need to have
ruby installed. If it is not already installed, follow these steps:

* Go to [RubyInstaller](http://rubyinstaller.org/downloads) and download the
applicable installer. If you are not sure which one, choose Ruby
1.9.3-p484.
* Run the downloaded executable to install
* Open a command prompt
* From the command line, execute 'gem install rspec'
* Change directory to 'SimpleMathParse/ruby/tests' (full path dependent
  on where you have cloned this repository to).
* From the command line run 'run_tests.bat' to execute each test case.

##Java

To compile the java classes, you will need to have the Java Development
Kit installed. If not already installed, follow these steps:

* Go to [JDK
Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html).
NOTE: 
* Before downloading, you will need to accept the Oracle Binary Code
License Agreement.
* Choose the applicable download.
* Once the download has completed, run the installer.


## Ant

A build.xml file has been provided to simplify the java compilation and
produce a jar file. To use this, you will need to make sure that Apache
ANT is also installed. If not already installed, follow these steps:

* Go to [Ant Downloads](https://ant.apache.orh/bindownload.cgi) and
  download the zip archive (v 1.9.3 recommended).
* Uncompress the downloaded file to any location.
* Add an environment variable JAVA_HOME that points to your JDK
  installation (normally C:\Program Files\Java\jdk.1.7.0_51 - or
your equivalent version)
* Add and environment variable ANT_HOME that points to the unzipped ant directory.
* Append the the environment variable PATH
  '...existing\path;%JAVA_HOME%\bin;%ANT_HOME%\bin;'
* Open new command prompt and change to the project directory for this
  repository. Change into the java sub directory and run 'ant'. This
will compile the various classes and generate the SimpleMathParser.jar
file
* Change into the tests sub-directory and run 'tester.bat' to execute
  the java unit tests.


