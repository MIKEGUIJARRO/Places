const GOOGLEAPIKEY = 'AIzaSyA7QSXCaBaDwde8q5vMm3D61_frWgG47s8';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A %7C$latitude,$longitude&key=$GOOGLEAPIKEY';
  }
}