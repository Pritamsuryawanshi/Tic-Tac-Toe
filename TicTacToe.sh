#1/bin/bash
echo "Welcome to the tic-tac-toe game "

#Tic-Tac-Toe array declaration
tic=(- - - - - - - - - -)

#function to reset the board
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

#MAIN

