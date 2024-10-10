import 'dart:io';

import 'package:flutter/material.dart';
import 'package:primera_app_8_9/api.dart';
import 'package:primera_app_8_9/home.dart';
import 'package:primera_app_8_9/login.dart';
import 'package:primera_app_8_9/sqlite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Sqlite(),
    );
  }
}
