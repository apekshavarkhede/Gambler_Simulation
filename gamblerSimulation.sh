#!/bin/bash -x
echo "Welcome To Gambler Simulation:"
days=30;
declare -a WinArray
declare -a lostArray
function play()
{
	number=$(( RANDOM % 2 ))
		if [ $number -eq 1 ]
		then
			((winMoney++))
			((stake++))
		elif [ $number -eq 0 ]
		then
			((lostMoney++))
			((stake--))
		fi;
}

for (( day=1; day<=$days; day++ ))
do
stake=100;
halfOfStake=$(( $stake - $stake/2 ))
fullStake=$(( $stake + $stake/2 ))
winMoney=0;
lostMoney=0;
	while [[ $stake -lt $fullStake && $stake -gt $halfOfStake ]]
	do
		play
	done
		if [ $winMoney -gt $lostMoney ]
		then
			echo $day you win by $(( $winMoney-$lostMoney ))
		elif [ $lostMoney -gt $winMoney ]
		then
			echo $day you lost by $(( $lostMoney-$winMoney ))
		fi;
 		WinArray[$day]=$winMoney;
		lostArray[$day]=$lostMoney
done





