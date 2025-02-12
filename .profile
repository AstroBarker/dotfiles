if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty3 ]]; then 
  exec startx; 
fi
