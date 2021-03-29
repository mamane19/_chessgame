import 'package:chess/chess.dart' as che;

String makeMove(String fen, dynamic move) {
  final _chess = che.Chess.fromFEN(fen);

  if (_chess.move(move)) {
    return _chess.fen;
  } else
    return null;
}

String getRandomMove(String fen) {
  final _chess = che.Chess.fromFEN(fen);
  final _moves = _chess.moves();
  if (_moves.isEmpty) {
    return null;
  } else {
    _moves.shuffle();
    return _moves.first;
  }
}
