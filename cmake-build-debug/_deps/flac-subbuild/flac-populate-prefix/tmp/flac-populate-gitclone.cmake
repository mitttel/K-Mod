# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if(EXISTS "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitclone-lastrun.txt" AND EXISTS "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitinfo.txt" AND
  "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitclone-lastrun.txt" IS_NEWER_THAN "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitinfo.txt")
  message(STATUS
    "Avoiding repeated git clone, stamp file is up to date: "
    "'C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitclone-lastrun.txt'"
  )
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"
            clone --no-checkout --depth 1 --no-single-branch --config "advice.detachedHead=false" "https://github.com/xiph/flac.git" "flac-src"
    WORKING_DIRECTORY "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps"
    RESULT_VARIABLE error_code
  )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once: ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/xiph/flac.git'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe"
          checkout "1.4.3" --
  WORKING_DIRECTORY "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '1.4.3'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe" 
            submodule update --recursive --init 
    WORKING_DIRECTORY "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-src"
    RESULT_VARIABLE error_code
  )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitinfo.txt" "C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'C:/Users/461/CLionProjects/cmake-sfml-project-master/cmake-build-debug/_deps/flac-subbuild/flac-populate-prefix/src/flac-populate-stamp/flac-populate-gitclone-lastrun.txt'")
endif()
