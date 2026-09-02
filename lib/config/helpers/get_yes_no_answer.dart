import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    // Url que tengo que llamar
    final response = await _dio.get('https://yes-no-wtf.vercel.app/api');

    final yesnoModel = YesNoModel.fromJsonMap(response.data);

    response.data['answer'];

    return yesnoModel.toMessageEntity();
  }
}
