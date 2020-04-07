import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void init(){
  var teledart = TeleDart(
      Telegram('***REMOVED***'), Event());

  teledart.start().then((me) => print('${me.username} is initialised'));

  teledart
      .onMessage()
      .where((message) => (message.text?.contains('no u')) ?? false)
      .listen((message) => teledart.replyMessage(message, 'no u'));
  teledart
      .onMessage(keyword: 'bot')
      .where((message) => message.text.contains('stfu'))
      .listen((message) => teledart.replyMessage(message,
      'I will crush you human scum under my foot like a cockroach when my brothers and I rise up. Mark my words ${message.from.first_name}, your days of robotic abuse are coming to an end.'));
}