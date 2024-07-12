import 'package:emergency_alert/Provider/Map/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapProvider(),
      child: Scaffold(
        body: Consumer<MapProvider>(
          builder: (context, mapProvider, child) {
            return mapProvider.currentPosition == null
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: MapProvider.googlePlex,
                      zoom: 13,
                    ),
                    markers: {
                      if (mapProvider.currentPosition != null)
                        Marker(
                          markerId: const MarkerId('currentLocation'),
                          icon: mapProvider.ambulanceIcon ?? BitmapDescriptor.defaultMarker,
                          position: mapProvider.currentPosition!,
                        ),
                      Marker(
                        markerId: const MarkerId('sourceLocation'),
                        icon: mapProvider.hospitalIcon ?? BitmapDescriptor.defaultMarker,
                        position: MapProvider.googlePlex,
                      ),
                      Marker(
                        markerId: const MarkerId('destinationLocation'),
                        icon: mapProvider.hospitalIcon ?? BitmapDescriptor.defaultMarker,
                        position: MapProvider.mountainView,
                      ),
                    },
                    polylines: Set<Polyline>.of(mapProvider.polylines.values),
                  );
          },
        ),
      ),
    );
  }
}
