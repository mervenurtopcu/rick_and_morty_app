import 'package:rick_and_morty_app/product/constants/app_constants.dart';
import 'package:rick_and_morty_app/product/models/location_model.dart';
import '../get_data_service.dart';

class LocationService extends IGetDataService {
  Future<List<LocationModel>> getAllLocations() async {
    List<Map<String, dynamic>> objects = await super
        .getAllDatas('${AppConstants.baseURL}${AppConstants.locationEndpoint}');

    return List<LocationModel>.from(objects.map((x) => LocationModel.fromJson(x)));
  }

  Future<List<LocationModel>> getListOfLocations(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.locationEndpoint}/$ids');

    return List<LocationModel>.from(objects.map((x) => LocationModel.fromJson(x)));
  }

}