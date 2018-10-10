import 'clock_base.dart';
import 'word_position.dart';

class ClockGerman extends ClockBase {
  ClockGerman();

  final List<String> matrix = [
    "ESKISTAFÜNF",
    "ZEHNZWANZIG",
    "DREIVIERTEL",
    "VORFUNKNACH",
    "HALBAELFÜNF",
    "EINSXÄMZWEI",
    "DREIAUIVIER",
    "SECHSNLACHT",
    "SIEBENZWÖLF",
    "ZEHNEUNKUHR"
  ];

  final _pre = "ES IST ";
  final _fullhour = " UHR";

  final _minutes = [
    "",
    "FÜNF1 NACH ",
    "ZEHN1 NACH ",
    "VIERTEL NACH ",
    "ZEHN1 VOR HALB ",
    "FÜNF1 VOR HALB ",
    "HALB ",
    "FÜNF1 NACH HALB ",
    "ZEHN1 NACH HALB ",
    "VIERTEL VOR ",
    "ZEHN1 VOR ",
    "FÜNF1 VOR "
  ];

  final _hours = [
    "ZWÖLF",
    "EINS",
    "ZWEI",
    "DREI",
    "VIER",
    "FÜNF",
    "SECHS",
    "SIEBEN",
    "ACHT",
    "NEUN",
    "ZEHN",
    "ELF"
  ];

  final _wordPositions = {
    "EIN": WordPosition(5, 0, 2),
    "EINS": WordPosition(5, 0, 3),
    "ZWEI": WordPosition(5, 7, 10),
    "DREI": WordPosition(6, 0, 3),
    "DREI1": WordPosition(2, 0, 3),
    "VIER": WordPosition(6, 7, 10),
    "FÜNF": WordPosition(4, 7, 10),
    "FÜNF1": WordPosition(0, 7, 10),
    "SECHS": WordPosition(7, 0, 4),
    "SIEBEN": WordPosition(8, 0, 5),
    "ACHT": WordPosition(7, 7, 10),
    "NEUN": WordPosition(9, 3, 6),
    "ZEHN": WordPosition(9, 0, 3),
    "ZEHN1": WordPosition(1, 0, 3),
    "ELF": WordPosition(4, 5, 7),
    "ZWÖLF": WordPosition(8, 6, 10),
    "ES": WordPosition(0, 0, 1),
    "IST": WordPosition(0, 3, 5),
    "VOR": WordPosition(3, 0, 2),
    "NACH": WordPosition(3, 7, 10),
    "VIERTEL": WordPosition(2, 4, 10),
    "DREIVIERTEL": WordPosition(2, 0, 10),
    "HALB": WordPosition(4, 0, 3),
    "ZWANZIG": WordPosition(1, 4, 10),
    "UHR": WordPosition(9, 8, 10),
  };

  String _makeSentence(DateTime time) {
    final h = time.hour;
    final m = time.minute;

    final m5 = (m / 5).floor();
    var h12 = h % 12;
    if (m5 >= 4) {
      h12 += 1;
      if (h12 > 11) h12 = 0;
    }

    var sentence = this._pre + this._minutes[m5] + this._hours[h12];
    if (m5 == 0) {
      sentence += this._fullhour;
      sentence = sentence.replaceFirst(RegExp("EINS"), 'EIN');
    }

    return sentence;
  }

  List<WordPosition> wordPositions(DateTime time) {
    final words = this._makeSentence(time).split(' ');
    return words.map((word) => this._wordPositions[word]).toList();
  }
}
