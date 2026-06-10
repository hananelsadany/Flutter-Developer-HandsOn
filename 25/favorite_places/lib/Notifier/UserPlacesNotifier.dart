import 'package:favorite_places/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (ref) => UserPlacesNotifier(),
    );

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, latitude REAL, longitude REAL)',
        );
      },
      version: 1,
    );
    return db;
  }

  void addPlace(Place place) async {
    final image = place.image;
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = image!.path.split('/').last;
    final savedImage = await image.copy('${appDir.path}/$fileName');
    final newPlace = Place(
      title: place.title,
      image: savedImage,
      location: place.location,
    );
    final db = await _getDatabase();
    await db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': savedImage.path,
      'latitude': newPlace.location.latitude,
      'longitude': newPlace.location.longitude,
    }, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    state = [...state, newPlace];
  }
}
