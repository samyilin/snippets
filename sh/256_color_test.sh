#!/bin/sh
# A simple script to display 8-bit color or 256 color codes customized
# in your terminal. 
# Original snippet wasn't POSIX compatible and was riddled with bugs,
# whereas this version executes perfectly. Tested on Bash and busybox
# ash.

i=0
while [ "$((i != 256))" -ne 0 ]; do  
  printf "\033[38;5;${i}mcolor%-5i\033[0m" "$i"  
  printf "     "
  : "$((i = i + 1))"
  if [ $((i%8)) -eq 0 ]; then 
    echo  
  fi 
done

# Alternative: print out color code with all their beauty
i=0
while [ "$((i != 256))" -ne 0 ]; do
  printf "\033[38;5;${i}m"'\\033[38;5;'"$i"m"\033[0m "
  if [ $((i < 10)) -eq 1 ]; then
    printf "  "
  elif [ $((i < 100)) -eq 1 ]; then
    printf " "
  fi
  : "$((i = i + 1))"
  if [ $((i%8)) -eq 0 ]; then
    echo
  fi
done
