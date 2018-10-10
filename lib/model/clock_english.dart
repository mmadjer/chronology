import 'clock_base.dart';
import 'word_position.dart';

class ClockEnglish extends ClockBase {
  ClockEnglish();

  final List<String> matrix = [
    "ITLISASTIME",
    "ACQUARTERDC",
    "TWENTYFIVEX",
    "HALFBTENFTO",
    "PASTERUNINE",
    "ONESIXTHREE",
    "FOURFIVETWO",
    "EIGHTELEVEN",
    "SEVENTWELVE",
    "TENSEƠCLOCK"
  ];

  final _pre = "IT IS ";
  final _fullhour = " ƠCLOCK";

  final _minutes = [
    "",
    "FIVE1 PAST ",
    "TEN1 PAST ",
    "QUARTER PAST ",
    "TWENTY PAST ",
    "TWENTYFIVE PAST ",
    "HALF PAST ",
    "TWENTYFIVE TO ",
    "TWENTY TO ",
    "QUARTER TO ",
    "TEN1 TO ",
    "FIVE1 TO "
  ];

  final _hours = [
    "TWELVE",
    "ONE",
    "TWO",
    "THREE",
    "FOUR",
    "FIVE",
    "SIX",
    "SEVEN",
    "EIGHT",
    "NINE",
    "TEN",
    "ELEVEN"
  ];

  final _wordPositions = {
    "ONE": WordPosition(5, 0, 2),
    "TWO": WordPosition(6, 8, 10),
    "THREE": WordPosition(5, 6, 10),
    "FOUR": WordPosition(6, 0, 3),
    "FIVE": WordPosition(6, 4, 7),
    "FIVE1": WordPosition(2, 6, 9),
    "SIX": WordPosition(5, 3, 5),
    "SEVEN": WordPosition(8, 0, 4),
    "EIGHT": WordPosition(7, 0, 4),
    "NINE": WordPosition(4, 7, 10),
    "TEN": WordPosition(9, 0, 2),
    "TEN1": WordPosition(3, 5, 7),
    "ELEVEN": WordPosition(7, 5, 10),
    "TWELVE": WordPosition(8, 5, 10),
    "IT": WordPosition(0, 0, 1),
    "IS": WordPosition(0, 3, 4),
    "A": WordPosition(1, 0, 0),
    "TO": WordPosition(3, 9, 10),
    "PAST": WordPosition(4, 0, 3),
    "QUARTER": WordPosition(1, 2, 8),
    "HALF": WordPosition(3, 0, 3),
    "TWENTY": WordPosition(2, 0, 5),
    "TWENTYFIVE": WordPosition(2, 0, 9),
    "ƠCLOCK": WordPosition(9, 5, 10),
  };

  String _makeSentence(DateTime time) {
    final h = time.hour;
    final m = time.minute;

    final m5 = (m / 5).floor();
    var h12 = h % 12;
    if (m5 >= 7) {
      h12 += 1;
      if (h12 > 11) h12 = 0;
    }

    var sentence = this._pre + this._minutes[m5] + this._hours[h12];
    if (m5 == 0) {
      sentence += this._fullhour;
    }

    return sentence;
  }

  List<WordPosition> wordPositions(DateTime time) {
    final words = this._makeSentence(time).split(' ');
    return words.map((word) => this._wordPositions[word]).toList();
  }
}
