import 'package:dio/dio.dart';
import 'package:rickandmorty/Constants/String.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future getAllCharacters(String query) async {
    try {
      Response response = await dio.get(query);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
