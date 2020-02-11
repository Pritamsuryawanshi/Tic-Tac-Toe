#!/bin/bash 
echo "Welcome to the tic-tac-toe game "

#VARIABLES
count=0

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

#Function to check if the place is empty or occupied
function isEmpty()
{
	if [[ ${board[$positionNumber]} == "-" ]]
	then
		board[$positionNumber]="$1"
		((count++))
		echo "count is $count"
	else
		echo "it's already occupied choose another one"
	fi
	displayTheBoard
}

#Function to play the game
function play()
{
	while [ count != 10 ]
	do
		read -p "enter the position to tick: " positionNumber
		isEmpty "X"
		if (( count > 2 ))
		then
			winningCondition
		fi
	done

}

#Function to check winning condition for rows
function winningConditionForRows()
{
	if [[ "${board[$i]}" == "${board[$i+1]}" &&  "${board[$i]}" == "${board[$i+2]}" ]] && [[ "${board[$i]}" != "-" ]] && (( i == 1 || i == 4 || i == 7 ))
	then
		echo "You've won"
		exit
	fi
}


#Function to check winning condition for rows
function winningConditionForColumns()
{
	if [[ "${board[$i]}" == "${board[$i+3]}" && "${board[$i]}" == "${board[$i+6]}" ]] && [[ "${board[$i]}" != "-" ]] && (( i>=1 && i<=3 ))
	then
		echo "You've won"
		exit
	fi
}
#Function to check winning condition for Diagonals
function winningConditionForDiagonals()
{
	if [[ "${board[1]}" == "${board[5]}" ]] && [[ "${board[5]}" == "${board[9]}" ]] && [[ "${board[1]}" != "-" ]]
	then
		echo "You've won"
		exit
	elif [[ "${board[3]}" == "${board[5]}" ]] && [[ "${board[5]}" == "${board[7]}" ]] && [[ "${board[3]}" != "-" ]]
	then
		echo "You've won"
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
		winningConditionForRows
		winningConditionForColumns
		winningConditionForDiagonals
		conditionForTie
	done
}

#MAIN
displayTheBoard
play
