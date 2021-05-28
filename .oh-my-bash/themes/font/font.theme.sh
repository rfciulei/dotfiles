#!/usr/bin/env bash

function prompt() {
    history -a

	if [ "$USER" = "root" ]; then
		PS1="${underline_red}\u${normal}@\h: \w${green}$(scm_prompt_info) \$${normal} "
	else	
		PS1="\u@\h: \w${green}$(scm_prompt_info) \$${normal} "
	fi

}
safe_append_prompt_command prompt
