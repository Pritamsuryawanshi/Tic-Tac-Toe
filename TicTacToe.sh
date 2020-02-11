#!/bin/bash 
echo "Welcome to the tic-tac-toe game "

#VARIABLES
count=0

#Tic-Tac-Toe array declaration
gameBoard=(- - - - - - - - - -)

#Function to reset the board
function displayTheBoard()
{
	echo "--------------"
	echo "  ${gameBoard[1]} | ${gameBoard[2]} | ${gameBoard[3]}"
	echo "--------------"
	echo "  ${gameBoard[4]} | ${gameBoard[5]} | ${gameBoard[6]}"
	echo "--------------"
	echo "  ${gameBoard[7]} | ${gameBoard[8]} | ${gameBoard[9]}"
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
	if [[ ${gameBoard[$positionNumber]} == "-" ]]
	then
		gameBoard[$positionNumber]="$1"
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
if [[ "${gameBoard[$i]}" == "${gameBoard[$i+1]}" &&  "${gameBoard[$i]}" == "${gameBoard[$i+2]}" ]] && [[ "${gameBoard[$i]}" != "-" ]] && (( i == 1 || i == 4 || i == 7 ))
	then
		echo "You've won"
		exit
	fi
}


#Function to check winning condition for rows
function winningConditionForColumns()
{
	if [[ "${gameBoard[$i]}" == "${gameBoard[$i+3]}" && "${gameBoard[$i]}" == "${gameBoard[$i+6]}" ]] && [[ "${gameBoard[$i]}" != "-" ]] && (( i>=1 && i<=3 ))
	then
		echo "You've won"
		exit
	fi
}
#Function to check winning condition for Diagonals
function winningConditionForDiagonals()
{
	if [[ "${gameBoard[1]}" == "${gameBoard[5]}" ]] && [[ "${gameBoard[5]}" == "${gameBoard[9]}" ]] && [[ "${gameBoard[1]}" != "-" ]]
	then
		echo "You've won"
		exit
	elif [[ "${gameBoard[3]}" == "${gameBoard[5]}" ]] && [[ "${gameBoard[5]}" == "${gameBoard[7]}" ]] && [[ "${gameBoard[3]}" != "-" ]]
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
