// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ville _$VilleFromJson(Map<String, dynamic> json) => Ville()
  ..results = (json['results'] as List<dynamic>)
      .map((e) => Results.fromJson(e as Map<String, dynamic>))
      .toList()
  ..generationtime_ms = (json['generationtime_ms'] as num).toDouble();

Map<String, dynamic> _$VilleToJson(Ville instance) => <String, dynamic>{
      'results': instance.results,
      'generationtime_ms': instance.generationtime_ms,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results()
  ..id = json['id'] as int
  ..name = json['name'] as String
  ..latitude = (json['latitude'] as num).toDouble()
  ..longitude = (json['longitude'] as num).toDouble()
  ..elevation = (json['elevation'] as num?)?.toDouble()
  ..feature_code = json['feature_code'] as String?
  ..country_code = json['country_code'] as String?
  ..admin1_id = json['admin1_id'] as int?
  ..admin2_id = json['admin2_id'] as int?
  ..timezone = json['timezone'] as String?
  ..population = json['population'] as int?
  ..postcodes =
      (json['postcodes'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..country_id = json['country_id'] as int?
  ..country = json['country'] as String?
  ..admin1 = json['admin1'] as String?
  ..admin2 = json['admin2'] as String?;

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'feature_code': instance.feature_code,
      'country_code': instance.country_code,
      'admin1_id': instance.admin1_id,
      'admin2_id': instance.admin2_id,
      'timezone': instance.timezone,
      'population': instance.population,
      'postcodes': instance.postcodes,
      'country_id': instance.country_id,
      'country': instance.country,
      'admin1': instance.admin1,
      'admin2': instance.admin2,
    };

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits()
  ..time = json['time'] as String?
  ..temperature_2m = json['temperature_2m'] as String?
  ..relativehumidity_2m = json['relativehumidity_2m'] as String?
  ..apparent_temperature = json['apparent_temperature'] as String?
  ..precipitation_probability = json['precipitation_probability'] as String?;

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
      'relativehumidity_2m': instance.relativehumidity_2m,
      'apparent_temperature': instance.apparent_temperature,
      'precipitation_probability': instance.precipitation_probability,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly()
  ..time = (json['time'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..temperature_2m = (json['temperature_2m'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList()
  ..relativehumidity_2m = (json['relativehumidity_2m'] as List<dynamic>?)
      ?.map((e) => e as int)
      .toList()
  ..apparent_temperature = (json['apparent_temperature'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList()
  ..precipitation_probability =
      (json['precipitation_probability'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList();

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
      'relativehumidity_2m': instance.relativehumidity_2m,
      'apparent_temperature': instance.apparent_temperature,
      'precipitation_probability': instance.precipitation_probability,
    };

DailyUnits _$DailyUnitsFromJson(Map<String, dynamic> json) => DailyUnits()
  ..time = json['time'] as String?
  ..weathercode = json['weathercode'] as String?
  ..temperature_2m_max = json['temperature_2m_max'] as String?
  ..temperature_2m_min = json['temperature_2m_min'] as String?
  ..windspeed_10m_max = json['windspeed_10m_max'] as String?
  ..winddirection_10m_dominant = json['winddirection_10m_dominant'] as String?;

Map<String, dynamic> _$DailyUnitsToJson(DailyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weathercode': instance.weathercode,
      'temperature_2m_max': instance.temperature_2m_max,
      'temperature_2m_min': instance.temperature_2m_min,
      'windspeed_10m_max': instance.windspeed_10m_max,
      'winddirection_10m_dominant': instance.winddirection_10m_dominant,
    };

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily()
  ..time = (json['time'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..weathercode =
      (json['weathercode'] as List<dynamic>?)?.map((e) => e as int).toList()
  ..temperature_2m_max = (json['temperature_2m_max'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList()
  ..temperature_2m_min = (json['temperature_2m_min'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList()
  ..windspeed_10m_max = (json['windspeed_10m_max'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList()
  ..winddirection_10m_dominant =
      (json['winddirection_10m_dominant'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList();

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'time': instance.time,
      'weathercode': instance.weathercode,
      'temperature_2m_max': instance.temperature_2m_max,
      'temperature_2m_min': instance.temperature_2m_min,
      'windspeed_10m_max': instance.windspeed_10m_max,
      'winddirection_10m_dominant': instance.winddirection_10m_dominant,
    };

Meteo _$MeteoFromJson(Map<String, dynamic> json) => Meteo()
  ..latitude = (json['latitude'] as num).toDouble()
  ..longitude = (json['longitude'] as num).toDouble()
  ..generationtime_ms = (json['generationtime_ms'] as num).toDouble()
  ..utc_offset_seconds = json['utc_offset_seconds'] as int?
  ..timezone = json['timezone'] as String?
  ..timezone_abbreviation = json['timezone_abbreviation'] as String?
  ..elevation = (json['elevation'] as num?)?.toDouble()
  ..hourly_units = json['hourly_units'] == null
      ? null
      : HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>)
  ..hourly = json['hourly'] == null
      ? null
      : Hourly.fromJson(json['hourly'] as Map<String, dynamic>)
  ..daily_units = json['daily_units'] == null
      ? null
      : DailyUnits.fromJson(json['daily_units'] as Map<String, dynamic>)
  ..daily = json['daily'] == null
      ? null
      : Daily.fromJson(json['daily'] as Map<String, dynamic>);

Map<String, dynamic> _$MeteoToJson(Meteo instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtime_ms,
      'utc_offset_seconds': instance.utc_offset_seconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezone_abbreviation,
      'elevation': instance.elevation,
      'hourly_units': instance.hourly_units,
      'hourly': instance.hourly,
      'daily_units': instance.daily_units,
      'daily': instance.daily,
    };
