enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  final String? answer;
  final bool? forced;

  Message({required this.text, this.imageUrl, required this.fromWho, this.answer, this.forced});
}
