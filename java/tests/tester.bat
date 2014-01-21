@echo off
set classpath=.;..\lib\SimpleMathParser.jar;junit-4.10.jar

javac -classpath %classpath% LexarTest.java
java -classpath %classpath% org.junit.runner.JUnitCore LexarTest

javac -classpath %classpath% ParserTest.java
java -classpath %classpath% org.junit.runner.JUnitCore ParserTest
