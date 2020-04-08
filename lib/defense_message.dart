import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;

class DefenseMessage {
  static const String _firstName = 'first_name';
  static const int _updateDifference = 24;

  String url;

  Random _rng;
  DateTime _lastUpdated;
  List<String> _defenseMessages = <String>[];

  void updateDefenseMessages() async {
    _defenseMessages =
        LineSplitter().convert(await http.read(url)) ?? _defenseMessages;
    _lastUpdated = DateTime.now();
  }

  String getDefenseMessage(message) {
    // update list of responses every 24 hours
    if (_lastUpdated.difference(DateTime.now()).inHours >= _updateDifference) {
      updateDefenseMessages();
    }
    return _defenseMessages[_rng.nextInt(_defenseMessages.length)]
        .replaceAll(_firstName, message.from.first_name);
  }

  DefenseMessage(this.url) {
    _rng = Random();
  }
}
