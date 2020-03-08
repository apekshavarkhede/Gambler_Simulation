#!/bin/bash -x
echo "Welcome To Gambler Simulation:"
stake=100;
chances=0;
winCount=0;
lossCount=0;
chances=0;

function play()
{
	number=$(( RANDOM % 2 ))
	((chances++))
		if [ $number -eq 1 ]
		then
			((winCount++))
			((stake++))
		elif [ $number -eq 0 ]
		then
			((lossCount++))
			((stake--))
		fi;
}
play
