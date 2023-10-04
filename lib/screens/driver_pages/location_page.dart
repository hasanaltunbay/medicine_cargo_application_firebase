import 'dart:async';
import 'package:drug_shipping/data/entity/teslimatBilgi.dart';
import 'package:drug_shipping/screens/driver_pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slide_countdown/slide_countdown.dart';

class LocationPage extends StatefulWidget {

   TeslimatBilgi teslimatBilgi;


  LocationPage({required this.teslimatBilgi});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  bool isVisible=false;
  bool isButonLocationVisible=false;

  @override
  void initState() {
    super.initState();
     cityController.text=widget.teslimatBilgi.nereye;
  }

  TextEditingController cityController = TextEditingController();
  String latitude = '';
  String longitude = '';
  Future<void> _getCoordinates() async {
    final query = cityController.text;
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        setState(() {
          latitude = locations[0].latitude.toString();
          longitude = locations[0].longitude.toString();
        });
      } else {
        setState(() {
          latitude = 'Not Found';
          longitude = 'Not Found';
        });
      }
    } catch (e) {
      print('Error: $e');
    }
    setState(() {
      isButonLocationVisible=true;
    });
  }

  Completer<GoogleMapController> mapControl= Completer();

  var startingPosition=CameraPosition(target: LatLng(39.9035233,32.807958),zoom: 10);

  List<Marker> markers = <Marker>[];


  Future<void> goToLocation() async{
    GoogleMapController controller = await mapControl.future;
    var nLatitude=double.parse(latitude);
    var nLongitude=double.parse(longitude);
    var destination=CameraPosition(target: LatLng(nLatitude,nLongitude),zoom: 11);


    var goToMarker= Marker(
        markerId: MarkerId("id"),
        position: LatLng(nLatitude,nLongitude),
        infoWindow: InfoWindow(title: "${cityController.text.toUpperCase()}")
    );
    setState(() {
      markers.add(goToMarker);
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(destination));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location"),backgroundColor: Colors.red,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                child: TextField(controller: cityController,
                  enabled: false,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: _getCoordinates,
                child: Text('Get Coordinates',style: TextStyle(color: Colors.black),),
              ),
              SizedBox(height: 10,),
              Text('Latitude: $latitude'),
              SizedBox(height: 5,),
              Text('Longitude: $longitude'),
              SizedBox(height: 10,),


              SizedBox(height: 300,width: 300,
                child: GoogleMap(
                  initialCameraPosition: startingPosition,
                mapType:MapType.normal ,
                  markers: Set<Marker>.of(markers),
                  onMapCreated: (GoogleMapController controller){
                  mapControl.complete(controller);
                  },
                ),
              ),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Visibility(visible: isButonLocationVisible,
                        child: ElevatedButton(onPressed: (){
                          goToLocation();
                          setState(() {
                            isVisible=true;
                          });
                        }, child: Text("Go To Location",style: TextStyle(color: Colors.black),)),
                      ),
                      Visibility(visible: isVisible,
                        child: Center(
                            child:SlideCountdown(
                              duration: Duration(hours: widget.teslimatBilgi.sure),
                              showZeroValue: true,

                              onDone: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultPage(teslimat: widget.teslimatBilgi,)));
                              },
                            )
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Visibility(visible: isVisible,
                          child: ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Cancel",style: TextStyle(color: Colors.black),))),
                      Visibility(visible: isVisible,
                          child: ElevatedButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultPage(teslimat: widget.teslimatBilgi,)));
                          }, child: Text("Cargo Delivered",style: TextStyle(color: Colors.black),))),
                    ],
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
