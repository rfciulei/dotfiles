#!/usr/bin/env bash

function prompt_command() {
    # Append new history lines to history file
    history -a
    #PS1="${bold_cyan}\u@\h \w $(scm_prompt_char_info)${ret_status}→ ${normal}"
    PS1="${bold_cyan}\u@\h \w ${bold_green}→ ${normal}"
}

safe_append_prompt_command prompt_command
