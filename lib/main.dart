import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/view-models/images-view-model.dart';
import 'package:movie_task/view-models/person-details-view-model.dart';
import 'package:movie_task/view-models/persons-view-model.dart';
import 'package:movie_task/views/home.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PersonsProvider>(
          create: (context) => PersonsProvider(),
        ),
        ChangeNotifierProvider<PersonsDetailsProvider>(
          create: (context) => PersonsDetailsProvider(),
        ),
        ChangeNotifierProvider<ImagesProvider>(
          create: (context) => ImagesProvider(),
        )
      ],
      child: GetMaterialApp(
        title: 'movie Task',
        debugShowCheckedModeBanner: false,
        home: Home(),
      )
    );
  }
}



