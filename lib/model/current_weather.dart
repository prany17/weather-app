class CurrentWeather {
  List<Weather>? weather;
  Main? main;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  String? name;

  CurrentWeather({
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.name,
  });

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }

    main = json['main'] != null ? Main.fromJson(json['main']) : null;

    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];

    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }

    if (main != null) {
      data['main'] = main!.toJson();
    }

    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;

    data['name'] = name;

    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Main {
  double? temp;

  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];

    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;

    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;

    return data;
  }
}

class Wind {
  double? speed;

  Wind({this.speed});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;

    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}
