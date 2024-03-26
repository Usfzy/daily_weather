import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:daily_weather/core/constants/constants.dart';
import 'package:daily_weather/features/weather/data/datasource/weather_data_source.dart';
import 'package:daily_weather/features/weather/data/model/weather_data_response.dart';

final chopperClient = ChopperClient(
  baseUrl: Uri.parse(StringConstants.kBaseUrl),
  services: services,
  converter: JsonToTypeConverter(typeToJsonFactoryMap),
  interceptors: [HttpLoggingInterceptor()],
);

List<ChopperService> get services => [
      WeatherDataSource.create(),
    ];

Map<Type, Function> get typeToJsonFactoryMap => {
      WeatherDataResponse: (json) => WeatherDataResponse.fromJson(json),
    };

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  const JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(
          response.body, typeToJsonFactoryMap[InnerType]),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function? jsonParser) {
    var jsonMap = json.decode(jsonData);
    if (jsonParser == null) {
      return jsonMap as T;
    }
    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }

    return jsonParser(jsonMap);
  }
}
