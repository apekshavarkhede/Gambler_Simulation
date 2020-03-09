#!/bin/bash -x
echo "Welcome To Gambler Simulation:"
stake=100;
chances=0;
winMoney=0;
looseMoney=0;
chances=0;
Days=20
halfOfStake=$(( $stake - $stake/2 ))
fullStake=$(( $stake + $stake/2 ))

function play()
{
	number=$(( RANDOM % 2 ))
	((chances++))
		if [ $number -eq 1 ]
		then
			((winMoney++))
			((stake++))
		elif [ $number -eq 0 ]
		then
			((looseMoney++))
			((stake--))
		fi;
}

while [[ $stake -lt $fullStake && $stake -gt $halfOfStake ]]
do
play
done

if [ $stake -eq $fullStake ]
then
	echo "You win halfOfStake, So u have to resign for the day"
elif [ $stake -eq $halfOfStake ]
then
	echo "You lost halfOfStake, So u have to resign for the day"
fi;
