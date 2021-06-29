#!/usr/bin/env bash

function prompt() {
    history -a
	
	CURR_BRANCH=$(git_current_branch)
	BRANCH=""
	if [[ -n "$CURR_BRANCH" ]]; then
		BRANCH="| $(git_current_branch) |"
	fi

	if [ "$USER" = "root" ]; then
		PS1="${underline_red}\u${normal} \w${green} $BRANCH \$${normal} "
	else	
		PS1="${green}\u${normal} \w${green} $BRANCH \$${normal} "
	fi

}
safe_append_prompt_command prompt
