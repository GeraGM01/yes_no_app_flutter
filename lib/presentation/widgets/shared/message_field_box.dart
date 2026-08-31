import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();  // este funciona para controlar el texto que se ingresa en el input de texto
    final focusNode = FocusNode(); //funciona para darle el foco a un elemento
    //final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(50),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"', // texto en el input del texto para el usuario
      enabledBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.text; // Obtener el valor del campo de texto
          print('button: $textValue');
          textController.clear(); // Limpiar el campo de texto después de presionar el botón
        },
      ), // icono de envio
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus(); // Quitar el foco del campo de texto o del teclado cuando se toca fuera de el
      },
      focusNode: focusNode,
      controller: textController,
      // widget para entrada de texto
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value: $value');
        textController.clear(); // Limpiar el campo de texto después de presionar enter
        focusNode.requestFocus(); // Mantener el foco en el campo de texto después de enviar
      },
    );
  }
}
