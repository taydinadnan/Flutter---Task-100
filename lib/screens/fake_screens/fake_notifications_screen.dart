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
          title: const Text('Notifications'),
          backgroundColor: const Color(0xfF86B4CF),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //First of all we need to creat the post editor
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xfF86B4CF),
                    borderRadius: BorderRadius.circular(12.0),
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
                            Icon(Icons.notification_important_outlined),
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
                            Icon(Icons.notification_important_outlined),
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
