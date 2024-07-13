import 'package:emergency_alert/Provider/Map/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await Provider.of<MapProvider>(context,listen: false).fetchLocationUpdates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Consumer<MapProvider>(
          builder: (context, mapProvider, child) {
            // print(mapProvider.currentPosition);
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
      );
  }
}
