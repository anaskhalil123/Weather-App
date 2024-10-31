import 'package:get/get.dart';
import 'package:trying_weather_application/api/Api_repo.dart';
import 'package:trying_weather_application/model/current_weather_data.dart';
import 'package:trying_weather_application/model/five_days_data.dart';
import 'package:trying_weather_application/statics/statics.dart';

class HomeController extends GetxController {
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/';
  // String city = 'Gaza';
  CurrentWeatherData? currentWeatherData;
  List<CurrentWeatherData> currentWeatherDataForCities = [];
  List<FiveDaysData>? fiveDaysData = List.empty();

  @override
  void onInit() async {
    super.onInit();
    await getCitiesData();
    onState();
  }

  onState() {
    getCurrentWeatherData('Gaza');
    getForcast('Gaza');
  }

  Future<void> getCurrentWeatherData(String city) async {
    // this.city = city;
    final String url =
        '$_baseUrl/weather/?q=$city&lang=en&appid=${Statics.API_KEY}';

    ApiRepo(url: url).get((onSuccess) {
      currentWeatherData = CurrentWeatherData.fromJson(onSuccess);
      update();
      getForcast(city);
    }, (onError) {
      print('HomeController, getCurrentWeatherData $onError');
    });
  }

  Future<void> getForcast(String city) async {
    final String url =
        '$_baseUrl/forecast/?q=$city&lang=en&appid=${Statics.API_KEY}';

    ApiRepo(url: url).get((onSuccess) {
      print('HomeController, getForcast $onSuccess');

      fiveDaysData = (onSuccess['list'] as List)
              ?.map((w) => FiveDaysData.fromJson(w))
              ?.toList() ??
          List.empty();
      update();
    }, (onError) {
      print('HomeController, getForcast $onError');
    });
  }

  Future<void> getCitiesData() async {
    print('HomeController, getCities()');
    List cities = ['Gaza', 'Riyadh', 'Jerusalem', 'Cairo', 'Baghdad'];

    cities.forEach(
      (e) async {
        final String url =
            '$_baseUrl/weather/?q=$e&lang=en&appid=${Statics.API_KEY}';

        ApiRepo(url: url).get((onSuccess) {
          currentWeatherDataForCities
              ?.add(CurrentWeatherData.fromJson(onSuccess));
          print('HomeController, $e , $onSuccess');
          print(
              'HomeController, currentForCitites become $currentWeatherDataForCities');
          update();
        }, (onError) {
          //   print('HomeController, $e get error $onError');
          print('HomeController, $e , get error $onError');
        });
      },
    );
  }
}
