include(RunCMake)

# Test running a simple executable
run_cmake(RunSimple)

# We need to build the project first
set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/RunSimple-build)
set(RunCMake_TEST_NO_CLEAN 1)
file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")

# Configure
run_cmake_command(RunSimple-configure ${CMAKE_COMMAND} -S ${RunCMake_SOURCE_DIR} -B ${RunCMake_TEST_BINARY_DIR})

# Build
run_cmake_command(RunSimple-build ${CMAKE_COMMAND} --build ${RunCMake_TEST_BINARY_DIR} --config Debug)

# Run
run_cmake_command(RunSimple-run ${CMAKE_COMMAND} --run runtest --build-dir ${RunCMake_TEST_BINARY_DIR} --config Debug -- arg1 arg2)

# Run failure cases
run_cmake_command(RunFailure-no-target ${CMAKE_COMMAND} --run)
run_cmake_command(RunFailure-target-not-found ${CMAKE_COMMAND} --run notexist --build-dir ${RunCMake_TEST_BINARY_DIR} --config Debug)

# Create a clean directory for no-build-dir test
set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/RunClean)
file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")
run_cmake_command(RunFailure-no-build-dir ${CMAKE_COMMAND} --run runtest)
