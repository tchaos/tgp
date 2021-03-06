#!/bin/bash

#Contains the environment variables used by tgp

#Automatically exports the variables set in this file
set -a 

#Sets the working directory of tgp
ROOT_PATH=$(pwd)
#Sets the default path of the produced jar files
APP_PATH=$ROOT_PATH/output
#Sets the path for the bash scripts used to run tgp
BIN_PATH=$ROOT_PATH/bin
#Sets the path of the jar containing tgp
PROFILER_PATH=$ROOT_PATH/output
#Sets the path for configuration files
CONF_PATH=$ROOT_PATH/conf
#Sets the path for the libraries required by tgp
LIB_PATH=$ROOT_PATH/lib
#Set the path for input files used in the preprocessing stage
PREP_FILE_PATH=$ROOT_PATH/input
#Sets the directory where the traces are generated by tgp
PROFILES_PATH=$ROOT_PATH/profiles
#Sets name of the renamed directory where traces will be moved
TRACES_PATH=$ROOT_PATH/traces

#Set the extension for native agents (which depends on the OS, so for Linux and jnilib for MacOS)
AGENT_EXT_UNIX=.so
AGENT_EXT_MACOS=.jnilib

#Sets the classpath to the test application jar path
APP_CLASSPATH=$APP_PATH/testapp.jar
#Sets the arguments for the test application
APP_ARGS=""
#Sets the flags for the test application
APP_FLAGS=""

#Set the jars containing the classes of DiSL and ShadowVM
DISL_SERVER_JAR=$LIB_PATH/disl-server.jar
DISL_BYPASS_JAR=$LIB_PATH/disl-bypass.jar
SHADOW_VM_JAR=$LIB_PATH/dislre-server.jar
SHADOW_VM_DISPATCH_JAR=$LIB_PATH/dislre-dispatch.jar

#Set the paths for the exclusion lists to be provided to DiSL
EXCLUSION_LIST=$CONF_PATH/exclusion.lst
DISL_FL_EXCLUSION_FILE=$CONF_PATH/flexclusion.lst
#Sets a parser supporting class preprocessing
PARSER_JAR=$LIB_PATH/parser.jar
#Set the PAPI jar and agent
PAPI_BENCH_JAR=$LIB_PATH/papi-bench.jar
PAPI_BENCH_AGENT=$LIB_PATH/libpapiagent
#Set the prefixes and suffixes for the profiler
PROFILER_PREFIX=$PROFILER_PATH/tgp-
PROFILER_SUFFIX=.jar
#Sets the prefix for the DiSL agent
DISL_SERVER_AGENT_PREFIX=$LIB_PATH/libdislagent
#Sets the prefix for ShadowVM agent
SHADOW_VM_AGENT_PREFIX=$LIB_PATH/libdislreagent
#Sets the prefix for the agent profiling garbage collector activity
GC_AGENT=$LIB_PATH/libgcagent

#Sets the DiSL options
DISL_SERVER_OPTIONS="-Ddisl.exclusionList=$EXCLUSION_LIST -noverify"

#Sets the options for the ShadowVM. The first flag sets initial Java heap size to be 256MB and the second limits the heap size to 2GB
SHADOW_VM_OPTIONS="-Xms256m -Xmx2G"

#Sets the main class for the test application.
APP_MAIN_CLASS="ch.usi.dag.tgp.test.TestRunAndJoin"

#Sets the options for the application to run. Flags -Ddisl.forcesuperclass=true and -Ddisl.forceinterfaces=true enable forceloading
APP_OPTIONS="-noverify -Ddisl.forcesuperclass=true -Ddisl.forceinterfaces=true -Ddisl.flexclusionfile=$DISL_FL_EXCLUSION_FILE"

#Set variables for the preprocesser
PREPROCESSER_PATH=$ROOT_PATH/preprocesser
PREPROCESSER_SCRIPT_PATH=$PREPROCESSER_PATH/bin
PREPROCESSER_LIB_PATH=$PREPROCESSER_PATH/libs
PREPROCESSER_JAR=$PREPROCESSER_PATH/preprocesser.jar
PREPROCESSER_INPUT_PATH=$PREPROCESSER_PATH/input
PREPROCESSER_OUTPUT_PATH=$PREPROCESSER_PATH/output
PREPROCESSER_FILE_EXT=.txt

#Sets the debug mode (false by default)
DEBUG=false

#Sets the name of the file where temporal perf trace is created
PERF_TRACE=$PROFILES_PATH/perf.csv
#Sets the name of the file where perf trace will be created
CS_FILE=$PROFILES_PATH/cs.csv
#Sets the metric to be measured by perf (context-switches by default)
PERF_METRICS="context-switches"
#Sets the file where the temporal perf start time file is created
PERF_START_TIMESTAMP_TRACE=$PROFILES_PATH/perf-start.csv

#Sets the file where the CPU trace is created
CPU_TRACE=$PROFILES_PATH/cpu.csv

#Sources variables from application.sh
source application.sh
#Sources variables from metrics.sh
source metrics.sh

#Prevents any further variable to be exported
set +a