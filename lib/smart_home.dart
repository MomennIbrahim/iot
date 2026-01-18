import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:iot_test_app/screens/home_screen.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class SmartHome extends StatefulWidget {
  final MqttServerClient client;
  const SmartHome({super.key, required this.client});

  @override
  State<SmartHome> createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IOT App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black26,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
            ) {
              final bool connected =
                  connectivity.last != ConnectivityResult.none;

              return connected
                  ? HomeScreen(client: widget.client)
                  : Scaffold(
                      body: Center(
                        child: Text(
                          "No internet connection",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
            },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('There are no bottons to push :)'),
            Text('Just turn off your internet.'),
          ],
        ),
      ),
    );
  }
}
