import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest_doctor/Presentation/Auth/signin.dart';
import 'package:wellnest_doctor/Presentation/Profile/about.dart';
import 'package:wellnest_doctor/Presentation/Profile/edit_profile.dart';
import 'package:wellnest_doctor/Presentation/common_widgets/profile_menu.dart';
import 'package:wellnest_doctor/Presentation/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('My Profile',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
      ),
      body: Column(
        children: [
          kheight20,
          CircleAvatar(
            radius: size * 0.2,
            backgroundColor: maincolor,
            child: Text(
              getName('Dr. John Doe'),
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          kheight10,
          Column(
            children: [
              Text(
                "Dr John Doe",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(
                width: size * 0.8,
                child: Text(
                  'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians, United Kingdom)',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 112, 111, 111),
                    fontSize: 15,
                  )),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          kheight50,
          ProfileMenuWidget(
              title: 'Edit Profile',
              icon: Icons.person,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ));
              }),
          ProfileMenuWidget(
              title: 'About Us',
              icon: Icons.info,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ));
              }),
          ProfileMenuWidget(
              title: 'Logout',
              icon: Icons.logout,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              }),
        ],
      ),
    );
  }
}

String getName(String name) {
  for (int i = 0; i < name.length; i++) {
    if (name[i] == ' ') {
      return name[i + 1];
    }
  }
  return 'D';
}
