# Tick-Tac-Toe

Just replace your main.dart file with this one and you are good to go.

The code is a Tic Tac Toe game written in Dart using the Flutter framework. It consists of two main classes: TicTacToeApp and TicTacToePage.

The TicTacToeApp class is a stateless widget that returns a MaterialApp with a title "Tic Tac Toe" and a home screen of TicTacToePage.

The TicTacToePage class is a stateful widget that holds the current state of the game, which includes the 3x3 board represented as a list of lists of strings, the turn of the current player represented as a string, and the result of the game represented as a string.

The game logic is implemented in the _TicTacToePageState class, which is the state object of the TicTacToePage class. It includes methods for playing a turn, checking for a winner, checking for a draw, and resetting the game. The playTurn method updates the board and sets the turn, the checkWinner method checks the rows, columns, and diagonals of the board to see if there is a winner, the checkDraw method checks if all the cells on the board are filled, and the resetGame method resets the board, turn, and result back to their initial state.

The UI of the game is implemented in the build method of the _TicTacToePageState class. It returns a Scaffold widget that displays the game board and the result. The game board is represented as a GridView of buttons, where each button displays the symbol of the current player or an empty string if no player has played in that cell. The result of the game is displayed at the bottom of the screen, along with a button to reset the game.


# Here is an exapmle

![image](https://user-images.githubusercontent.com/88718611/216068322-0123c9d4-2296-4e4f-a4bc-8415b3dbac3d.png)
