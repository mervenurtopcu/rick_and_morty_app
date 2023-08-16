import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/product/services/character/character_service.dart';

void main() {

  CharacterService characterService = CharacterService();

    setUp(() {});

    test('Get character by id', ()async {
      var character = await characterService.getCharacterById(1);
      expect(character.id,1);
    });
  test('Get character by id', ()async {
    var character = await characterService.getCharacterById(826);
    expect(character.id,826);
  });

  //ALL LİST 826 LENGTH THATS WHY GETS AN ERROR
  // test('Get character by id', ()async {
  //   var character = await characterService.getCharacterById(827);
  //   expect(character.id,827);
  // });


}