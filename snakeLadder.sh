#!/bin/bash  -x 


WINNING_POSITION=100;
snake=1;
ladder=2;
noPlay=0;
count=0
firstPlayer=0;
secondPlayer=0;

declare -A playerRecord
function die()
{
   echo $(($((RANDOM %6))+1))
}
function condiationCheck
{
	position=$1

	if (( $position < 0 ))
	then
		position=0;
	fi
	if (( $position>100 ))
	then
		position=$(($position-$2))
	fi
	echo $position

}
function	playerMove()
{
	dieNo=$(die)
	((count++))
		flag=$1;
		playerPosition=0
		
		case $((RANDOM %3)) in
			$snake)
				playerPosition=$(($playerPosition-$dieNo))
					;;
			$ladder)
				playerPosition=$(($playerPosition+$dieNo))
					;;
			$noPlay)
					;;
		esac

		if (( $flag==0 ))
		then
			firstPlayer=$(($firstPlayer +$playerPosition))			
			firstPlayer=$(condiationCheck $firstPlayer $dieNo)
			playerRecord[DieNo:"$dieNo"]="player 1:$firstPlayer"
		fi
		if (( $flag==1 ))
		then
			secondPlayer=$(($secondPlayer +$playerPosition))
			secondPlayer=$(condiationCheck $secondPlayer $dieNo)
			playerRecord[DieNo:"$dieNo"]="player 2:$secondPlayer"
		fi
}
while (( $firstPlayer != $WINNING_POSITION && $secondPlayer != $WINNING_POSITION  ))
do
		playerMove 0
		playerMove 1
		if (( $firstPlayer==100 ))
		then
			echo "player 1 Win"
			
		fi
		if (( $secondPlayer==100 ))
		then
				echo "player 2 win "
				
		fi
done

