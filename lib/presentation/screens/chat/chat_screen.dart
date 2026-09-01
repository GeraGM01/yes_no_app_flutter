import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

// Al ser un screen es un Scaffold
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          //Es el espaciado al extremo izquierdo del appbar
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            // widget circular para una foto de perfil
            backgroundImage: NetworkImage(
              'https://tecolotito.elsiglodedurango.com.mx/cdn-cgi/image/format=auto,width=1024/i/2024/03/1251971.jpeg',
            ),
          ),
        ),
        title: Text('Beli bb ♥'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  // Es un StalessWidget por que el widget no maneja el estado, quien lo maneja sera el provider
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>(); // definicion del provider

    return SafeArea(
      // Area segura para que el contenido no se vaya a los botones etc
      child: Padding(
        // Pading para que no vaya a quedar pegado el contenido a los bordes de la pantalla
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //Columna para colocar varios widgets internos uno debajo del otro
          children: [
            // Lista de widgets que estaran uno debajo dle otro
            Expanded(
              //Expanden hace que se estire y ocupe todo el espacio sobrante/disponible de la pantalla sin aplastar a elementos vecinos
              child: ListView.builder(
                //Dibujado bajo demanda de los elementos que seran visibles en pantalla en ese momento
                itemCount: chatProvider.messageList.length, // cuantos elementos tengo o se van a mostrar
                itemBuilder: (context, index) {
                  // construye y renderiza los elementos
                  final message = chatProvider.messageList[index];// aqui se va a saber de quien es el mensaje
                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble()
                    : MyMessageBubble( message : message );
                  //return const MyMessageBubble(); // indice dice cual es el elemento que se esta renderizando en el momento
                },
              ),
            ),
            //Caja de texto de mensaje
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}

