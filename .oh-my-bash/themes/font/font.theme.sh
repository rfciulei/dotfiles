#!/usr/bin/env bash

function prompt() {
    history -a
	
	CURR_BRANCH=$(git_current_branch)
	BRANCH=""
	if [[ -n "$CURR_BRANCH" ]]; then
		BRANCH="| $(git_current_branch) |"
	fi

	if [ "$USER" = "root" ]; then
		#PS1="${underline_red}\u${normal} \w${green} $BRANCH \$${normal} "
		#PS1="${underline_red}\u${normal}@${red}\h${normal} \$PWD${red} $BRANCH \$${normal} "
		PS1="${underline_red}\u${normal}@${red}\h${normal} \w${red} $BRANCH \$${normal} "
	else	
		#PS1="${green}\u${normal} \w${green} $BRANCH \$${normal} "
		#PS1="${green}\u${normal}@\h \$PWD${green} $BRANCH \$${normal} "
		PS1="${green}\u${normal}@\h \w${green} $BRANCH \$${normal} "
	fi

}
safe_append_prompt_command prompt
