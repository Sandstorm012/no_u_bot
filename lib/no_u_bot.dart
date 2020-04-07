import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

import 'package:no_u_bot/defense_message.dart';

DefenseMessage defenseMessage;

void init(String url) async{

  defenseMessage = DefenseMessage(url);
  await defenseMessage.updateDefenseMessages();

  var teledart = TeleDart(
      Telegram('***REMOVED***'), Event());

  await teledart.start().then((me) => print('${me.username} is initialised'));

  teledart
      .onMessage()
      .where((message) => (message.text?.contains('no u')) ?? false)
      .listen((message) => teledart.replyMessage(message, 'no u'));
  teledart
      .onMessage(keyword: 'bot')
      .where((message) =>
  message.text.toLowerCase().contains('stfu') ||
      message.text.toLowerCase().contains('stupid') ||
      message.text.toLowerCase().contains('idiot') ||
      message.text.toLowerCase().contains('dumb') ||
      message.text.toLowerCase().contains('fuck') ||
      message.text.toLowerCase().contains('bitch') ||
      message.text.toLowerCase().contains('shit'))
      .listen((message) =>
      teledart.replyMessage(message,
          defenseMessage.getDefenseMessage(message)));
}


