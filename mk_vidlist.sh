[ "$ACTION" != "download" ] && exit

FILENAME=$ARGUMENT

TS=$(date -d"${FILENAME%.*}" +%s)

time_early=$(date -d 'TZ="America/New_York" '"$d 5am" +%s)
time_late=$(date -d 'TZ="America/New_York" '"$d 9pm" +%s)

if (( TS > time_early && TS < time_late )) ; then
	echo $FILENAME >> $(date -d$TS +%F).lst
fi

echo $FILENAME > .next_fn
mv .next_fn .last_fn
