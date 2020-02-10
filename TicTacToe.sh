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

#Function to generate the random values
function GeneratingRandomValues()
{
	random=$(( RANDOM%2 ))
}

#Function to assign the signs to players
function assigningTheSigns()
{
	GeneratingRandomValues
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

#Function to tossTheCoin
function tossTheCoin()
{
	GeneratingRandomValues
	if (( random == 0))
	then
		echo "player1 will play"
	else
		echo "player2 will play"
	fi
}

#MAIN

resetTheBoard
