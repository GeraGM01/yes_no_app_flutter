import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// El ChangeNotifier lo que hara es notificar cuando hay cambios para redibujar
class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    ); // creamos una instancia para el mensaje que sera mio, con el texto que se le envie
    messageList.add(newMessage); // se agrega el mensaje a la lista

    //indicamos el cambio a flutter para que se re dibuje, en este caso al ChatScreen
    notifyListeners();
  }
}
