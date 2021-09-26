import 'package:flutter/material.dart';

// ignore: camel_case_types
class fakeNotification extends StatefulWidget {
  const fakeNotification({Key? key}) : super(key: key);

  @override
  _fakeNotificationState createState() => _fakeNotificationState();
}

// ignore: camel_case_types
class _fakeNotificationState extends State<fakeNotification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 6,
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
          leading: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          backgroundColor: const Color(0xFF96DED1),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //First of all we need to creat the post editor
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xfF86B4CF),
                    borderRadius: BorderRadius.circular(12.0),
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
                          children: const [
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'There is no Notification!',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'There is no Notification!',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
