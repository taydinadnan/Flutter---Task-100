import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tech387task/Widgets/profile_widget.dart';
import 'package:tech387task/Widgets/user_social_buttons.dart';
import 'package:tech387task/provider/auth_provider.dart';
import 'package:tech387task/screens/AuthScreen/login.dart';
import 'package:tech387task/screens/profile_edit.dart';

class ProfileSc extends StatefulWidget {
  const ProfileSc({Key? key}) : super(key: key);

  @override
  _ProfileScState createState() => _ProfileScState();
}

class _ProfileScState extends State<ProfileSc> {
  List<Marker> allMarkers = [];

  late GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    allMarkers.add(
      Marker(
        markerId: const MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          // ignore: avoid_print
          print('Marker Tapped');
        },
        position: const LatLng(40.7128, -74.0060),
      ),
    );
  }

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;

  User? user = FirebaseAuth.instance.currentUser;

//Email verification function
  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has been sent');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black26,
          content: Text(
            'Verification Email has been sent',
            style: TextStyle(fontSize: 18.0, color: Colors.amber),
          ),
        ),
      );
    }
  }

//userid display
  Widget buildName(User user) => Column(
        children: [
          Text(
            user.uid,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
        ],
      );

//googlemaps location , and moving from one location to another location
  Widget buildlocation(User location) => Stack(
        children: [
          Center(
            child: SizedBox(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                    target: LatLng(40.7128, -74.0060), zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: movetoSarajevo,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      );

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

//move map camera posiyon to sarajevo
  movetoSarajevo() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
            target: LatLng(43.856430, 18.413029),
            zoom: 12.0,
            bearing: 45.0,
            tilt: 45.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0XFFB6D0E2),
          border: Border.all(color: Colors.grey),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 50.0,
            ),
            ProfileWidget(
              imagePath: '',
              onClicked: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()),
                    (route) => false);
              },
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email: $email',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                user!.emailVerified
                    ? const Text(
                        'Verified',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.grey,
                        ),
                      )
                    : TextButton(
                        onPressed: () => {verifyEmail()},
                        child: const Text(
                          'Verify Email',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 14),
            const UserSocalButtns(),
            const SizedBox(height: 24),
            Container(color: Colors.grey, child: buildlocation(user!)),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    AuthClass().signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginAuth(context)),
                        (route) => false);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
