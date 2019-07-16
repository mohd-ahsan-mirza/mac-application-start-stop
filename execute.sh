if [ -z ${1+x} ]; 
  then 
    echo "Name of the application is required";
    exit 0; 
fi

SERVICE=$1
if [[ $(pmset -g ps | head -1) =~ "AC Power" ]]
then
  if [ -z ${2+x} ];
    then
      echo "Battery percentage threshold is required";
      exit 0;
  fi
  if [[ $(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1) -gt $2 ]]
  then 
    if ! pgrep "$SERVICE" >/dev/null 2>&1 ; then
      open -a "$SERVICE"
    fi
  fi
else
  if pgrep "$SERVICE" >/dev/null 2>&1 ; then 
    killall "$SERVICE"
  fi 
fi
