#!/usr/bin/env bash

# Theme inspired on:
#  - Ronacher's dotfiles (mitsuhikos) - http://github.com/mitsuhiko/dotfiles/tree/master/bash/
#  - Glenbot - http://theglenbot.com/custom-bash-shell-for-development/
#  - My extravagant zsh - http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
#  - Monokai colors - http://monokai.nl/blog/2006/07/15/textmate-color-theme/
#  - Bash_it modern theme
#
# Screenshot: http://goo.gl/VCmX5
# by Jesus de Mula <jesus@demula.name>

# For the real Monokai colors you should add these to your .XDefaults or
# terminal configuration:
#! ----------------------------------------------------------- TERMINAL COLORS
#! monokai - http://www.monokai.nl/blog/2006/07/15/textmate-color-theme/
#*background: #272822
#*foreground: #E2DA6E
#*color0: black
#! mild red
#*color1: #CD0000
#! light green
#*color2: #A5E02D
#! orange (yellow)
#*color3: #FB951F
#! "dark" blue
#*color4: #076BCC
#! hot pink
#*color5: #F6266C
#! cyan
#*color6: #64D9ED
#! gray
#*color7: #E5E5E5

# ----------------------------------------------------------------- COLOR CONF
D_DEFAULT_COLOR="${normal}"
D_INTERMEDIATE_COLOR="${white}"
D_USER_COLOR="${purple}"
D_SUPERUSER_COLOR="${red}"
D_MACHINE_COLOR="${cyan}"
D_DIR_COLOR="${green}"
D_CHANGES_COLOR="${white}"
D_CMDFAIL_COLOR="${red}"
D_VIMSHELL_COLOR="${cyan}"
D_VIRTUALENV_COLOR="${yellow}"

# ------------------------------------------------------------------ FUNCTIONS
case $TERM in
  xterm*)
      TITLEBAR="\033]0;\w\007"
      ;;
  *)
      TITLEBAR=""
      ;;
esac

# Display virtual environment info (taken from cupcake)
function virtualenv_prompt {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    virtualenv=`basename "$VIRTUAL_ENV"`
    echo -e "using ${D_VIRTUALENV_COLOR}[${virtualenv}] ${D_DEFAULT_COLOR}"
  fi
}

mitsuhikos_lastcommandfailed() {
  code=$?
  if [ $code != 0 ];
  then
    echo "${D_INTERMEDIATE_COLOR}- exited ${D_CMDFAIL_COLOR}\
$code ${D_DEFAULT_COLOR}"
  fi
}

# -------------------------------------------------------------- PROMPT OUTPUT
prompt() {
  local LAST_COMMAND_FAILED=$(mitsuhikos_lastcommandfailed)
  local SAVE_CURSOR='\033[s'
  local RESTORE_CURSOR='\033[u'
  local MOVE_CURSOR_RIGHTMOST='\033[500C'
  local MOVE_CURSOR_5_LEFT='\033[5D'

  PS1="${TITLEBAR}${SAVE_CURSOR}${MOVE_CURSOR_RIGHTMOST}${MOVE_CURSOR_5_LEFT}
${RESTORE_CURSOR}\
${D_INTERMEDIATE_COLOR}\
┌ \
${D_USER_COLOR}\u ${D_INTERMEDIATE_COLOR}\
at \
${D_MACHINE_COLOR}\h ${D_INTERMEDIATE_COLOR}\
in \
${D_DIR_COLOR}\w ${D_INTERMEDIATE_COLOR}\
$(virtualenv_prompt)\
${LAST_COMMAND_FAILED}
${D_INTERMEDIATE_COLOR}\
└❯ \
${D_DEFAULT_COLOR}"
  
  PS2="${D_INTERMEDIATE_COLOR}→ ${D_DEFAULT_COLOR}"
}

# Runs prompt (this bypasses bash_it $PROMPT setting)
safe_append_prompt_command prompt
