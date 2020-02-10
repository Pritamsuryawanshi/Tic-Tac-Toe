#1/bin/bash
echo "Welcome to the tic-tac-toe game "

#Tic-Tac-Toe array declaration
tic=(- - - - - - - - - -)

#Function to reset the board
function resetTheBoard()
{
	echo "--------------"
	echo "  ${tic[1]} | ${tic[2]} | ${tic[3]}"
	echo "--------------"
	echo "  ${tic[4]} | ${tic[5]} | ${tic[6]}"
	echo "--------------"
	echo "  ${tic[7]} | ${tic[8]} | ${tic[9]}"
	echo "--------------"
}

#Function to assign the signs to players
function assigningTheSigns()
{
	random=$(( RANDOM%2 ))
	if (( random == 0 ))
	then
		player1="x"
		player2="o"
	else
		player1="O"
		player2="x"
	fi
	echo "You have been assigned the $player1"
}

#MAIN

assigningTheSigns
