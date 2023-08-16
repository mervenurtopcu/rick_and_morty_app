import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/product/constants/app_constants.dart';
import '../../models/character_model.dart';
import '../get_data_service.dart';

class CharacterService extends IGetDataService {
  Future<List<Character>> getAllCharacters() async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getListOfCharacters(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}/$ids');

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
      Response response = await Dio()
          .get('${AppConstants.baseURL}${AppConstants.characterEndpoint}/$id');
      if (response.statusCode == HttpStatus.ok) {
        Character character = Character.fromJson(response.data);
        return character;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.data +
              '\n' +
              e.response!.headers +
              '\n' +
              e.response!.requestOptions);
        }
      } else {
        if (kDebugMode) {
          print(e.message);
        }
      }
    }
    throw Exception('Failed to load weather');
  }
}
