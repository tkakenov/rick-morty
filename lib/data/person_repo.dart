import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/models/person_response_model.dart';

class PersonRepo {
  PersonRepo({required this.dio});
  final Dio dio;
  Future<PersonResponseModel> getPerson({
    required String name,
    required int pageNumber,
  }) async {
    final result = await dio.get(
      'character',
      queryParameters: {
        'name': name,
        'page': pageNumber,
      },
    );

    return PersonResponseModel.fromJson(result.data);
  }
}
