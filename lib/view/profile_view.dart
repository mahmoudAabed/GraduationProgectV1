import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation/core/view_model/home_view_model.dart';
import 'package:http/http.dart';
import 'package:share_plus/share_plus.dart';
class ProfileView extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(31.945702, 35.886925);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: GetBuilder<HomeViewModel>(
            builder: ((controller) => Center(
                  child: Column(
                    children: [
                      Image.network(
                        "https://www.kindpng.com/picc/m/163-1636340_user-avatar-icon-avatar-transparent-user-icon-png.png",
                        width: double.infinity,
                        height: 300,
                      ),
                      const Text(
                        "Sara",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        auth.currentUser!.email.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),floatingActionButton: FloatingActionButton(
     child: Text("share"),
     onPressed: ()async{
       final urlLocation="https://www.google.com/maps/place/31%C2%B056'44.5%22N+35%C2%B053'12.9%22E/@31.945702,35.8891137,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0xd864da69cfcf6a44!8m2!3d31.945702!4d35.886925";
        await Share.share("the location of the center is : \n \n $urlLocation");
      },
    ),);
  }

// getData() {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final User? user = auth.currentUser;
//   final uid = user?.uid;
//   CollectionReference reference =
//       FirebaseFirestore.instance.collection('Users');
//   reference.add({});
//   print(auth.currentUser?.uid);
//   print("----------------------------------");
// }
}
// child: ElevatedButton(
// onPressed: () => getData,
// child: Text(
// auth.currentUser!.email.toString()
// ),
// ),

// Expanded(child: GoogleMap(
// myLocationButtonEnabled: false,
// myLocationEnabled: false,
// initialCameraPosition: _initalCameraPosition,
// ))
