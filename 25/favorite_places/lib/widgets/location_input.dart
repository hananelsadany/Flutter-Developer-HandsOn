import 'dart:convert';

import 'package:favorite_places/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Location? _location;
  var _isGettingLocation = false;
  PlaceLocation? _pickedLocation;

  String get locationImage {
    if (_pickedLocation == null) {
      //validation for null
      return '';
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyC5KDbd_lgDCuQ0ewEV4htnq8CdRodjx9Q';
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${locationData.latitude},${locationData.longitude}&location_type=ROOFTOP&result_type=street_address&key=AIzaSyC5KDbd_lgDCuQ0ewEV4htnq8CdRodjx9Q',
    );

    final response = await http.get(url);

    final responseData = json.decode(response.body);
    print(responseData);
    final address = responseData['results'][0]['formatted_address'];
    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
        address: address,
      );
      _isGettingLocation = false;
    });
  }

  String? _validateLocation() {
    if (_pickedLocation == null) {
      return 'Location must not be empty nor null';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          width: double.infinity,
          height: 150,
          child: const Center(
            child: Text('No Location Chosen', textAlign: TextAlign.center),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text("Current Location"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text("Select on Map"),
            ),
          ],
        ),
      ],
    );

    if (_isGettingLocation == true) {
      content = Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        width: double.infinity,
        height: 150,
        child: const Center(child: Center(child: CircularProgressIndicator())),
      );
      // const Center(child: CircularProgressIndicator());
    }

    return content;
  }
}
