import 'package:climat/screens/city_screen.dart';
import 'package:climat/services/weather.dart';
import 'package:climat/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  double temperature;
  String weatherIcon;
  String cityName;
  String getMsg;
  @override
  void initState() {
    super.initState();
    update(widget.locationWeather);
  }

  void update(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'ERROR';
        getMsg = 'unable to set weather data';
        cityName = '';
        return;
      }

      temperature = weatherData['main']['temp'].toDouble();

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      getMsg = weather.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/space.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        var weatherData = await weather.getlocWeather();
                        update(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 30.0,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        if (typedName != null) {
                          var weatherData =
                              await weather.getCityWeather(typedName);
                          update(weatherData);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0, bottom: 80.0),
                  child: Text(
                    '$getMsg in $cityName!',
                    textAlign: TextAlign.justify,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
