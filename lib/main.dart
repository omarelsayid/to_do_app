import 'package:flutter/material.dart';

import 'package:hive_local_storage/hive_local_storage.dart';

import 'package:to_do_app/splash_screen.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()));
}
