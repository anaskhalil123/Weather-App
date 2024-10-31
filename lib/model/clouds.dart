class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    print('Clouds');
    return Clouds(all: json['all']);
  }

  Map<String, dynamic> toJson() {
    return {
      'all': all,
    };
  }
}
