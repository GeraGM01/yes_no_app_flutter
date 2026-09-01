import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// El ChangeNotifier lo que hara es notificar cuando hay cambios para redibujar
class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage( String text ) async {
    // TODO: implementar metodo
  }

}
