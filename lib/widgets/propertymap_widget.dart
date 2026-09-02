import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

class PropertyMapWidget extends StatefulWidget {
  const PropertyMapWidget({super.key});

  @override
  State<PropertyMapWidget> createState() => _PropertyMapWidgetState();
}

class _PropertyMapWidgetState extends State<PropertyMapWidget> {
  mapbox.MapboxMap? mapboxMap;

  void _onMapCreated(mapbox.MapboxMap controller) {
    mapboxMap = controller;
  }

  @override
  Widget build(BuildContext context) {
    return mapbox.MapWidget(
      cameraOptions: mapbox.CameraOptions(
        center: mapbox.Point(coordinates: mapbox.Position(-1.3167, 34.8828)),
        zoom: 12.0,
      ),
      onMapCreated: _onMapCreated,
    );
  }
}
