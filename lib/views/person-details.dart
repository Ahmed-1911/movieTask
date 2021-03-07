import 'package:flutter/material.dart';
import 'package:movie_task/components/widgets/commen-widgets.dart';
import 'package:movie_task/components/widgets/person-details-widgets.dart';
import 'package:movie_task/view-models/person-details-view-model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  Profile(this.personID);
  var personID;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        body: Consumer<PersonsDetailsProvider>(
            builder: (context,details,wid){
              details.fetchPersonListData(widget.personID);
              var person=details.personsDetails;
              return person==null?
              Center(child:spinKit(context)):
              Column(
                children: <Widget>[
                  //==========================================================================================
                  // build Top Section of Profile (include : Profile Image)
                  //==========================================================================================
                  buildHeader(person.profilePath,person.id),
                  //==========================================================================================
                  // build middle Section of Profile (include : main info  )
                  //==========================================================================================
                  buildMainInfo(context,widthC,person.name),
                  SizedBox(height: 10.0),
                  //==========================================================================================
                  //  build Bottom Section of Profile (include : email - phone number - about - location )
                  //==========================================================================================
                  buildInfo(context,person),
                  //==========================================================================================
                  //  build Bottom Section of page (include :all images  )
                  //==========================================================================================
                   buildImages(context,widget.personID)
                ],
              );
            },
          ),
    );
  }

}
