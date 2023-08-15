import 'package:flutter/material.dart';

@immutable
class AppConstants {
  const AppConstants._();

  static const String materialAppTitle = 'Rick And Morty';
  static const baseURL = "https://rickandmortyapi.com/api/";
  static const characterEndpoint = "character";
  static const locationEndpoint = "location";
  static const episodeEndpoint = "episode";
}