import 'package:assignment_app/data_apis/prayer_times_detail_page.dart';
import 'package:assignment_app/data_apis/prayer_times_fetcher.dart';
import 'package:flutter/material.dart';

import 'model/api_data.dart';

class ApiDashboard extends StatefulWidget {
  @override
  _ApiDashboardState createState() => _ApiDashboardState();
}

class _ApiDashboardState extends State<ApiDashboard> {
  final PrayerTimesService _prayerTimeService = PrayerTimesService();
  late Future<PrayerTime> _prayerTimeData;

  @override
  void initState() {
    super.initState();
    _prayerTimeData = _prayerTimeService.getPrayerTimeData();
  }

  void onDateClick(Datum selectedDate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrayerTimesDetailPage(selectedDate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
      ),
      body: FutureBuilder<PrayerTime>(
        future: _prayerTimeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error in fetching data, show an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data has been successfully fetched, display the ListView
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                Datum prayerData = snapshot.data!.data[index];
                return GestureDetector(
                  onTap: () => onDateClick(prayerData),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date: ${prayerData.date.readable}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text('Fajr: ${prayerData.timings.fajr}'),
                        Text('Sunrise: ${prayerData.timings.sunrise}'),
                        Text('Dhuhr: ${prayerData.timings.dhuhr}'),
                        Text('Asr: ${prayerData.timings.asr}'),
                        Text('Sunset: ${prayerData.timings.sunset}'),
                        Text('Maghrib: ${prayerData.timings.maghrib}'),
                        Text('Isha: ${prayerData.timings.isha}'),
                        Text('Imsak: ${prayerData.timings.imsak}'),
                        Text('Midnight: ${prayerData.timings.midnight}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
