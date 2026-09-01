

import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {  // puede notificar cuando hay cambios en el estado de la app

// Lista de mensajes que se van a mostrar en la pantalla de chat
List<Message> message = [
  Message(text: 'Hola amor!', fromWho: FromWho.me),
  Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
];

// EL evento de enviar cuando se presione el boton, se va a añadir a este metodo 
Future<void> sendMessage( String text ) async {

}

}