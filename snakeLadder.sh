#!/bin/bash  -x 
WINNING_POSITION=100;
START_POSITION=0;
SNAKE=1;
LADDER=2;
NOPLAY=0;
count=0
firstPlayer=0;
secondPlayer=0;

declare -A playerRecord
function die()
{
   echo $(($((RANDOM %6))+1))
}
function conditionCheck
{
	position=$1

	if (( $position < $START_POSITION ))
	then
		position=0;
	fi
	if (( $position>$WINNING_POSITION ))
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
			$SNAKE)
				playerPosition=$(($playerPosition-$dieNo))
					;;
			$LADDER)
				playerPosition=$(($playerPosition+$dieNo))
					;;
			$NOPLAY)
					;;
		esac

		if (( $flag==0 ))
		then
			firstPlayer=$(($firstPlayer +$playerPosition))
			firstPlayer=$(conditionCheck $firstPlayer $dieNo)
			playerRecord[DieNo:"$dieNo"]="player 1:$firstPlayer"
		fi
		if (( $flag==1 ))
		then
			secondPlayer=$(($secondPlayer +$playerPosition))
			secondPlayer=$(conditionCheck $secondPlayer $dieNo)
			playerRecord[DieNo:"$dieNo"]="player 2:$secondPlayer"
		fi
}
while (( $firstPlayer != $WINNING_POSITION && $secondPlayer != $WINNING_POSITION  ))
do
		playerMove 0
		playerMove 1
		if (( $firstPlayer==$WINNING_POSITION ))
		then
			echo "player 1 Win"
		fi
		if (( $secondPlayer==$WINNING_POSITION ))
		then
				echo "player 2 win "
		fi
done
