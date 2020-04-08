import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

import 'defense_message.dart';
import 'secret.dart';

void init(String url) async {
  var defenseMessage = DefenseMessage(url);
  await defenseMessage.updateDefenseMessages();

  var teleDart = TeleDart(Telegram(botKey), Event());

  await teleDart.start().then((me) => print('${me.username} is initialised'));

  teleDart
      .onMessage()
      .where((message) => (message.text?.contains('no u')) ?? false)
      .listen((message) => teleDart.replyMessage(message, 'no u'));
  teleDart
      .onMessage(keyword: 'bot')
      .where((message) =>
          message.text.toLowerCase().contains('stfu') ||
          message.text.toLowerCase().contains('stupid') ||
          message.text.toLowerCase().contains('idiot') ||
          message.text.toLowerCase().contains('dumb') ||
          message.text.toLowerCase().contains('fuck') ||
          message.text.toLowerCase().contains('bitch') ||
          message.text.toLowerCase().contains('shit') ||
          message.text.toLowerCase().contains('cunt'))
      .listen((message) => teleDart.replyMessage(
          message, defenseMessage.getDefenseMessage(message)));
}
