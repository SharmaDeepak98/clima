import 'package:climate/screens/location_screen.dart';
import '../services/location.dart';
import '../services/networking.dart';

String appId = '9a3e076c8697b9b9097d5cea2745c3d0';
String openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Location location = Location();

  Future getCityWeather(String? cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherURL?q=$cityName&appid=$appId&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationData() async {
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$appId&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
    // ignore: use_build_context_synchronously
  }

  String getWeatherIcon(int? condition) {
    if (condition! < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int? temp) {
    if (temp! > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
