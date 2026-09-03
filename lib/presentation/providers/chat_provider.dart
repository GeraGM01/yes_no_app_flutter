import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// El ChangeNotifier lo que hara es notificar cuando hay cambios para redibujar
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController(); //permite tener el control de un unico scroll
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    ); // creamos una instancia para el mensaje que sera mio, con el texto que se le envie
    messageList.add(newMessage); // se agrega el mensaje a la lista

    if (text.endsWith('?')) {
      herReply(); //
    }

    //indicamos el cambio a flutter para que se re dibuje, en este caso al ChatScreen
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer(); // este getReply se va a lanzar cuando se detecte que el mensaje es una pregunta

    final Message mensajeElla = Message(
      text: herMessage.text,
      fromWho: FromWho.hers,
      imageUrl: herMessage.imageUrl, //¡Aquí pasamos la URL de la imagen al mensaje
    );
    
    messageList.add(mensajeElla);
    
    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    // delay para que pueda hacer bien el scroll sin trabarse
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController
          .position
          .maxScrollExtent, // Va a ir a lo maximo que se pueda dar el scroll
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
