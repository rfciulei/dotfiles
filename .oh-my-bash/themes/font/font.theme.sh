#!/usr/bin/env bash

function prompt() {
    history -a
	PS1="\u@\h: \w${green}$(scm_prompt_info) \$${normal} "
}
safe_append_prompt_command prompt
