import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trying_weather_application/controller/home_controller.dart';
import 'package:trying_weather_application/model/five_days_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print('height is  { $height }, width is { $width }');
    Get.put(HomeController());

    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: height / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width / 10),
                          bottomRight: Radius.circular(width / 10),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: AppBar(
                              backgroundColor: Colors.transparent,
                              leading: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 20),
                              child: TextField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textInputAction: TextInputAction.search,
                                onChanged: (value) =>
                                    controller.getCurrentWeatherData(value),
                                decoration: InputDecoration(
                                  suffix: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  hintText: 'SEARCH',
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, 1.0),
                            child: SizedBox(
                              width: 10,
                              height: 10,
                              child: OverflowBox(
                                maxHeight: height / 5,
                                maxWidth: width - 50,
                                child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Text(
                                          controller.currentWeatherData != null
                                              ? controller
                                                  .currentWeatherData!.name
                                              : '',
                                          style: Get.theme.textTheme.bodySmall
                                              ?.copyWith(
                                            fontFamily: 'flutterfonts',
                                            fontSize: height / 40,
                                            color: Colors.black45,
                                          )),
                                      Text(
                                          controller.currentWeatherData != null
                                              ? controller.currentWeatherData!
                                                  .weather[0].description
                                              : '',
                                          style: Get.theme.textTheme.bodySmall
                                              ?.copyWith(
                                            fontFamily: 'flutterfonts',
                                            fontSize: height / 55,
                                            color: Colors.black45,
                                          )),
                                      SizedBox(
                                        height: height / 180,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width / 70),
                                            child: Column(
                                              children: [
                                                Text(
                                                  controller.currentWeatherData !=
                                                          null
                                                      ? controller
                                                          .currentWeatherData!
                                                          .weather[0]
                                                          .description
                                                      : '',
                                                  style: Get
                                                      .theme.textTheme.bodySmall
                                                      ?.copyWith(
                                                    fontFamily: 'flutterfonts',
                                                    fontSize: height / 70,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData !=
                                                          null)
                                                      ? '${(controller.currentWeatherData!.main.temp - 273.15).round().toString()}\u2103'
                                                      : ''
                                                          '',
                                                  style: Get
                                                      .theme.textTheme.bodySmall
                                                      ?.copyWith(
                                                    fontFamily: 'flutterfonts',
                                                    color: Colors.black45,
                                                    fontSize: height / 30,
                                                  ),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData !=
                                                          null)
                                                      ? 'min: ${(controller.currentWeatherData!.main!.temp_min - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData!.main!.temp_max - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Get
                                                      .theme.textTheme.bodySmall
                                                      ?.copyWith(
                                                    fontFamily: 'flutterfonts',
                                                    fontSize: height / 70,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: width / 70),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: width / 5,
                                                  child: Image.asset(
                                                      'assets/images/icon-01.jpg'),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                              ?.wind !=
                                                          null)
                                                      ? 'wind ${controller.currentWeatherData?.wind?.speed} m/s'
                                                      : '',
                                                  style: Get
                                                      .theme.textTheme.bodySmall
                                                      ?.copyWith(
                                                    fontFamily: 'flutterfonts',
                                                    fontSize: height / 70,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: height / 8,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: width / 35,
                              ),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Other City'),
                              ),
                            ),
                            SizedBox(
                              height: height / 6,
                              width: width - 10,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: height / 7,
                                    width: width / 3.5,
                                    child: Card(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Text(
                                            controller
                                                .currentWeatherDataForCities[
                                                    index]
                                                .name,
                                                style: Get.theme.textTheme.bodySmall
                                              ?.copyWith(
                                            fontFamily: 'flutterfonts',
                                            fontSize: height / 60,
                                            color: Colors.black45,
                                          )
                                          ),
                                          Text(
                                              '${(controller.currentWeatherDataForCities[index].main.temp - 273.15).round()}\u2103',
                                              style: Get.theme.textTheme.bodySmall
                                              ?.copyWith(
                                            fontFamily: 'flutterfonts',
                                            fontSize: height / 60,
                                            color: Colors.black45,
                                          )),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                              'assets/images/icon-01.jpg',
                                            ),
                                          ),
                                          Text(
                                            controller
                                                .currentWeatherDataForCities[
                                                    index]
                                                .weather[0]
                                                .description,
                                            style: Get.theme.textTheme.bodySmall
                                                ?.copyWith(
                                              fontFamily: 'flutterfonts',
                                              fontSize: height / 70,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: controller
                                    .currentWeatherDataForCities.length,
                                separatorBuilder: (context, index) => Divider(),
                              ),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: width / 50),
                                    child: const Text('Forcast Next 5 Days'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: width / 50),
                                    child: const Icon(Icons.next_plan_outlined),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 4,
                              width: width - 10,
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    width / 20,
                                  ),
                                ),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: [
                                    SplineSeries<FiveDaysData, String>(
                                      dataSource: controller.fiveDaysData,
                                      xValueMapper: (FiveDaysData f, _) =>
                                          f.datTime,
                                      yValueMapper: (FiveDaysData f, _) =>
                                          f.temp,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
