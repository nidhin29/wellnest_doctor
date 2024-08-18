import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest_doctor/Presentation/Home/mainmenu.dart';
import 'package:wellnest_doctor/Presentation/constants/constants.dart';

class FillProfilePage extends StatelessWidget {
  FillProfilePage({super.key});
  final nameController = TextEditingController();
  final specializationController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();
  final currentHospitalController = TextEditingController();
  final patientsTreatedController = TextEditingController();
  final aboutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Fill Your Profile',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight20,
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'Full Name',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'Specialization',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight20,
                Padding(
                  padding: EdgeInsets.only(right: size * 0.6, left: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: experienceController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'Experience',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight20,
                Padding(
                  padding: EdgeInsets.only(right: size * 0.5, left: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: patientsTreatedController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'Patients Treated',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    minLines: 2,
                    maxLines: null,
                    controller: educationController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'Education',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: currentHospitalController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'Current Working Hospital',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    minLines: 4,
                    maxLines: null,
                    controller: aboutController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'About',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                kheight20,
                kheight20,
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MainScreenPage(),
                  ),
                  (route) => false,
                );
              },
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(maincolor),
                minimumSize:
                    WidgetStateProperty.all(Size(size * 0.8, size * 0.15)),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            kheight50,
          ],
        ),
      ),
    );
  }
}
