import 'package:chessgame/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stateless_chessboard/flutter_stateless_chessboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fen = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chess Game'),
      ),
      body: Center(
        child: Chessboard(
          fen: _fen,
          size: size.width,
          onMove: (_move) {
            final nextFen = makeMove(_fen, {
              'from': _move.from,
              'to': _move.to,
              'promotion': 'q',
            });

            if (nextFen != null) {
              setState(() {
                _fen = nextFen;
              });

              Future.delayed(Duration(milliseconds: 400)).then((_) {
                final nextMove = getRandomMove(_fen);

                if (nextMove != null) {
                  setState(() {
                    _fen = makeMove(_fen, nextMove);
                  });
                }
              });
            }
          },
        ),
      ),
    );
  }
}
