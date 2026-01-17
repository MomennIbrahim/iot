import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iot_test_app/core/topics.dart';
import 'package:meta/meta.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

part 'living_room_state.dart';

class LivingRoomCubit extends Cubit<LivingRoomState> {
  late MqttServerClient client;

  LivingRoomCubit(this.client)
    : super(LivingRoomState(status: LivingRoomStatus.initial));

  void publish({required String topic, required String data}) {
    MqttClientPayloadBuilder p = MqttClientPayloadBuilder();
    p.addString(data);
    client.publishMessage(topic, MqttQos.atMostOnce, p.payload!);
    p.clear();
  }

  void getDataAndTopic({
    required List<MqttReceivedMessage<MqttMessage>> event,
  }) {
    final MqttPublishMessage message = event[0].payload as MqttPublishMessage;
    final data = MqttPublishPayload.bytesToStringAsString(
      message.payload.message,
    );
    routeData(topic: event[0].topic, data: data);
  }

  void routeData({required String topic, required String data}) {
    if (topic == Topics.lightOneLivingRoomTopic) {
      emit(state.copyWith(lightOne: bool.parse(data)));
    } else if (topic == Topics.fanTopic) {
      emit(state.copyWith(fan: bool.parse(data)));
    } else if (topic == Topics.acTopic) {
      emit(state.copyWith(ac: bool.parse(data)));
    } else if (topic == Topics.tvTopic) {
      emit(state.copyWith(tv: bool.parse(data)));
    } else if (topic == Topics.tempretureTopic) {
      emit(state.copyWith(tempreture: double.parse(data)));
    }else if(topic == Topics.humidityTopic){
      emit(state.copyWith(humidity: double.parse(data)));
    }
  }

  switchValue(bool value) {
    emit(state.copyWith(lightOne: value));
  }
}
