import 'package:flutter/material.dart';
import 'package:iot_test_app/smart_home.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() async {
  MqttServerClient client = MqttServerClient.withPort(
    'broker.hivemq.com',
    'clientIdentifier',
    1883,
  );
  client.connect();

  runApp(SmartHome(client: client));
}
