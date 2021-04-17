import 'package:climat/services/location.dart';
import 'package:climat/services/networking.dart';

const apiKey = 'b6f9e22a24c07f418222a2f1d558fc4b';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMap?q=$cityName&appid=$apiKey&units=metric';
    NetWorkHelpler networkHelper = NetWorkHelpler(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getlocWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetWorkHelpler netWorkHelpler = NetWorkHelpler(
        '$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await netWorkHelpler.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
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

  String getMessage(double temp) {
    if (temp > 25) {
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
