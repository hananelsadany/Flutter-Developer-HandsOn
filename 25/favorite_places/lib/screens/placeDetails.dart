import 'package:flutter/material.dart';
import 'package:favorite_places/models/Place.dart';

class PlacedetailScreen extends StatelessWidget {
  final Place place;

  const PlacedetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Center(
        child: Stack(
          children: [
            Text(
              place.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            if (place.image != null)
              Image.file(
                place.image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
          ],
        ),
      ),
    );
  }
}
// stack on top of eachother like a z stack.