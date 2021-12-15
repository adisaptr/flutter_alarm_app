import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'bloc/hour/hour_bloc.dart';
import 'bloc/minute/minute_bloc.dart';
import 'home.dart';

void main() {
  tz.initializeTimeZones();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HourBloc>(
      create: (context) => HourBloc(),
    ),
    BlocProvider<MinuteBloc>(
      create: (context) => MinuteBloc(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarm by Hermansyah Adi Saputra',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
    );
  }
}
