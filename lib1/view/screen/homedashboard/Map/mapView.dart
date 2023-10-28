import 'dart:async';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_marker_animation/core/ripple_marker.dart';
import 'package:google_map_marker_animation/widgets/animarker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/locationapi.dart';
import 'package:smile_and_go_app/model/LocationListModel.dart';
import 'package:smile_and_go_app/model/homebannerModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';

class mapView extends StatefulWidget {
  final LocationListModel locationListModel;
  final BitmapDescriptor customIcon;
  final double lat, long;
  const mapView(
      {Key? key,
      required this.locationListModel,
      required this.customIcon,
      required this.lat,
      required this.long})
      : super(key: key);

  @override
  State<mapView> createState() => _mapViewState();
}

class _mapViewState extends State<mapView> {
  late GoogleMapController mapController;
  final controller = Completer<GoogleMapController>();

  Locationapi api = Locationapi();
  final Set<Marker> markers = new Set();
//  LatLng showLocation = LatLng();

  List<Marker> _marker = [];
  // final List<Marker> _list = [
  //   Marker(
  //       markerId: MarkerId('1'),
  //       onTap: () {
  //         print("My Position1");
  //       },
  //       position: LatLng(20.42796133580664, 80.885749655962),
  //       infoWindow: InfoWindow(
  //         title: 'My Position',
  //       )),
  //   Marker(
  //       markerId: MarkerId('2'),
  //       onTap: () {
  //         print("My Position2");
  //       },
  //       position: LatLng(25.42796133580664, 80.885749655962),
  //       infoWindow: InfoWindow(
  //         title: 'Location 1',
  //       )),
  //   Marker(
  //       markerId: MarkerId('3'),
  //       position: LatLng(20.42796133580664, 73.885749655962),
  //       onTap: () {
  //         print("My Position3");
  //       },
  //       infoWindow: InfoWindow(
  //         title: 'Location 2',
  //       )),
  // ];

//   Uint8List marker()
//   {
//  final Uint8List customMarker= await getBytesFromAsset(
//  path:"",
//  width: 50
// );
//      return customMarker;
//   }

//   getBytesFromAsset({required String path, required int width}) async
//   {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetWidth: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
//         .buffer
//         .asUint8List();
//   }

// make sure to initialize before map loading

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.locationListModel.data!.length; i++) {
      var distance = (widget.locationListModel.data![i].distance)! * 1000;
      var mileFromMeter = distance / 1609.344;

      _marker.add(
        RippleMarker(
            icon: widget.customIcon,
            markerId: MarkerId(widget.locationListModel.data![i].id.toString()),
            onTap: () {},
            position: LatLng(
                double.parse(widget.locationListModel.data![i].lat.toString()),
                double.parse(widget.locationListModel.data![i].lng.toString())),
            infoWindow: InfoWindow(
              title: widget.locationListModel.data![i].addressLine1.toString() +
                  " " +
                  widget.locationListModel.data![i].addressLine2.toString(),
              snippet: "Distance 20 mile",
              onTap: () {
                Navigator.pushNamed(context, Routes.topdoctor, arguments: {
                  AppStringFile.locationId:
                      widget.locationListModel.data![i].id.toString(),
                });
              },
            ),
            ripple: true),
      );
      setState(() {});
    }

    //_marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    print("count " + _marker.length.toString());
    return Scaffold(
      body: Animarker(
        curve: Curves.bounceInOut,
        duration: Duration(milliseconds: 2000),
        mapId: controller.future.then<int>((value) => value.mapId),
        child: GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat, widget.long),
            zoom: 3.0,
          ),

          markers: Set<Marker>.of(_marker),
          onTap: (argument) {
            print("argument");
          },
          mapType: MapType.normal,
          // onMapCreated: (controller) {
          //   setState(()
          //   {
          //     mapController = controller;
          //   });
          // },
        ),
      ),
    );
  }
}
