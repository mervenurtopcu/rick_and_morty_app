import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/product/constants/index.dart';
import '../../models/character_model.dart';
import '../get_data_service.dart';

class CharacterService extends IGetDataService {
  static final Dio _dio = Dio();

  Future<List<Character>> getAllCharacters() async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getCharactersByName(String name) async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}?name=$name');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<Character> getCharacterByName(String name) async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}?name=$name');
    return Character.fromJson(objects.first);
  }

  Future<Character> getCharacterById(int id) async {
    try {
      Response response = await _dio
          .get('${AppConstants.baseURL}${AppConstants.characterEndpoint}/$id');
      if (response.statusCode == HttpStatus.ok) {
        Character character = Character.fromJson(response.data);
        return character;
      }
    } on DioException catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    throw Exception(StringConstants.errorMessage);
  }
}

class _ShowDebug {
  static void showDioError<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
