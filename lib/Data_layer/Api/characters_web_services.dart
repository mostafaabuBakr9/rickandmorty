import 'package:dio/dio.dart';
import 'package:rickandmorty/Constants/string.dart';

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
  Future getAllCharacters({required String path}) async {
    try {
      Response response = await dio.get(path);
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future getCountofPages() async {
    try {
      Response response = await dio.get('character');
      return response.data['info']['pages'];
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }
}
