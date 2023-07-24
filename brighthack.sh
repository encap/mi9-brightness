#!/system/bin/sh

# This script checks the current brightness
# and sets the desired values.

BRIGHTNESS_FILE=/sys/class/backlight/panel0-backlight/brightness

BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})

#echo $BRIGHTNESS

if [[ ${BRIGHTNESS} -le 9 ]]; then
  echo 1 > ${BRIGHTNESS_FILE}
elif [[ ${BRIGHTNESS} -ge 10 && ${BRIGHTNESS} -le 16 ]]; then
  OFFSET=$((BRIGHTNESS - 9))
  echo $OFFSET > ${BRIGHTNESS_FILE}
elif [[ ${BRIGHTNESS} -eq 17 ]]; then
  echo 13 > ${BRIGHTNESS_FILE}
elif [[ ${BRIGHTNESS} -eq 18 ]]; then
  echo 15 > ${BRIGHTNESS_FILE}
elif [[ ${BRIGHTNESS} -eq 19 ]]; then
  echo 17 > ${BRIGHTNESS_FILE}
fi

exit 0
