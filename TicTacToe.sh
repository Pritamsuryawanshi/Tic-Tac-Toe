#!/bin/bash 
echo " Welcome to the tic-tac-toe game "

#VARIABLES
count=0
flag=true

#Tic-Tac-Toe array declaration
board=(- - - - - - - - - -)

#Function to reset the board
function displayTheBoard()
{
	echo "--------------"
	echo "  ${board[1]} | ${board[2]} | ${board[3]}"
	echo "--------------"
	echo "  ${board[4]} | ${board[5]} | ${board[6]}"
	echo "--------------"
	echo "  ${board[7]} | ${board[8]} | ${board[9]}"
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
		player1="X"
		computer="O"
		flag=true
	else
		player1="O"
		computer="X"
		flag=false
	fi
	echo "You have been assigned the $player1"
}

#Function to check if the place is empty or occupied
function isEmpty()
{
	if [[ ${board[$2]} == "-" ]]
	then
		board[$2]="$1"
		((count++))
	else
		echo "it's already occupied choose another one"
		play
	fi
	displayTheBoard
}

#Function to play the game
function play()
{
	while [ count != 10 ]
	do
		if [[ $flag == true ]]
		then
		player=user
		currentPlayer=$player1
		read -p "enter the position to tick: " positionNumber
		isEmpty $currentPlayer $positionNumber 
		flag=false
		else
		player=computer
		currentPlayer=$computer
		isEmpty $currentPlayer $((RANDOM%9+1))
		flag=true
		fi
		winningCondition $player
		conditionForTie
	done
}

#Function to check winning condition for rows
function winningConditionForRows()
{
	if [[ "${board[$i]}" == "${board[$i+1]}" &&  "${board[$i]}" == "${board[$i+2]}" ]] && [[ "${board[$i]}" != "-" ]] && (( i == 1 || i == 4 || i == 7 ))
	then
		echo "$1 has won"
		exit
	fi
}


#Function to check winning condition for rows
function winningConditionForColumns()
{
	if [[ "${board[$i]}" == "${board[$i+3]}" && "${board[$i]}" == "${board[$i+6]}" ]] && [[ "${board[$i]}" != "-" ]] && (( i>=1 && i<=3 ))
	then
		echo "$1 has won"
		exit
	fi
}
#Function to check winning condition for Diagonals
function winningConditionForDiagonals()
{
	if [[ "${board[1]}" == "${board[5]}" ]] && [[ "${board[5]}" == "${board[9]}" ]] && [[ "${board[1]}" != "-" ]]
	then
		echo "$1 has won"
		exit
	elif [[ "${board[3]}" == "${board[5]}" ]] && [[ "${board[5]}" == "${board[7]}" ]] && [[ "${board[3]}" != "-" ]]
	then
		echo "$1 has won"
		exit
	fi
}

#Function to check for tie
function conditionForTie()
{
	if (( count == 9 ))
	then
		echo "It's a tie"
		exit
	fi
}

#Function to check the winning condition 
function winningCondition()
{
	for (( i=1; i<=9 ;i++ ))
	do
		winningConditionForRows $1
		winningConditionForColumns $1
		winningConditionForDiagonals $1
	done
}

#MAIN
displayTheBoard
assigningTheSigns
play
