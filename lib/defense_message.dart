import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;


Random rng;

class DefenseMessage {

  static const String _firstName = 'first_name';

  List<String> _defenseMessages = <String>[];

  void updateDefenseMessages(String url) async {
    var lineSplitter = LineSplitter();
    _defenseMessages = lineSplitter.convert(await http.read(url));
  }

  String getDefenseMessage(message){
    return _defenseMessages[rng.nextInt(_defenseMessages.length)].replaceAll(_firstName, message.from.first_name);
  }

  DefenseMessage() {
    rng = Random();
  }
}
