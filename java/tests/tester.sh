#!/bin/sh
# This is for JUnit-4*
CLASSPATH=".:../lib/SimpleMathParser.jar:junit-4.10.jar"; export CLASSPATH

javac LexarTest.java
java org.junit.runner.JUnitCore LexarTest

javac ParserTest.java
java org.junit.runner.JUnitCore ParserTest
