######################################################################
# Prompt customization                                                #
#######################################################################

COLUMNS=400
DARKGRAY='\e[1;30m'
LIGHTRED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
LIGHTBLUE='\e[1;34m'
NC='\e[m'

# This displays the time in the upper right hand corner of the terminal
#PS1="$LIGHTRED\u\[\e[m\] $LIGHTBLUE\w\[\e[m\]$GREEN$ \[\e[m\]\[\e[0;32m\] \[\033[s\]\[\033[1;\$((COLUMNS-4))f\]\$(date +%H:%M)\[\033[u\]"
#PS1="\[$LIGHTRED\[\u\[\e[m\] \[$LIGHTBLUE\[\w\[\e[m\]\[$GREEN\[\$ "

#PS1='\[\e[1;31;40m\]┏━┅◉ \[\e[4;34m\]\w\[\e[0m\] \[\e[0;40m\]\d ⌚ \A \[\e[0;31m\]┅┅◈ \u@\H (\!)\[\e[0m\]\n\[\e[1;31m\]┗━►\[\e[0m\] '

SIMPLEPROMPT='\w> '
FANCYPROMP='\[\e[1;31;40m\]┏━┅◉ \[\e[4;34m\]\w\[\e[0;40m\] ┅┅◈ \d ⌚ \A \[\e[1;38m\]┅┅◈ \u@\H (\!)\[\e[0m\]\n\[\e[1;31m\]┗━►\[\e[0m\] '
PS1='\[\e[1;31;40m\]┏━┅◉ \[\e[4;34m\]\w\[\e[0;40m\] ┅┅◈ \d ⌚ \A \[\e[1;38m\]┅┅◈ \u@\H (\!)\[\e[0m\]\n\[\e[1;31m\]┗━►\[\e[0m\] '



#this will change the title to your full current working directory
PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
# End of: Prompt customization }}} #
