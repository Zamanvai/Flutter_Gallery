import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/user_places.dart';
import './screens/place_list_scr.dart';
import './screens/add_place_scr.dart';
import 'package:local_auth/local_auth.dart';
import 'lib.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserPlaces(),
      child: MaterialApp(
        title: 'Album',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScr.routeName: (ctx) => AddPlaceScr(),
        },
          debugShowCheckedModeBanner:false,
      ),

    );
  }
}
