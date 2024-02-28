import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/api_data.dart';

class PrayerTimesService {
  final String urlApi =
      'https://api.aladhan.com/v1/calendarByCity?city=Karachi&country=Pakistan&method=2';

  Future<PrayerTime> getPrayerTimeData() async {
    try {
      final response = await http.get(Uri.parse(urlApi));
      if (response.statusCode == 200) {
        return PrayerTime.fromMap(json.decode(response.body));
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
