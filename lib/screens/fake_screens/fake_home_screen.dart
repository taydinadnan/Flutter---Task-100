import 'package:flutter/material.dart';

// ignore: camel_case_types
class fakeHomeScreen extends StatefulWidget {
  const fakeHomeScreen({Key? key}) : super(key: key);

  @override
  _fakeHomeScreenState createState() => _fakeHomeScreenState();
}

// ignore: camel_case_types
class _fakeHomeScreenState extends State<fakeHomeScreen> {
  List<String> profileUrl = [
    "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",
    "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=644&q=80",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
  ];
  List<String> postUrl = [
    "https://lh3.googleusercontent.com/proxy/oCA8n3qUEYVFG_k_ncpWCI6tfbV4Gerv55NzBvxtqn_D9-NUvIOOSsEPFPmEyw664D-a9GYFhrcPktoHhhpNnu47beGyM209",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5OS0kZBKbgbm8KLMLSszCPOB4lhEJM-ZMmUIakaQoU75dXrMYGyoJiEf7HBHPSQeSdUY&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Feeds',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color(0XFFB6D0E2),
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0XFFB6D0E2),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: TextField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 25.0),
                                    hintText: "Post something...",
                                    filled: true,
                                    fillColor: Colors.grey[350],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        //Now we will create a Row of three button
                        Row(
                          children: const [
                            Spacer(),
                            Icon(
                              Icons.video_collection,
                              semanticLabel: "Video",
                              color: Colors.black,
                            ),
                            Spacer(),
                            Icon(
                              Icons.image,
                              semanticLabel: "Image",
                              color: Colors.black,
                            ),
                            Spacer(),
                            Icon(
                              Icons.location_on,
                              semanticLabel: "Location",
                              color: Colors.black,
                            ),
                            Spacer(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),
                //Now let's create the news feed
                //first we will make the custom container of the feed
                //Ok let's test our widget
                feedBox(profileUrl[0], "Charlotte", "2 min",
                    "Anyone available on the weekend? ", ""),
                feedBox(profileUrl[1], "Michael", "6 min",
                    "This place is amazing!", postUrl[1]),
                feedBox(
                    profileUrl[2],
                    "Lynda",
                    "15 min",
                    "available at the end of this month!! dont miss it ",
                    postUrl[1]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget feedBox(String profileUrl, String userName, String date,
      String contentText, String contentImg) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0XFFB6D0E2),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileUrl),
                  radius: 25.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            if (contentText != "")
              Text(
                contentText,
                style: const TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            const SizedBox(
              height: 10.0,
            ),
            if (contentImg != "") Image.network(contentImg),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
