import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message; // El argumento que vas a recibir
  const MyMessageBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // el primer tema que encuentre es el que usara
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .end, //Alineamos a la derecha cada columna o mensaje
      children: [
        Container(
          //Contenedor que combina todo lo usado en uno solo
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(
              20,
            ), // bordes redondeados a los mensajes
          ),
          child: Padding(
            //padding para el texto, no se vea muy junto
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ), // Sepaacion entre cada elemento de 10 para que se vea espaciado entre cada renglon
      ],
    );
  }
}
