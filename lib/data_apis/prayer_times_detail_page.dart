import 'package:assignment_app/data_apis/prayer_times_fetcher.dart';
import 'package:flutter/material.dart';

import 'model/api_data.dart';

class PrayerTimesDetailPage extends StatelessWidget {
  final Datum selectedDate;

  PrayerTimesDetailPage(this.selectedDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timing for ${selectedDate.date.readable}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              PrayerTimeTile(title: 'Fajr', time: selectedDate.timings.fajr),
              PrayerTimeTile(
                  title: 'Sunrise', time: selectedDate.timings.sunrise),
              PrayerTimeTile(title: 'Dhuhr', time: selectedDate.timings.dhuhr),
              PrayerTimeTile(title: 'Asr', time: selectedDate.timings.asr),
              PrayerTimeTile(
                  title: 'Sunset', time: selectedDate.timings.sunset),
              PrayerTimeTile(
                  title: 'Maghrib', time: selectedDate.timings.maghrib),
              PrayerTimeTile(title: 'Isha', time: selectedDate.timings.isha),
              PrayerTimeTile(title: 'Imsak', time: selectedDate.timings.imsak),
              PrayerTimeTile(
                  title: 'Midnight', time: selectedDate.timings.midnight),
            ],
          ),
        ));
  }
}

class PrayerTimeTile extends StatelessWidget {
  final String title;
  final String time;

  const PrayerTimeTile({Key? key, required this.title, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text(time),
    );
  }
}

class PrayerTimesPage extends StatefulWidget {
  @override
  _PrayerTimesPageState createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  List<Datum> prayerData = [];
  final PrayerTimesService _prayerTimesService = PrayerTimesService();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final PrayerTime prayerTime =
          await _prayerTimesService.getPrayerTimeData();

      setState(() {
        prayerData = prayerTime.data;
        print('Number of prayer data items: ${prayerData.length}');
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
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
        title: Text('Prayer Times Calendar'),
      ),
      body: FutureBuilder<PrayerTime>(
        future: _prayerTimesService.getPrayerTimeData(),
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
                return ListTile(
                  title: Text(prayerData.date.readable),
                  onTap: () => onDateClick(prayerData),
                );
              },
            );
          }
        },
      ),
    );
  }
}
