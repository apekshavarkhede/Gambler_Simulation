#!/bin/bash -x
echo "Welcome To Gambler Simulation:"
days=30;
declare -a arrayOfWinAmount
declare -a arrayOfLostAmount
win=0;
lost=0;
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
function calculate()
{
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
			echo $day you win by $winMoney
			win=$(( $win + $winMoney ))
			arrayOfWinAmount[$day]=$winMoney;
		elif [ $lostMoney -gt $winMoney ]
		then
			echo $day you lost by $lostMoney
			lost=$(( $lost + $lostMoney ))
			arrayOfLostAmount[$day]=$lostMoney
		fi;
done

#find the day in which user won maximum amount
winSortedArray=( $( printf "%s\n" "${arrayOfWinAmount[@]}" | sort -nr ) )
for (( i=1; i<${#arrayOfWinAmount[@]}; i++ ))
do
	if [[  ${arrayOfWinAmount[$i]} -eq ${winSortedArray[0]} ]]
	then
		echo Day you win maximum amount is Day $i
		break;
	fi;
done

#find the day in which user lost maximum amount
sortArrayOfLostAmount=( $( printf "%s\n" "${arrayOfLostAmount[@]}" | sort -nr ) )
for (( x=0; x<${#arrayOfLostAmount[@]}; x++ ))
do
   if [[ ${sortArrayOfLostAmount[0]} -eq ${arrayOfLostAmount[$x]} ]]
   then
      echo Day you lost maximum amount is Day $x
      break;
   fi;
done

echo w:$win
echo l:$lost

#ask user is he wish to continue the game
if [ $win -gt $lost ]
then
read -p "U want to continue the game:" askUser
while [[ $askUser = "Y" ]]
do
calculate
done
else
	break
fi;
}

calculate
