#!/bin/bash
startDir=${HOME}
function git_pull {
	echo $(pwd)
	cd $1
	git pull
	cd ${startDir}
}
for repo in configfiles sharedbin R6Unit linkeddocs SoilR-exp;do
	git_pull ${repo}
done
