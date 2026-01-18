import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/smart_home.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() async {
  MqttServerClient client = MqttServerClient.withPort(
    'broker.hivemq.com',
    'clientIdentifier',
    1883,
  );
  client.connect();
  await ScreenUtil.ensureScreenSize();

  runApp(SmartHome(mqttClient: client));
}
