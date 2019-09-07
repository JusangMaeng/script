#!/bin/sh

orgx=0
orgy=0
orgwdith=1920
orgheight=1080

screen_x=0
screen_y=0
screen_wdith=1920
screen_height=1080



scroll_h=10
turn_down=0

min_height=1080
max_height=30

func_up()
{
	screen_y=`expr $screen_y - $scroll_h`
	screen_height=`expr $screen_height + $scroll_h`
	echo "setdisp $orgx $orgy $orgwdith $screen_height $screen_x $screen_y $screen_wdith $screen_height"
}

func_down()
{
	screen_y=`expr $screen_y + $scroll_h`
	screen_height=`expr $screen_height - $scroll_h`
	echo "setdisp $orgx $orgy $orgwdith $screen_height $screen_x $screen_y $screen_wdith $screen_height"
}

while [ TRUE ] ; do
	if [ $screen_y -ge $min_height ]; then
		turn_down=1
	elif [ $screen_y -le $max_height ]; then
		turn_down=0
	fi
	
	if [ $turn_down -eq 1 ]; then
		func_up
		sleep 0.1
	else
		func_down
		sleep 0.1
	fi
done

