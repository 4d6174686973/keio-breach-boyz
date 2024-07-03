@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  multi-storage-transaction-sample startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and MULTI_STORAGE_TRANSACTION_SAMPLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\sample-1.0-SNAPSHOT-plain.jar;%APP_HOME%\lib\scalardb-3.9.1.jar;%APP_HOME%\lib\picocli-4.7.1.jar;%APP_HOME%\lib\spring-boot-starter-web-2.5.4.jar;%APP_HOME%\lib\spring-boot-starter-data-jpa-2.5.4.jar;%APP_HOME%\lib\cassandra-driver-core-3.11.3.jar;%APP_HOME%\lib\spring-boot-starter-json-2.5.4.jar;%APP_HOME%\lib\azure-cosmos-4.44.0.jar;%APP_HOME%\lib\azure-core-1.38.0.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.12.4.jar;%APP_HOME%\lib\jackson-annotations-2.12.4.jar;%APP_HOME%\lib\jackson-module-afterburner-2.12.4.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.12.4.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.12.4.jar;%APP_HOME%\lib\jackson-core-2.12.4.jar;%APP_HOME%\lib\jackson-databind-2.12.4.jar;%APP_HOME%\lib\scalardb-rpc-3.9.1.jar;%APP_HOME%\lib\guice-5.1.0.jar;%APP_HOME%\lib\grpc-netty-1.51.0.jar;%APP_HOME%\lib\grpc-services-1.51.0.jar;%APP_HOME%\lib\grpc-protobuf-1.51.0.jar;%APP_HOME%\lib\grpc-stub-1.51.0.jar;%APP_HOME%\lib\grpc-core-1.51.0.jar;%APP_HOME%\lib\grpc-protobuf-lite-1.51.0.jar;%APP_HOME%\lib\grpc-api-1.51.0.jar;%APP_HOME%\lib\protobuf-java-util-3.21.7.jar;%APP_HOME%\lib\guava-31.1-jre.jar;%APP_HOME%\lib\spring-data-jpa-2.5.4.jar;%APP_HOME%\lib\metrics-core-4.1.25.jar;%APP_HOME%\lib\applicationautoscaling-2.20.54.jar;%APP_HOME%\lib\dynamodb-2.20.54.jar;%APP_HOME%\lib\aws-json-protocol-2.20.54.jar;%APP_HOME%\lib\protocol-core-2.20.54.jar;%APP_HOME%\lib\aws-core-2.20.54.jar;%APP_HOME%\lib\auth-2.20.54.jar;%APP_HOME%\lib\regions-2.20.54.jar;%APP_HOME%\lib\sdk-core-2.20.54.jar;%APP_HOME%\lib\apache-client-2.20.54.jar;%APP_HOME%\lib\netty-nio-client-2.20.54.jar;%APP_HOME%\lib\http-client-spi-2.20.54.jar;%APP_HOME%\lib\metrics-spi-2.20.54.jar;%APP_HOME%\lib\json-utils-2.20.54.jar;%APP_HOME%\lib\profiles-2.20.54.jar;%APP_HOME%\lib\utils-2.20.54.jar;%APP_HOME%\lib\spring-boot-starter-jdbc-2.5.4.jar;%APP_HOME%\lib\HikariCP-4.0.3.jar;%APP_HOME%\lib\spring-data-commons-2.5.4.jar;%APP_HOME%\lib\spring-boot-starter-aop-2.5.4.jar;%APP_HOME%\lib\spring-boot-starter-2.5.4.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.5.4.jar;%APP_HOME%\lib\logback-classic-1.2.5.jar;%APP_HOME%\lib\log4j-to-slf4j-2.14.1.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.32.jar;%APP_HOME%\lib\slf4j-api-1.7.32.jar;%APP_HOME%\lib\jooq-3.14.13.jar;%APP_HOME%\lib\core-2.20.54.pom;%APP_HOME%\lib\commons-dbcp2-2.8.0.jar;%APP_HOME%\lib\mysql-connector-java-8.0.26.jar;%APP_HOME%\lib\postgresql-42.2.23.jar;%APP_HOME%\lib\ojdbc8-21.1.0.0.jar;%APP_HOME%\lib\mssql-jdbc-9.2.1.jre8.jar;%APP_HOME%\lib\sqlite-jdbc-3.34.0.jar;%APP_HOME%\lib\commons-text-1.10.0.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-2.5.4.jar;%APP_HOME%\lib\spring-webmvc-5.3.9.jar;%APP_HOME%\lib\spring-web-5.3.9.jar;%APP_HOME%\lib\jakarta.transaction-api-1.3.3.jar;%APP_HOME%\lib\jakarta.persistence-api-2.2.3.jar;%APP_HOME%\lib\hibernate-core-5.4.32.Final.jar;%APP_HOME%\lib\spring-aspects-5.3.9.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-3.12.0.jar;%APP_HOME%\lib\error_prone_annotations-2.14.0.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\azure-core-http-netty-1.13.2.jar;%APP_HOME%\lib\reactor-netty-http-1.0.10.jar;%APP_HOME%\lib\netty-codec-http2-4.1.67.Final.jar;%APP_HOME%\lib\reactor-netty-core-1.0.10.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.67.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.67.Final.jar;%APP_HOME%\lib\netty-resolver-dns-native-macos-4.1.67.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-resolver-dns-4.1.67.Final.jar;%APP_HOME%\lib\netty-handler-4.1.67.Final.jar;%APP_HOME%\lib\jnr-posix-3.0.44.jar;%APP_HOME%\lib\jnr-ffi-2.1.7.jar;%APP_HOME%\lib\micrometer-core-1.7.3.jar;%APP_HOME%\lib\HdrHistogram-2.1.12.jar;%APP_HOME%\lib\reactor-core-3.4.9.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\endpoints-spi-2.20.54.jar;%APP_HOME%\lib\annotations-2.20.54.jar;%APP_HOME%\lib\commons-pool2-2.9.0.jar;%APP_HOME%\lib\proto-google-common-protos-2.9.0.jar;%APP_HOME%\lib\protobuf-java-3.21.7.jar;%APP_HOME%\lib\commons-lang3-3.12.0.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.5.4.jar;%APP_HOME%\lib\spring-boot-2.5.4.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\spring-context-5.3.9.jar;%APP_HOME%\lib\spring-aop-5.3.9.jar;%APP_HOME%\lib\spring-orm-5.3.9.jar;%APP_HOME%\lib\spring-jdbc-5.3.9.jar;%APP_HOME%\lib\spring-tx-5.3.9.jar;%APP_HOME%\lib\spring-beans-5.3.9.jar;%APP_HOME%\lib\spring-expression-5.3.9.jar;%APP_HOME%\lib\spring-core-5.3.9.jar;%APP_HOME%\lib\snakeyaml-1.28.jar;%APP_HOME%\lib\tomcat-embed-websocket-9.0.52.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.52.jar;%APP_HOME%\lib\tomcat-embed-el-9.0.52.jar;%APP_HOME%\lib\aspectjweaver-1.9.7.jar;%APP_HOME%\lib\hibernate-commons-annotations-5.1.2.Final.jar;%APP_HOME%\lib\jboss-logging-3.4.2.Final.jar;%APP_HOME%\lib\javassist-3.27.0-GA.jar;%APP_HOME%\lib\byte-buddy-1.10.22.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\jandex-2.2.3.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\dom4j-2.1.3.jar;%APP_HOME%\lib\jaxb-runtime-2.3.5.jar;%APP_HOME%\lib\perfmark-api-0.25.0.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.67.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.67.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-transport-classes-epoll-4.1.86.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.67.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.67.Final.jar;%APP_HOME%\lib\netty-codec-dns-4.1.67.Final.jar;%APP_HOME%\lib\netty-codec-4.1.67.Final.jar;%APP_HOME%\lib\netty-transport-4.1.67.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.67.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.67.Final.jar;%APP_HOME%\lib\netty-common-4.1.67.Final.jar;%APP_HOME%\lib\jffi-1.2.16.jar;%APP_HOME%\lib\jffi-1.2.16-native.jar;%APP_HOME%\lib\asm-commons-5.0.3.jar;%APP_HOME%\lib\asm-analysis-5.0.3.jar;%APP_HOME%\lib\asm-util-5.0.3.jar;%APP_HOME%\lib\asm-tree-5.0.3.jar;%APP_HOME%\lib\asm-5.0.3.jar;%APP_HOME%\lib\jnr-x86asm-1.0.2.jar;%APP_HOME%\lib\jnr-constants-0.9.9.jar;%APP_HOME%\lib\azure-json-1.0.0.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.40.Final.jar;%APP_HOME%\lib\LatencyUtils-2.0.3.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\third-party-jackson-core-2.20.54.jar;%APP_HOME%\lib\eventstream-1.0.1.jar;%APP_HOME%\lib\httpclient-4.5.13.jar;%APP_HOME%\lib\httpcore-4.4.14.jar;%APP_HOME%\lib\commons-codec-1.15.jar;%APP_HOME%\lib\spring-jcl-5.3.9.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.3.jar;%APP_HOME%\lib\txw2-2.3.5.jar;%APP_HOME%\lib\istack-commons-runtime-3.0.12.jar;%APP_HOME%\lib\jakarta.activation-1.2.2.jar;%APP_HOME%\lib\gson-2.8.7.jar;%APP_HOME%\lib\annotations-4.1.1.4.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.21.jar;%APP_HOME%\lib\grpc-context-1.51.0.jar;%APP_HOME%\lib\logback-core-1.2.5.jar;%APP_HOME%\lib\log4j-api-2.14.1.jar


@rem Execute multi-storage-transaction-sample
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %MULTI_STORAGE_TRANSACTION_SAMPLE_OPTS%  -classpath "%CLASSPATH%" sample.command.SampleCommand %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable MULTI_STORAGE_TRANSACTION_SAMPLE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%MULTI_STORAGE_TRANSACTION_SAMPLE_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
