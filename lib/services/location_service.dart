import 'package:geolocator/geolocator.dart';
import 'package:specialite/models/user_location.dart';

class LocationService {
  Future<UserLocation> pullLocationData() async {
    // final position = await Geolocator()
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // final List<Placemark> placemarks = await Geolocator()
    //     .placemarkFromCoordinates(position.latitude, position.longitude);

    // print('Success - pullLocationData()');
    // return UserLocation(
    //     latitude: position.latitude,
    //     longitude: position.longitude,
    //     address:
    //     '${placemarks.first.locality}, ${placemarks.first.thoroughfare} ${placemarks.first.name}',
    //     city: placemarks.first.locality);
    return null;
  }
}
