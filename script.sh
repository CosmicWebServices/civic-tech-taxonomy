#!/bin/sh
FILES=*.yml
gem install yaml-lint
gem install i18n_yaml_sorter
for f in $FILES
  do
    oldvalue=`cat $f`
    yaml-lint $f
    sort_yaml < $f > $f.tmp && mv $f.tmp $f
    newvalue=`cat $f`
    if [ $newvalue == $oldvalue ]
    then 
      echo "Done."
      exit 0
    else
      echo "Build Failed."
      exit 1
    fi
  done

echo "Build Failed."
exit 1 #For some reason Script did not work at all. What a shame.
