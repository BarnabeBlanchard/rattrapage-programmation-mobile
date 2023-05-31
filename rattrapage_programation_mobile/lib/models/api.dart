import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'api.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Ville {
  Ville();

  List<Results> results = [];
  double generationtime_ms = 0.0;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Ville.fromJson(Map<String, dynamic> json) => _$VilleFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$VilleToJson(this);
}

@JsonSerializable()
class Results {
  Results();

  int id = 0;
  String name = '';
  double latitude = 0.0;
  double longitude = 0.0;
  double? elevation = 0.0;
  String? feature_code = '';
  String? country_code = '';
  int? admin1_id = 0;
  int? admin2_id = 0;
  String? timezone = '';
  int? population = 0;
  List<String>? postcodes = [];
  int? country_id = 0;
  String? country = '';
  String? admin1 = '';
  String? admin2 = '';

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}


@JsonSerializable()
class HourlyUnits {
  HourlyUnits();

  String? time = '';
  String? temperature_2m = '';
  String? relativehumidity_2m = '';
  String? apparent_temperature = '';
  String? precipitation_probability = '';

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory HourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$HourlyUnitsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);
}

@JsonSerializable()
class Hourly {
  Hourly();

  List<String>? time = [];
  List<double>? temperature_2m = [];
  List<int>? relativehumidity_2m = [];
  List<double>? apparent_temperature = [];
  List<int>? precipitation_probability = [];


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Hourly.fromJson(Map<String, dynamic> json) =>
      _$HourlyFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}

@JsonSerializable()
class DailyUnits {
  DailyUnits();

  String? time = '';
  String? weathercode = '';
  String? temperature_2m_max = '';
  String? temperature_2m_min = '';
  String? windspeed_10m_max = '';
  String? winddirection_10m_dominant = '';

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DailyUnits.fromJson(Map<String, dynamic> json) =>
      _$DailyUnitsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DailyUnitsToJson(this);
}

@JsonSerializable()
class Daily {
  Daily();

  List<String>? time = [];
  List<int>? weathercode = [];
  List<double>? temperature_2m_max = [];
  List<double>? temperature_2m_min = [];
  List<double>? windspeed_10m_max = [];
  List<int>? winddirection_10m_dominant = [];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Daily.fromJson(Map<String, dynamic> json) =>
      _$DailyFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

@JsonSerializable()
class Meteo {
  Meteo();

  double latitude = 0.0;
  double longitude = 0.0;
  double generationtime_ms = 0.0;
  int? utc_offset_seconds = 0;
  String? timezone = ''; // fixé à europe/berlin (pas sur)
  String? timezone_abbreviation = '';
  double? elevation = 0.0;
  HourlyUnits? hourly_units = HourlyUnits();
  Hourly? hourly = Hourly();
  DailyUnits? daily_units =  DailyUnits();
  Daily? daily = Daily();


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Meteo.fromJson(Map<String, dynamic> json) =>
      _$MeteoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$MeteoToJson(this);
}