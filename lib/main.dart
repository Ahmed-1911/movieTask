import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///C:/Users/Ahmed-Uwk/Documents/GitHub/movieTask/lib/views/home/home.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        title: 'movie Task',
        debugShowCheckedModeBanner: false,
        home: Home(),
      );
  }
}



