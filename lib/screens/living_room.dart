import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:iot_test_app/core/topics.dart';
import 'package:iot_test_app/cubits/cubit/living_room_cubit.dart';
import 'package:iot_test_app/model/living_room_lumps_model.dart';
import 'package:mqtt_client/mqtt_client.dart';

class LivingRoom extends StatefulWidget {
  final String roomImage;
  const LivingRoom({super.key, required this.roomImage});

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<LivingRoomCubit>();

    // Subscribe to all topics
    cubit.client.subscribe(Topics.lightOneLivingRoomTopic, MqttQos.atMostOnce);
    cubit.client.subscribe(Topics.fanTopic, MqttQos.atMostOnce);
    cubit.client.subscribe(Topics.acTopic, MqttQos.atMostOnce);
    cubit.client.subscribe(Topics.tvTopic, MqttQos.atMostOnce);
    cubit.client.subscribe(Topics.tempretureTopic, MqttQos.atMostOnce);
    cubit.client.subscribe(Topics.humidityTopic, MqttQos.atMostOnce);

    cubit.client.updates!.listen((event) {
      cubit.getDataAndTopic(event: event);
    });
  }

  double value = 3;

  List<LivingRoomLumpsModel> lumpsList = [
    LivingRoomLumpsModel(name: 'Lump1', value: true, icon: Icons.lightbulb),
    LivingRoomLumpsModel(
      name: 'Fan',
      value: false,
      icon: Icons.mode_fan_off_sharp,
    ),
    LivingRoomLumpsModel(
      name: 'Air Conditioner',
      value: true,
      icon: Icons.airline_seat_individual_suite_outlined,
    ),
    LivingRoomLumpsModel(name: 'TV', value: false, icon: Icons.tv),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivingRoomCubit, LivingRoomState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text("Living Room"),
            backgroundColor: Colors.white24,
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.roomImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Column(
                children: [
                  _buildAnimatedGaugeWidget(),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white54,
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(16),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2 / 1.8,
                      children: List.generate(4, (index) {
                        return _buildLivingRoomThing(index, state);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // UI item widget
  Container _buildLivingRoomThing(int index, LivingRoomState state) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white54,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(lumpsList[index].icon, size: 50.0),
          SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  lumpsList[index].name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Switch(
                  value: getValueByIndex(index, state), // ← هنا القيمة الصح
                  onChanged: (v) {
                    final cubit = context.read<LivingRoomCubit>();
                    sendTopicByIndex(index, v, cubit);
                  },
                  activeThumbColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Send correct topic & update cubit
  void sendTopicByIndex(int index, bool v, LivingRoomCubit cubit) {
    switch (index) {
      case 0:
        cubit.publish(
          topic: Topics.lightOneLivingRoomTopic,
          data: v.toString(),
        );
        cubit.emit(cubit.state.copyWith(lightOne: v));
        break;

      case 1:
        cubit.publish(topic: Topics.fanTopic, data: v.toString());
        cubit.emit(cubit.state.copyWith(fan: v));
        break;

      case 2:
        cubit.publish(topic: Topics.acTopic, data: v.toString());
        cubit.emit(cubit.state.copyWith(ac: v));
        break;

      case 3:
        cubit.publish(topic: Topics.tvTopic, data: v.toString());
        cubit.emit(cubit.state.copyWith(tv: v));
        break;
    }
  }

  bool getValueByIndex(int index, LivingRoomState state) {
    switch (index) {
      case 0:
        return state.lightOne;
      case 1:
        return state.fan;
      case 2:
        return state.ac;
      case 3:
        return state.tv;
      default:
        return false;
    }
  }

  // Gauge widget (same)
  AnimatedRadialGauge _buildAnimatedGaugeWidget() {
    return AnimatedRadialGauge(
      duration: Duration(seconds: 1),
      value: context.watch<LivingRoomCubit>().state.humidity,
      radius: 120,
      axis: GaugeAxis(
        progressBar: GaugeBasicProgressBar(color: getColor(value)),
        min: 0,
        max: 9,
        degrees: 180,
        segments: [
          GaugeSegment(
            from: 0,
            to: 3,
            border: GaugeBorder(color: Colors.black26),
          ),
          GaugeSegment(
            from: 3,
            to: 6,
            border: GaugeBorder(color: Colors.black26),
          ),
          GaugeSegment(
            from: 6,
            to: 9,
            border: GaugeBorder(color: Colors.black26),
          ),
        ],
        style: GaugeAxisStyle(background: Colors.transparent),
      ),
      builder: (context, child, value) => Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: getColor(value),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context
                  .watch<LivingRoomCubit>()
                  .state
                  .tempreture
                  .toInt()
                  .toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Text(
                'Humidity ${context.watch<LivingRoomCubit>().state.humidity.toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(double value) {
    if (value <= 3) {
      return Colors.green;
    } else if (value <= 6) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
