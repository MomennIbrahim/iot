import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_test_app/core/Service/mqtt_service.dart';
import 'package:iot_test_app/cubits/cubit/living_room_cubit.dart';
import 'package:iot_test_app/model/rooms_model.dart';
import 'package:iot_test_app/screens/living_room.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState() {
    super.initState();
    _initMqtt();
  }

  Future<void> _initMqtt() async {
    await MqttService().init();
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildHomeHeader(),
              SizedBox(height: 50.0),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: RoomsModel.rooms.length,
                  itemBuilder: (context, index) {
                    return _buildRoomItemWidget(index, context);
                  },
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomItemWidget(int index, context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LivingRoomCubit(MqttService().client),
            child: LivingRoom(roomImage: RoomsModel.rooms[index].image),
          ),
        ),
      ),
      child: Container(
        width: 160.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          image: DecorationImage(
            colorFilter: ColorFilter.srgbToLinearGamma(),
            fit: BoxFit.cover,
            image: NetworkImage(RoomsModel.rooms[index].image),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                RoomsModel.rooms[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              Text(
                'Active device: ${RoomsModel.rooms[index].activeCount}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHomeHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
            'https://img.freepik.com/free-photo/portrait-handsome-young-man-with-arms-crossed-holding-white-headphone-around-his-neck_23-2148096439.jpg?semt=ais_hybrid&w=740&q=80',
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 16.0, color: Colors.white70),
              ),
              Text(
                'Momen Ibrahim',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.menu, color: Colors.white),
      ],
    );
  }
}
