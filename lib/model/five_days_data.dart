class FiveDaysData {
  final String? datTime;
  final int? temp;

  FiveDaysData({required this.datTime, required this.temp});

  factory FiveDaysData.fromJson(Map<String, dynamic> json) {
    var date = json['dt_txt'].split(' ')[0].split("-")[2];
    var time = json['dt_txt'].split(' ')[1].split(":")[0];

    var dateTime = '$date-$time';

    print('five days data $dateTime ------------------------------------------- ');
    
    return FiveDaysData(
      datTime: dateTime,
      temp: (double.parse(json['main']['temp'].toString()) - 273).round(),
    );
  }
}
