import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    List<IconData> weatherIcons = [
      Icons.wb_sunny,
      Icons.wb_cloudy,
      Icons.wb_sunny,
      Icons.wb_cloudy,
      Icons.wb_sunny,
      Icons.wb_cloudy,
      Icons.wb_sunny,
    ];

    List<Color> weatherIconColors = [
      Colors.yellow,
      Colors.grey,
      Colors.orange,
      Colors.blueGrey,
      Colors.amber,
      Colors.grey,
      Colors.orange,
    ];

    const List<String> temperatures = [
      '31°',
      '27°',
      '30°',
      '26°',
      '29°',
      '25°',
      '28°'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tashkent Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'More Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 100, 181, 246),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wb_cloudy,
                    size: 60,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Heavy Rain",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  Text(
                    'Sunday, 02 Oct',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Weather: Heavy Rain',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '24°',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.air,
                        color: Colors.white,
                      ),
                      Text(
                        'Wind: 19.2 km/h',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(width: 8.0),
                      Icon(
                        Icons.thermostat,
                        color: Colors.white,
                      ),
                      Text(
                        'Feels Like: 25°',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.sunny, color: Colors.white),
                      Text(
                        'UV Index: 2',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      SizedBox(width: 4.0),
                      Icon(
                        Icons.broken_image_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        'Pressure 1014 mbar',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "Next 7 Days",
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          Colors.blue[300];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextSevenDaysScreen(
                                daysOfWeek: daysOfWeek,
                                weatherIcons: weatherIcons,
                                weatherIconColors: weatherIconColors,
                                temperatures: temperatures,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Text(
                  "Weather for Today",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(daysOfWeek.length, (index) {
                    return Column(
                      children: [
                        Text(
                          daysOfWeek[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(weatherIcons[index]),
                        Text(temperatures[index]),
                      ],
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                const Text(
                  "Weather for the Next 7 Days",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(daysOfWeek.length, (index) {
                    return Column(
                      children: [
                        Text(
                          daysOfWeek[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(weatherIcons[index]),
                        Text(temperatures[index]),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextSevenDaysScreen extends StatelessWidget {
  final List<String> daysOfWeek;
  final List<IconData> weatherIcons;
  final List<Color> weatherIconColors;
  final List<String> temperatures;

  NextSevenDaysScreen({
    required this.daysOfWeek,
    required this.weatherIcons,
    required this.weatherIconColors,
    required this.temperatures,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: Text('Next 7 Days'),
      ),
      body: Column(
        children: [
          Text(
            'Next 7 Days',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: daysOfWeek.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  weatherIcons[index],
                  color: weatherIconColors[index],
                ),
                title: Text(daysOfWeek[index]),
                subtitle: Text(temperatures[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
class WeatherScreen2 extends StatefulWidget {
  @override
  _WeatherScreen2State createState() => _WeatherScreen2State();
}

class _WeatherScreen2State extends State<WeatherScreen2> {
  List<IconData> weatherIcons = [];
  List<String> temperatures = [];
  List<String> daysOfWeek = []; // Added daysOfWeek list

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final url = Uri.parse(
        'https://pro.openweathermap.org/data/2.5/forecast/climate?lat={lat}&lon={lon}&appid={aa72dbb5f2c7488dbbc71f1b735aeca1}');

    var http;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List<dynamic> forecastList = data['list'];
      for (var forecast in forecastList) {
        IconData icon = getIconForWeather(forecast['weather'][0]['id']);
        String temperature = forecast['main']['temp'].toString();

        weatherIcons.add(icon);
        temperatures.add(temperature);
      }

      // Calculate days of the week
      DateTime today = DateTime.now();
      for (int i = 0; i < forecastList.length; i++) {
        DateTime nextDay = today.add(Duration(days: i));
        String dayOfWeek = getDayOfWeek(nextDay.weekday);
        daysOfWeek.add(dayOfWeek);
      }

      setState(() {
        weatherIcons = weatherIcons;
        temperatures = temperatures;
        daysOfWeek = daysOfWeek;
      });
    } else {
      print('Failed to fetch weather data');
    }
  }

  IconData getIconForWeather(int weatherId) {
    return Icons.error;
  }

  String getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        children: [
          Text(
            "Weather for Today",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(weatherIcons.length, (index) {
              return Column(
                children: [
                  Text(
                    daysOfWeek[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(weatherIcons[index]),
                  Text(temperatures[index]),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}