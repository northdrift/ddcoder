#!/bin/bash
echo "======pull======"
echo `git pull`
reps=`git remote -v | grep push | awk {'print $1'}`
read -a WORDS <<< $reps;
for rep in ${WORDS[@]};
do  
    if [ $rep != 'origin' ];
    then
        echo
        echo "======push to $rep======"
        echo `git push $rep master`
    fi;
done;
