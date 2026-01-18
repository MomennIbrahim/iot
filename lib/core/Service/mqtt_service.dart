import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  static final MqttService _instance = MqttService._internal();
  factory MqttService() => _instance;
  MqttService._internal();

  late MqttServerClient client;

  Future<void> init() async {
    client = MqttServerClient.withPort(
      'broker.hivemq.com',
      'flutter_client_${DateTime.now().millisecondsSinceEpoch}',
      1883,
    );

    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;

    try {
      final connMess = MqttConnectMessage()
          .withClientIdentifier(client.clientIdentifier)
          .startClean()
          .withWillQos(MqttQos.atLeastOnce);
      client.connectionMessage = connMess;

      print('Connecting to MQTT broker...');
      await client.connect();
      print('Connected successfully');
    } catch (e) {
      print('MQTT connection failed: $e');
      client.disconnect();
    }
  }

  void onDisconnected() {
    print('MQTT disconnected');
  }

  void onConnected() {
    print('MQTT connected');
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }
}
