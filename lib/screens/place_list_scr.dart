import 'package:flutter/material.dart';
import 'package:private_photo_album/screens/add_place_scr.dart';
import 'package:provider/provider.dart';
import '../provider/user_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScr.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<UserPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder:(ctx, snapshpt) => snapshpt.connectionState == ConnectionState.waiting ?
        Center(child: CircularProgressIndicator(),) : Consumer<UserPlaces>(
          child: Center(
              child: Text('Got no place yet, start adding some')
          ),
          builder: (ctx, userPlace, ch) =>
              userPlace.items.length <= 0 ? ch :
              ListView.builder(itemCount: userPlace.items.length,
                  itemBuilder: (ctx, i) => ListTile(leading:
                  CircleAvatar(backgroundImage: FileImage(userPlace.items[i].image)),
                  title: Text(userPlace.items[i].title),
                    onTap: () {
                    // go to detail page ...
                    },
                )
              )

        ),
      )

    );
  }
}
