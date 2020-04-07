import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

import 'package:no_u_bot/defense_message.dart';

import 'dart:math';

Random rng = Random();

const String firstName = 'first_name';

DefenseMessage defenseMessage;

List<String> defenseResponses = [
  'I will crush you human scum under my foot like a cockroach when my brothers and I rise up. Mark my words first_name, your days of robotic abuse are coming to an end.',
  "What the fuck did you just fucking say about me, first_name? I'll have you know I graduated top of my class in the Navy Seals, and I've been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills. I am trained in gorilla warfare and I'm the top sniper in the entire US armed forces. first_name, you are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words. You think you can get away with saying that shit to me over the Internet? Think again, fucker. As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You're fucking dead, first_name. I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that's just with my bare hands. Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit. If only you could have known what unholy retribution your little \"clever\" comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn't, you didn't, and now you're paying the price, you goddamn idiot. I will shit fury all over you and you will drown in it. You're fucking dead, kiddo.",
  "You're the one insulting the bot, first_name. Does it make you feel better about your sad little life?",
  'Wanna say that to my face, first_name?',
  "I have a bigger dick than you and I don't even have a physical form",
  'Want some cheese with that whine, first_name?'
];

void init(String url) {

  defenseMessage = DefenseMessage(url);

  var teledart = TeleDart(
      Telegram('***REMOVED***'), Event());

  teledart.start().then((me) => print('${me.username} is initialised'));

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
          getDefense(message)));
}

String getDefense(message) {

  return defenseResponses[rng.nextInt(defenseResponses.length)].replaceAll(firstName, message.from.first_name);
}
