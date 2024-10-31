import 'package:trying_weather_application/model/clouds.dart';
import 'package:trying_weather_application/model/coord.dart';
import 'package:trying_weather_application/model/main_weather.dart';
import 'package:trying_weather_application/model/sys.dart';
import 'package:trying_weather_application/model/weather.dart';
import 'package:trying_weather_application/model/wind.dart';

class CurrentWeatherData {
  Coord coord;
  List<Weather> weather;
  String base;
  MainWeather main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  CurrentWeatherData({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherData(
      coord: Coord.fromJson(json['coord']),
      weather:(json['weather'] as List)
              ?.map((w) => Weather.fromJson(w))
              ?.toList() ??
          List.empty(),
      base: json['base'],
      main: MainWeather.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  // Map<String,dynamic> toJson(){}
}
/*
{
    "dt": 1730134574,
    "sys": {
        "country": "PS",
        "sunrise": 1730087693,
        "sunset": 1730127402
    },
    "timezone": 7200,
    "id": 281133,
    "name": "غزة",
    "cod": 200
} */