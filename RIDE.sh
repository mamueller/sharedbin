#!/usr/bin/env bash

##############################################################
# change to the packages root dir (one level above pkg)

	#	first determine the path to this script relative to the location it was called from
	my_path=${0}
	my_dir=$(dirname ${my_path})
	#my_dir_absolute=$(cd ${my_dir} && pwd) #absolute path
	if [ -z ${my_dir} ] ; then
	  # error; for some reason, the path is not accessible
	  # to the script (e.g. permissions re-evaled after suid)
	  exit 1  # fail
	fi
	# go to the directory containing this script an one level up
	cd "${my_dir}/.."

##############################################################
# now start a tmux session 
# inspired by : http://www.whiteboardcoder.com/2015/01/tmux-scripting.html
	
	### start a session (but do not attach it yet)
	tmux new -s tide -d
	tmux split-window -h -t tide
	tmux select-pane -t 0
	tmux send-keys 'cd pkg/R;vim . ' C-m

	### create the second window
	tmux select-pane -t 1
	#tmux send-keys 'R' C-m
	tmux send-keys 'cd pkg/inst/tests' C-m

	### create the third window
	tmux split-window -h -t tide
	
	### go back to vi pane
	tmux select-pane -t 0

	###  attach the session
	tmux attach -t tide

