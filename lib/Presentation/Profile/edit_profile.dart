import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "XXXX");

  final TextEditingController _specializationController =
      TextEditingController(text: "XXXX");

  final TextEditingController _experienceController =
      TextEditingController(text: "00");

  final TextEditingController _patientsTreatedController =
      TextEditingController(text: "00");

  final TextEditingController _educationController =
      TextEditingController(text: "XXXX");

  final TextEditingController _currentHospitalController =
      TextEditingController(text: "XXXX");

  final TextEditingController _aboutController =
      TextEditingController(text: "XXXX");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Edit Profile',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size * 0.02, bottom: size * 0.01),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Save',
                style: TextStyle(
                    color: Color.fromARGB(255, 66, 159, 69), fontSize: 17),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              _TextFieldWithTitle(
                title: "Name",
                controller: _nameController,
              ),
              _TextFieldWithTitle(
                title: "Specialization",
                controller: _specializationController,
              ),
              _TextFieldWithTitle(
                title: "Experience",
                controller: _experienceController,
              ),
              _TextFieldWithTitle(
                title: "Patients Treated",
                controller: _patientsTreatedController,
              ),
              _TextFieldWithTitle(
                title: "Education",
                controller: _educationController,
              ),
              _TextFieldWithTitle(
                title: "Current Working Hoapital",
                controller: _currentHospitalController,
              ),
              _TextFieldWithTitle(
                title: "About",
                controller: _aboutController,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldWithTitle extends StatelessWidget {
  const _TextFieldWithTitle({
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        TextField(
            maxLines: null,
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
