part of 'living_room_cubit.dart';

enum LivingRoomStatus { initial, loading, success, error }

@immutable
class LivingRoomState extends Equatable {
  final LivingRoomStatus status;
  final bool lightOne;
  final bool fan;
  final bool ac;
  final bool tv;
  final double tempreture;
  final double humidity;

  const LivingRoomState({
    this.status = LivingRoomStatus.initial,
    this.lightOne = false,
    this.fan = false,
    this.ac = false,
    this.tv = false,
    this.tempreture = 0.0,
    this.humidity = 0.0,
  });

  LivingRoomState copyWith({
    LivingRoomStatus? status,
    bool? lightOne,
    bool? fan,
    bool? ac,
    bool? tv,
    double? tempreture,
    double? humidity,
  }) => LivingRoomState(
    status: status ?? this.status,
    lightOne: lightOne ?? this.lightOne,
    fan: fan ?? this.fan,
    ac: ac ?? this.ac,
    tv: tv ?? this.tv,
    tempreture: tempreture ?? this.tempreture,
    humidity: humidity ?? this.humidity,
  );

  @override
  List<Object?> get props => [
    status,
    lightOne,
    fan,
    ac,
    tv,
    tempreture,
    humidity,
  ];
}
