import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Tic Tac Toe',
home: TicTacToePage(),
);
}
}

class TicTacToePage extends StatefulWidget {
@override
_TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
List<List<String>> _board = [
['', '', ''],
['', '', ''],
['', '', '']
];
String _turn = 'X';
String _result = '';

void _playTurn(int row, int col) {
setState(() {
if (_board[row][col] == '') {
_board[row][col] = _turn;
if (_checkWinner()) {
_result = '$_turn wins!';
} else if (_checkDraw()) {
_result = 'Draw';
} else {
_turn = _turn == 'X' ? 'O' : 'X';
}
}
});
}

bool _checkWinner() {
for (int i = 0; i < 3; i++) {
if (_board[i][0] == _turn &&
_board[i][1] == _turn &&
_board[i][2] == _turn) {
return true;
}
if (_board[0][i] == _turn &&
_board[1][i] == _turn &&
_board[2][i] == _turn) {
return true;
}
}
if (_board[0][0] == _turn &&
_board[1][1] == _turn &&
_board[2][2] == _turn) {
return true;
}
if (_board[0][2] == _turn &&
_board[1][1] == _turn &&
_board[2][0] == _turn) {
return true;
}
return false;
}

bool _checkDraw() {
for (int i = 0; i < 3; i++) {
for (int j = 0; j < 3; j++) {
if (_board[i][j] == '') {
return false;
}
}
}
return true;
}

void _resetGame() {
setState(() {
_board = [
['', '', ''],
['', '', ''],
['', '', '']
];
_turn = 'X';
_result = '';
});
}

@override
Widget build(BuildContext context) {
return Scaffold(appBar: AppBar(
title: Text('Tic Tac Toe'),
),
body: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
Expanded(
child: Container(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(
'Turn: $_turn',
style: TextStyle(
fontSize: 24.0,
fontWeight: FontWeight.bold),
),
Text(
'Result: $_result',
style: TextStyle(
fontSize: 24.0,
fontWeight: FontWeight.bold),
),
],
),
),
),
Expanded(
flex: 4,
child: GridView.builder(
gridDelegate:
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 3),
itemCount: 9,
itemBuilder: (BuildContext context, int index) {
int row = index ~/ 3;
int col = index % 3;
return GestureDetector(
onTap: () => _playTurn(row, col),
child: Container(
decoration: BoxDecoration(
border: Border.all(width: 1.0)),
child: Center(
child: Text(
'${_board[row][col]}',
style: TextStyle(
fontSize: 32.0,
fontWeight: FontWeight.bold),
),
),
),
);
},
),
),
Expanded(
child: Container(
child: ElevatedButton(
onPressed: _resetGame,
child: Text(
'Reset',
style: TextStyle(
fontSize: 24.0,
fontWeight: FontWeight.bold),
),
),
),
)
],
),
);
}
}