#!/bin/sh
shell_directory=$(cd `dirname $0` && pwd)
shell_prefix='shell'
shell_scripts=('variables' 'aliases' 'functions' 'config')
shell_includes=('common')

echo "shell directory is $shell_directory"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='macos'
fi

if [ ! -z "$platform" ]; then
  shell_includes+=("$platform")
fi

# shell_includes+=('gsn')
shell_includes+=('local')

for shell_include in  "${shell_includes[@]}"
do
  shell_folder="$shell_directory/.$shell_prefix-$shell_include"
  if [ -d $shell_folder ]; then
    for shell_script in "${shell_scripts[@]}"
    do
      shell_file="$shell_folder/$shell_script.sh"
      if [ -e $shell_file ]; then
        echo "included file $shell_file"
        source $shell_file
      fi
    done
  fi
done