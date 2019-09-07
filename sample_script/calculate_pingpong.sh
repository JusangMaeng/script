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
turn_up=1

min_height=30
max_height=1080

func_down()
{
	screen_y=`expr $screen_y - $scroll_h`
	screen_height=`expr $screen_height + $scroll_h`
	echo "setdisp $orgx $orgy $orgwdith $screen_height $screen_x $screen_y $screen_wdith $screen_height"
	if [ $screen_height -ge $max_height ]; then # ge >= le <=
		turn_up=1
		echo "up"
	fi
}

func_up()
{
	screen_y=`expr $screen_y + $scroll_h`
	screen_height=`expr $screen_height - $scroll_h`
	echo "setdisp $orgx $orgy $orgwdith $screen_height $screen_x $screen_y $screen_wdith $screen_height"
	if [ $screen_height -le $min_height ]; then # ge >= le <=
		turn_up=0
		echo "down"
	fi
}

while [ TRUE ] ; do
	if [ $turn_up -eq 1 ]; then
		func_up
		sleep 0.05
	else
		func_down
		sleep 0.05
	fi
done

