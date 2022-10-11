import 'package:animalcare/main%20screens/doctor%20module/doctorappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalsMap extends StatefulWidget {
  HospitalsMap({Key? key}) : super(key: key);

  @override
  State<HospitalsMap> createState() => _HospitalsMapState();
}

class _HospitalsMapState extends State<HospitalsMap> {
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers =<MarkerId, Marker>{
  };
  void initMarker(specify, specifyID) async {
    var markerIdval = specifyID;
    final MarkerId markerId = MarkerId(markerIdval);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(double.parse(specify['latitude']),double.parse(specify['longitude'])),
      infoWindow: InfoWindow(
        title: specify['name'],
        snippet: specify['phone']
      )
    );
    setState(() {
      markers[markerId] = marker;
    });
  }
  getMarkerData() async{
    FirebaseFirestore.instance.collection("hospitals").get().then((myMockData){
      if(myMockData.docs.isNotEmpty){
        for(int i=0; i< myMockData.docs.length;i++){
          initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
        }
      }
    });
  }
  void initState(){
    getMarkerData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Set<Marker> getMarker() {
      return <Marker>[
        Marker(markerId: MarkerId(""), position: LatLng(29.033333, 30.333334),
        icon:  BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: "aloo",
            snippet: "kjdjwdhiuhih"
          ),
        ),
      ].toSet();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DoctorAppBar("Hospitals location:"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: GoogleMap(
                onMapCreated: (GoogleMapController x) {
                  mapController = x;
                },
                initialCameraPosition: const CameraPosition(
                    target: LatLng(29.033333, 30.333334), zoom: 6),
                markers: Set<Marker>.of(markers.values),),
          ),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}


