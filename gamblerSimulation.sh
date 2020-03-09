#!/bin/bash -x
echo "Welcome To Gambler Simulation:"
stake=100;
halfOfStake=$(( $stake - $stake/2 ))
fullStake=$(( $stake + $stake/2 ))
winMoney=0;
looseMoney=0;
days=20;
function play()
{
	number=$(( RANDOM % 2 ))
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

for (( day=1; day<=$days; day++ ))
do
	while [[ $stake -lt $fullStake && $stake -gt $halfOfStake ]]
	do
		play
	done
done

echo  "You Win:: Rs.$winMoney You Lost::Rs.$looseMoney"



