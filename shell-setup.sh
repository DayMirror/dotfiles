shell_directory=$(cd `dirname $0` && pwd)
shell_prefix='shell'
shell_scripts=('variables' 'aliases' 'functions' 'config')
shell_includes=('common')

echo "directory is $shell_directory"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='macos'
fi

echo "platform is $platform"

if [ ! -z "$platform" ]; then
  shell_includes+=("$platform")
fi

# shell_includes+=('gsn')

for folder in $shell_directory/*; do
  echo "found $folder"
  if [ ! -d "${folder}" ]; then # if not a directory, skip
    echo "not folder - skip"
    continue
  fi
  foldername=$(basename "$folder")
  echo "folder $foldername"
  if [[ ! $foldername =~ ^$shell_prefix-* ]]; then
    echo "doesn't match pattern - skip"
    continue
  fi
  folder_included=''
  for shell_include in $shell_includes; do
    include_folder="$shell_prefix-$shell_include"
    echo "check against include folder $include_folder"
    if [ $foldername == $include_folder ]; then
      echo "matched against $include_folder"
      folder_included='true'
      break
    fi
  done
  if [ ! -z $folder_included ]; then
    for shell_script in $shell_scripts; do
      shell_file=$shell_directory/$foldername/$shell_script
      echo "shell file $shell_file"
      if [ -f $shell_file ]; then
        # source $shell_file
        echo "included file $shell_file"
      fi
    done
  fi
done