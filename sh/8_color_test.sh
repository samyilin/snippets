#!/bin/sh
#
#    This is slightly altered from the original which is found here:
#    http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
#
#    Each line is the color code of one foreground color, out of 17
#    (default + 16 escapes), followed by a test use of that color
#    on all nine background colors (default + 8 escapes).
#
# Retreved from https://gist.github.com/sdeaton2/8450564 and heavily
# modified to be POSIX compatible

text="xYz"; # Some test text
printf  "\n            40m   41m   42m   43m   44m   45m   46m   47m\n";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m'; do
    space=" "  
    printf  '%s \033[%s %s' "$FGs" "${FGs#${FGs%%[![:space:]]*}}" "$text"
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
        printf  '%s \033[%s\033[%s %s \033[0m' "$EINS" "${FGs#${FGs%%[![:space:]]*}}"  "$BG" "$text"
    done
    echo
done
echo
