import 'package:get/get.dart';

// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SignOutModel {
  SignOutModel({
    required this.message,
    required this.status,
  });

  String message;
  int status;

  factory SignOutModel.fromJson(Map<String, dynamic> json) => SignOutModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}



AdvertisementModel advertisementModelFromJson(String str) => AdvertisementModel.fromJson(json.decode(str));

String advertisementModelToJson(AdvertisementModel data) => json.encode(data.toJson());

class AdvertisementModel {
  AdvertisementModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<AdvertiseData>? data;

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => AdvertisementModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? List<AdvertiseData>.from(json["data"].map((x) => AdvertiseData.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AdvertiseData {
  AdvertiseData({
    required this.id,
    required this.advertiseTitle,
    this.advertiseLink,
    this.description,
    required this.advertiseImage,
    required this.status,
    required this.languageId,
    required this.mobileNo,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String advertiseTitle;
  String? advertiseLink;
  String? description;
  String advertiseImage;
  int status;
  String languageId;
  dynamic mobileNo;
  DateTime createdAt;
  DateTime updatedAt;

  factory AdvertiseData.fromJson(Map<String, dynamic> json) => AdvertiseData(
    id: json["id"],
    advertiseTitle: json["advertise_title"],
    advertiseLink: json["advertise_link"],
    description: json["description"],
    advertiseImage: json["advertise_image"],
    status: json["status"],
    languageId: json["languageId"],
    mobileNo: json["mobile_no"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "advertise_title": advertiseTitle,
    "advertise_link": advertiseLink,
    "description": description,
    "advertise_image": advertiseImage,
    "status": status,
    "updated_at": updatedAt.toIso8601String(),
    "languageId": languageId,
    "mobile_no": mobileNo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}




Temprature tempratureFromJson(String str) => Temprature.fromJson(json.decode(str));

String tempratureToJson(Temprature data) => json.encode(data.toJson());

class Temprature {
  Temprature({
    required this.generalSituation,
    required this.weatherForecast,
    required this.updateTime,
    required this.seaTemp,
    required this.soilTemp,
  });

  String generalSituation;
  List<WeatherForecast> weatherForecast;
  DateTime updateTime;
  Temp seaTemp;
  List<Temp> soilTemp;

  factory Temprature.fromJson(Map<String, dynamic> json) => Temprature(
    generalSituation: json["generalSituation"],
    weatherForecast: List<WeatherForecast>.from(json["weatherForecast"].map((x) => WeatherForecast.fromJson(x))),
    updateTime: DateTime.parse(json["updateTime"]),
    seaTemp: Temp.fromJson(json["seaTemp"]),
    soilTemp: List<Temp>.from(json["soilTemp"].map((x) => Temp.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "generalSituation": generalSituation,
    "weatherForecast": List<dynamic>.from(weatherForecast.map((x) => x.toJson())),
    "updateTime": updateTime.toIso8601String(),
    "seaTemp": seaTemp.toJson(),
    "soilTemp": List<dynamic>.from(soilTemp.map((x) => x.toJson())),
  };
}

class Temp {
  Temp({
    required this.place,
    required this.value,
    // this.unit,
    required this.recordTime,
    // this.depth,
  });

  String place;
  double value;
  // Unit? unit;
  DateTime recordTime;
  // Depth? depth;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
    place: json["place"],
    value: json["value"].toDouble(),
    // unit: unitValues.map![json["unit"]],
    recordTime: DateTime.parse(json["recordTime"]),
    // depth: json["depth"] == null ? null : Depth.fromJson(json["depth"]),
  );

  Map<String, dynamic> toJson() => {
    "place": place,
    "value": value,
    // "unit": unitValues.reverse[unit],
    "recordTime": recordTime.toIso8601String(),
    // "depth": depth == null ? null : depth!.toJson(),
  };
}

class Depth {
  Depth({
    // this.unit,
    this.value,
  });

  // Unit? unit;
  String? value;

  factory Depth.fromJson(Map<String, dynamic> json) => Depth(
    // unit: unitValues.map[json["unit"]],
    value: json["value"].toString(),
  );

  Map<String, dynamic> toJson() => {
    // "unit": unitValues.reverse[unit],
    "value": value,
  };
}
//
// enum Unit { METRE, PERCENT, C }
//
// final unitValues = EnumValues({
//   "C": Unit.C,
//   "metre": Unit.METRE,
//   "percent": Unit.PERCENT
// });

class WeatherForecast {
  WeatherForecast({
    this.forecastDate,
    this.week,
    this.forecastWind,
    this.forecastWeather,
    this.forecastMaxtemp,
    this.forecastMintemp,
    this.forecastMaxrh,
    this.forecastMinrh,
    this.forecastIcon,
    this.psr,
  });

  String? forecastDate;
  String? week;
  String? forecastWind;
  String? forecastWeather;
  Depth? forecastMaxtemp;
  Depth? forecastMintemp;
  Depth? forecastMaxrh;
  Depth? forecastMinrh;
  int? forecastIcon;
  String? psr;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) => WeatherForecast(
    forecastDate: json["forecastDate"],
    week: json["week"],
    forecastWind: json["forecastWind"],
    forecastWeather: json["forecastWeather"],
    forecastMaxtemp: Depth.fromJson(json["forecastMaxtemp"]),
    forecastMintemp: Depth.fromJson(json["forecastMintemp"]),
    forecastMaxrh: Depth.fromJson(json["forecastMaxrh"]),
    forecastMinrh: Depth.fromJson(json["forecastMinrh"]),
    forecastIcon: json["ForecastIcon"],
    psr: json["PSR"],
  );

  Map<String, dynamic> toJson() => {
    "forecastDate": forecastDate,
    "week": week,
    "forecastWind": forecastWind,
    "forecastWeather": forecastWeather,
    "forecastMaxtemp": forecastMaxtemp!.toJson(),
    "forecastMintemp": forecastMintemp!.toJson(),
    "forecastMaxrh": forecastMaxrh!.toJson(),
    "forecastMinrh": forecastMinrh!.toJson(),
    "ForecastIcon": forecastIcon,
    "PSR": psr,
  };
}


CurrentTempratureModel currentTempratureModelFromJson(String str) => CurrentTempratureModel.fromJson(json.decode(str));

String currentTempratureModelToJson(CurrentTempratureModel data) => json.encode(data.toJson());

class CurrentTempratureModel {
  CurrentTempratureModel({

    required this.icon,
    required this.temperature,
    required this.humidity,
  });


  List<int> icon;
  Humidity temperature;
  Humidity humidity;

  factory CurrentTempratureModel.fromJson(Map<String, dynamic> json) => CurrentTempratureModel(

    icon: List<int>.from(json["icon"].map((x) => x)),
    temperature: Humidity.fromJson(json["temperature"]),
    humidity: Humidity.fromJson(json["humidity"]),
  );

  Map<String, dynamic> toJson() => {
    "icon": List<dynamic>.from(icon.map((x) => x)),
    "temperature": temperature.toJson(),
    "humidity": humidity.toJson(),
  };
}

class Humidity {
  Humidity({
    required this.recordTime,
    required this.data,
  });

  DateTime recordTime;
  List<HumidityDatum> data;

  factory Humidity.fromJson(Map<String, dynamic> json) => Humidity(
    recordTime: DateTime.parse(json["recordTime"]),
    data: List<HumidityDatum>.from(json["data"].map((x) => HumidityDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recordTime": recordTime.toIso8601String(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class HumidityDatum {
  HumidityDatum({
    // required this.unit,
    required this.value,
    required this.place,
  });

  // PurpleUnit unit;
  var value;
  String place;

  factory HumidityDatum.fromJson(Map<String, dynamic> json) => HumidityDatum(
    // unit: purpleUnitValues.map![json["unit"]],
    value: json["value"],
    place: json["place"],
  );

  Map<String, dynamic> toJson() => {
    // "unit": purpleUnitValues.reverse[unit],
    "value": value,
    "place": place,
  };
}

enum PurpleUnit { PERCENT, C }





// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }



