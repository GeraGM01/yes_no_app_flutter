import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(
      context,
    ).colorScheme; // el primer tema que encuentre es el que usara
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .start, //Alineamos a la derecha cada columna o mensaje
      children: [
        Container(
          //Contenedor que combina todo lo usado en uno solo
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(
              20,
            ), // bordes redondeados a los mensajes
          ),
          child: Padding(
            //padding para el texto, no se vea muy junto
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'In consectetur proident ad minim aute officia in irure. Id veniam cillum enim consequat amet veniam do labore non aliquip do dolore. Velit do adipisicing ex ad est minim laborum.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        SizedBox(
          height: 5,
        ), // Sepaacion entre cada elemento de 10 para que se vea espaciado entre cada renglon

        _ImageBubble(),

        SizedBox(
          height: 10,
        ), // Sepaacion entre cada elemento de 10 para que se vea espaciado entre cada renglon
        // Todo: Imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Media query para ajustar a tamaño de pantalla del dispitisivo que lo esta corriendo
    final size = MediaQuery.of(context).size;

    print(size);

    return ClipRRect(
      // este widget permite crear los bordes redondeados de la imagen
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExYmR1eGNtd3F1Z255Z3N2Z2hmdnh2b2wwNmVnYTl2MjVyNHZ3MG5raCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/HmUijcp0bmGOlhStBA/giphy.gif',
        width: size.width * 0.5,
        height: 150,
        fit: BoxFit.cover,
        //loading en tiempo de construccion de la app para un status de carga
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; // si ya se cargo la imagen, la va a retornar

          return Container(
            width: size.width * 0.5,
            height: 150,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
            child: Text('Beli está enviando una imagen'),
          );

        },
      ),
    );
  }
}
