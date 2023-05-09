import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/weathermodel.dart';

class WeatherData {
  Future<Weather> getData(var name) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=106fe23d3e8246bd8a130927230405&q=$name&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
