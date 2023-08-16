import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/product/services/location/location_service.dart';

void main() {
  LocationService locationService = LocationService();

  setUp(() {});

  test('Get all locations', () async {
    var locations = await locationService.getAllLocations();
    expect(locations.isNotEmpty, true);
  });

}
