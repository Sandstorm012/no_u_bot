import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:pedantic/pedantic.dart';

import 'package:http/http.dart' as http;

class DefenseMessage {
  static const String _firstName = 'first_name';
  static const int _updateDifference = 24;

  String url;

  Random _rng;
  DateTime _lastUpdated;
  List<String> _defenseMessages = <String>[];

  Future<void> updateDefenseMessages() async {
    var newDefenseMessages = LineSplitter().convert(await http
        .read(url)
        .timeout(Duration(minutes: 1))
        .catchError((error) => print(error)));
    if (newDefenseMessages.isNotEmpty) {
      _defenseMessages = newDefenseMessages;
    }
    _lastUpdated = DateTime.now();
    print('defense message update complete');
  }

  Future<String> getDefenseMessage(message) async {
    // update list of responses every 24 hours
    if (_lastUpdated.difference(DateTime.now()).inHours >= _updateDifference) {
      print('updating defense messages...');
      unawaited(updateDefenseMessages());
    }
    return _defenseMessages[_rng.nextInt(_defenseMessages.length)]
        .replaceAll(_firstName, message.from.first_name);
  }

  DefenseMessage(this.url) {
    _rng = Random();
  }
}
