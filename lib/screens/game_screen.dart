import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
 var _board = ['', '', '', '', '', '', '', '', ''];
 var _currentPlayer = 'X';
 var _winner = '';
 var _playerChoice = '';
 var _scoreX = 0;
 var _scoreO = 0;


 void _startGame(String player) {
    setState(() {
      _playerChoice = player;
      _currentPlayer = player;
    });
 }

 void _playGame(int index) {
    if (_board[index] == '' && _winner == '') {
      setState(() {
        _board[index] = _currentPlayer;
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      });

      _winner = _checkWinner();
      if (_winner != '') {
        if (_winner == 'X') {
          setState(() {
            _scoreX++;
          });
        } else {
          setState(() {
            _scoreO++;
          });
        }
        _showDialog('Game Over', 'Winner is: $_winner');
      } else if (_board.every((cell) => cell != '')) {
        _showDialog('Game Over', 'It\'s a tie!');
      }
    }
 }

 String _checkWinner() {
    // check horizontal lines
    for (int i = 0; i <= 6; i += 3) {
      if (_board[i] != '' &&
          _board[i] == _board[i + 1] &&
          _board[i + 1] == _board[i + 2]) {
        return _board[i];
      }
    }

    // check vertical lines
    for (int i = 0; i < 3; i++) {
      if (_board[i] != '' &&
          _board[i] == _board[i + 3] &&
          _board[i + 3] == _board[i + 6]) {
        return _board[i];
      }
    }

    // check diagonal lines
    if (_board[0] != '' &&
        _board[0] == _board[4] &&
        _board[4] == _board[8]) {
      return _board[0];
    }

    if (_board[2] != '' &&
        _board[2] == _board[4] &&
        _board[4] == _board[6]) {
      return _board[2];
    }

    return '';
 }

 void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(title,
            style: TextStyle(
              color: Colors.blue.shade600,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(message,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          )
          ),
          actions: [
            TextButton(
              child: Text('Reset',
              style: TextStyle(
                color: Colors.blue.shade400,
                fontSize: 21,
              ),
              ),
              onPressed: () {
                setState(() {
                 _board = ['', '', '', '', '', '', '', '', ''];
                 _currentPlayer = _playerChoice == 'X' ? 'X' : 'O';
                 _winner = '';
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
 }

 @override
 Widget build(BuildContext context) {
    if (_playerChoice == '') {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
           backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tic',
            style: TextStyle(
              color: Colors.red,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('Tac',
            style: TextStyle(
              color: Colors.blueAccent.shade700,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              
            ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Toe',
            style: TextStyle(
              color: Colors.red,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              
            ),
            ),
          ],
        ),
        ),
         backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 Text(
                'Pick who goes first',
                style: TextStyle(
                  color: Colors.redAccent.shade700,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2

                  ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 _buildButton('X'),
                 const SizedBox(width: 40),
                 _buildButton('O'),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Tic',
            style: TextStyle(
              color: Colors.red,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('Tac',
            style: TextStyle(
              color: Colors.blueAccent.shade700,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              
            ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Toe',
            style: TextStyle(
              color: Colors.red,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              
            ),
            ),
          ],
        ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Winner',
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$_winner',
                  style: TextStyle(
                    color: Colors.redAccent.shade700,
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                     'Score X\n\t\t\t\t\t$_scoreX',
                     style: TextStyle(
                      color: Colors.red.shade600,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 80),
                    Text(
                     'Score O\n\t\t\t\t\t$_scoreO',
                     style: TextStyle(
                      color: Colors.red.shade600,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: _board.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     childAspectRatio: 1.0,
                     mainAxisSpacing: 10,
                     crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                     return GestureDetector(
                        onTap: () => _playGame(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _winner != '' || _board[index] != ''
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              _board[index],
                              style: TextStyle(
                                fontSize: 45,
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                     );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
           child: Icon(Icons.refresh,
                  color: Colors.red.shade400,
                  size: 35,
              ),
          onPressed: () {
                setState(() {
                 _board = ['', '', '', '', '', '', '', '', ''];
                 _currentPlayer = _playerChoice == 'X' ? 'X' : 'O';
                 _winner = '';
                 _scoreX = 0;
                 _scoreO = 0;
                });
              },
              
        ),
      );
      
    }
 }

 Widget _buildButton(String player) {
    return ElevatedButton(
      onPressed: () => _startGame(player),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue.shade900,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(45),
      ),
      child: Text(
        player,
        style: const TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.w800
          ),
      ),
    );
 }
}