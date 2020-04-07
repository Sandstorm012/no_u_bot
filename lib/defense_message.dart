import "dart:html" ;
import 'dart:convert';
import 'dart:io';

class DefenseMessage{


  List<String> defenseMessages;
  String url;



  DefenseMessage(this.url){
    HttpClient().getUrl(Uri.parse(url))
        .then((HttpClientRequest request) => request.close())
        .then((HttpClientResponse response) => response.transform(Utf8Decoder())
        .listen(print));
  }








}