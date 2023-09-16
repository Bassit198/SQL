@echo off
rem
rem  env.bat 
rem 

rem  This batch file sets the environment variables necessary for running
rem  the Java programs with JDBC statements

rem  Set the classpath to point to the jar file and the current directry
rem  Note: This batch file must be run prior to the compilation of java programs

set CLASSPATH=.\mysql-connector-java-8.0.23.jar;.

:end
