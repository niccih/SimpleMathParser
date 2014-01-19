#!/bin/sh
# This is for JUnit-4*
CLASSPATH=".:/git/java/classes:junit-4.10.jar"; export CLASSPATH
javac Token.java
javac Lexar.java
javac Parser.java

javac LexarTest.java
java org.junit.runner.JUnitCore LexarTest

javac ParserTest.java
java org.junit.runner.JUnitCore ParserTest
