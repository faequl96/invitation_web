import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/view_model.dart';

class CountDown extends StatefulWidget with GetItStatefulWidgetMixin {
  CountDown({super.key, required this.unitTimeType, required this.size});

  final UnitTimeType unitTimeType;
  final double size;

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> with GetItStateMixin {
  late Timer _timer;

  final DateTime dateTime = DateTime(2024, 8, 10, 9);

  String day = "";
  String hour = "";
  String minute = "";
  String second = "";

  String getUnitTime() {
    switch (widget.unitTimeType) {
      case UnitTimeType.Day:
        return "Hari";
      case UnitTimeType.Hour:
        return "Jam";
      case UnitTimeType.Minute:
        return "Menit";
      case UnitTimeType.Second:
        return "Detik";
    }
  }

  String getUnitTimeValue() {
    Duration countDownDuration = dateTime.difference(DateTime.now());

    final int days = countDownDuration.inDays;
    final int hours = countDownDuration.inHours.remainder(24);
    final int minutes = countDownDuration.inMinutes.remainder(60);
    final int seconds = countDownDuration.inSeconds.remainder(60);

    switch (widget.unitTimeType) {
      case UnitTimeType.Day:
        return "$days";
      case UnitTimeType.Hour:
        return "$hours";
      case UnitTimeType.Minute:
        return "$minutes";
      case UnitTimeType.Second:
        return "$seconds";
    }
  }

  Color getFrameColor() {
    switch (widget.unitTimeType) {
      case UnitTimeType.Day:
      case UnitTimeType.Minute:
        return const Color.fromARGB(255, 230, 211, 164);
      case UnitTimeType.Hour:
      case UnitTimeType.Second:
        return const Color.fromARGB(240, 255, 204, 192);
    }
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ViewModel vM = get<ViewModel>();

    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: getFrameColor(),
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 255, 250, 230),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getUnitTimeValue(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: s(vM.w, 13, 14, 15, 16),
                height: 1.2,
              ),
            ),
            Text(
              getUnitTime(),
              style: TextStyle(fontSize: s(vM.w, 10, 11, 12, 13), height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
