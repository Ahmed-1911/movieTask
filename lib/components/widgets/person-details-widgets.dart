import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/components/widgets/commen-widgets.dart';
import 'package:movie_task/views/show-image.dart';

Widget buildHeader(var person) {
  return Stack(
    children: <Widget>[
      Ink(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          gradient: LinearGradient(colors: [
            Colors.blueAccent,
            Colors.lightBlueAccent,
          ]),
        ),
      ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 120),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              color: Colors.white,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.lightBlueAccent,
                    Colors.lightBlue,
                  ]),
                ),
                child: Hero(
                  tag: '${person.id}',
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(85),
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${person.profilePath}',
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget buildMainInfo(BuildContext context, double width, var peron) {
  return Container(
    width: width,
    margin: const EdgeInsets.all(10),
    alignment: AlignmentDirectional.center,
    child: Column(
      children: <Widget>[
        Text(peron.name,
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget buildInfo(BuildContext context, var person) {
  return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  myListTile(Icons.date_range, 'Birthday',
                      person.birthday.year.toString()),
                  Divider(),
                  myListTile(
                      Icons.my_location, 'Place of Birth', person.placeOfBirth),
                  Divider(),
                  myListTile(
                      Icons.stars, 'Popularity', person.popularity.toString()),
                ],
              )
            ],
          ),
        ),
      ));
}

Widget buildImages(BuildContext context,var imagesList) {
  return imagesList.length==0?
  SizedBox():
  Container(
    height: MediaQuery.of(context).size.height * 0.25,
    padding: EdgeInsets.only(bottom: 5),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 120,
      itemCount: imagesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(Show(imagesList[index].filePath));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                    offset: Offset(4, 0),
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 1)
              ],
            ),
            child: myImageContainer(context, imagesList[index].filePath),
          ),
        );
      },
    ),
  );
}

Widget myListTile(IconData icon, String title, String value) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue),
    title: Text(title),
    subtitle: Text(value),
  );
}
