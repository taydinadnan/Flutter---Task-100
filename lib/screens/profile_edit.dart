import 'package:flutter/material.dart';

import '../Models/user.dart';
import '../Models/user_info.dart';
import '../Widgets/profile_widget.dart';
import '../Widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserInfo.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Builder(
          builder: (context) => Scaffold(
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 25,
                ),
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Location',
                  text: user.location,
                  maxLines: 5,
                  onChanged: (location) {},
                ),
                const SizedBox(height: 24),
                FloatingActionButton(
                    child: const Icon(Icons.save_rounded), onPressed: () {})
              ],
            ),
          ),
        ),
      );
}
