#!/usr/bin/env bash
#
##############################################################
	echo $1
	cd ${1}
	echo $(pwd)
# now start a tmux session 
# inspired by : http://www.whiteboardcoder.com/2015/01/tmux-scripting.html
	
	### start a session (but do not attach it yet)
	session_name="RIDE$(basename ${1})"
	echo ${session_name}
	tmux new -s "${session_name}" -d
	#### create the second window
	tmux split-window -h -t "${session_name}"
	
	tmux select-pane -t 0
	if [ -d tests ];then
		### start vi in first pane	
		tmux send-keys "vim -c 'vnew |lcd pkg/R|edit .|wincmd l|lcd tests|edit .'" C-m
		tmux send-keys -t 1 'cd tests' C-m 
	fi 
	if [ -d pkg/inst/tests ];then
		### start vi in first pane	
		tmux send-keys "cd pkg && vim -c 'vnew |lcd R|edit .|wincmd l|lcd inst/tests|edit .'" C-m
		tmux send-keys  -t 1 'cd pkg/inst/tests ' C-m
	fi 

	tmux select-pane -t 1

	##### create the third window
	#tmux split-window -h -t ${session_name}
	##
	##### go back to vi pane
	#tmux select-pane -t 0

	####  attach the session
	tmux attach -t ${session_name}
  #$SHELL
