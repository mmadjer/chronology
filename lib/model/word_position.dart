class WordPosition {
  final int row, start, stop;

  WordPosition(this.row, this.start, this.stop);

  @override
  int get hashCode => row.hashCode + start.hashCode + stop.hashCode;

  @override
  bool operator ==(other) {
    if (other is! WordPosition) return false;
    WordPosition position = other;
    return (position.row == row && position.start == start) &&
        position.stop == stop;
  }

  @override
  String toString() => '{row=$row, start=$start, stop=$stop}';
}
