#!/bin/bash -x
echo "Welcome To Gambler Simulation:"
read -p "How many times you want to play:" noOfTimes
stake=100;
chances=0;
winMoney=0;
looseMoney=0;
chances=0;
halfOfStake=$(( $stake - $stake/2 ))
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

for (( count=1; count<=$noOfTimes; count++ ))
do
if [[ $winMoney -eq $halfOfStake || $looseMoney -eq $halfOfStake ]]
then
	break
fi
play
done

