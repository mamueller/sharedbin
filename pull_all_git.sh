#!/bin/bash
startDir=${HOME}
function git_pull {
	cd $1
	echo $(pwd)
	git pull
	cd ${startDir}
}
for repo in configfiles sharedbin R6Unit linkeddocs SoilR-exp;do
	git_pull ${repo}
done
