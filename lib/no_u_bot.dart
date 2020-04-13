import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';


import 'defense_message.dart';
import 'secret.dart';
//import 'dart:io';

void init(String url) async {
  var defenseMessage = DefenseMessage(url);
  await defenseMessage.updateDefenseMessages();

  var teleDart = TeleDart(Telegram(botKey), Event());

  await teleDart.start().then((me) => print('${me.username} is initialised'));

  teleDart
      .onMessage()
      .where(
          (message) => (message.text?.toLowerCase()?.contains('no u')) ?? false)
      .listen((message) => {
            teleDart.replyMessage(message, 'no u'),
            print(
                '${message.from.username} sent the bot this message: ${message.text}')
          });

//  teleDart.onMessage()
//  .where((message) => message.from?.first_name == 'Haley' ?? false)
//      .listen((message){
//        stdout.write('enter the message to send: ');
//        var reply = stdin.readLineSync();
//        teleDart.replyMessage(message, reply);
//
//  });

  teleDart
      .onMessage(keyword: RegExp('(bot|Bot)'))
      .where((message) =>
          message.text.toLowerCase().contains('stfu') ||
          message.text.toLowerCase().contains('stupid') ||
          message.text.toLowerCase().contains('idiot') ||
          message.text.toLowerCase().contains('dumb') ||
          message.text.toLowerCase().contains('fuck') ||
          message.text.toLowerCase().contains('bitch') ||
          message.text.toLowerCase().contains('shit') ||
          message.text.toLowerCase().contains('cunt'))
      .listen((message) {
    defenseMessage.getDefenseMessage(message).then((response) {
      teleDart.replyMessage(message, response);
    });
    print(
        '${message.from.username} sent the bot this message: ${message.text}');
  });
}
