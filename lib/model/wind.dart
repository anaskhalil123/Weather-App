class Wind {
  double speed, gust;
  int deg;

  Wind({
    required this.speed,
    required this.gust,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    print('Wind');
    return Wind(
      deg: json['deg'],
      gust: json['gust'] != null ? json['gust'] : 0.0,
      speed: json['speed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deg': deg,
      'gust': gust,
      'speed': speed,
    };
  }
}
