import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
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
                itemCount: 100, // cuantos elementos tengo o se van a mostrar
                itemBuilder: (context, index) {
                  // construye y renderiza los elementos
                  return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : MyMessageBubble(); // pares para sacar espacio si es mio o de ella
                  //return const MyMessageBubble(); // indice dice cual es el elemento que se esta renderizando en el momento
                },
              ),
            ),
            //Caja de texto de mensaje
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
