import 'package:favorite_places/main.dart';
import 'package:favorite_places/screens/placeDetails.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/screens/addPlaceScreen.dart';
import 'package:favorite_places/models/Place.dart';
import 'package:favorite_places/Notifier/UserPlacesNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homescreen extends ConsumerWidget {
  Homescreen({Key? key}) : super(key: key);

  void _addPlace(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addPlace(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: places[index].image != null
                  ? FileImage(places[index].image!)
                  : null,
            ),
          ),
          title: Text(
            places[index].title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlacedetailScreen(place: places[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
