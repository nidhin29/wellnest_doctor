import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wellnest_doctor/Application/profile/profile_cubit.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Presentation/Auth/signin.dart';
import 'package:wellnest_doctor/Presentation/Profile/about.dart';
import 'package:wellnest_doctor/Presentation/Profile/edit_profile.dart';
import 'package:wellnest_doctor/Presentation/common_widgets/profile_menu.dart';
import 'package:wellnest_doctor/Presentation/common_widgets/snacbar.dart';
import 'package:wellnest_doctor/Presentation/constants/constants.dart';

String getName(String name) {
  for (int i = 0; i < name.length; i++) {
    if (name[i] == ' ') {
      return name[i + 1];
    }
  }
  return 'D';
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getProfile();
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
          BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              state.isFailureOrSuccessForGet.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    if (!state.isLoading) {
                      if (failure == const MainFailure.serverFailure()) {
                        displaySnackBar(
                            context: context, text: "Server is down");
                      } else if (failure == const MainFailure.clientFailure()) {
                        displaySnackBar(
                            context: context,
                            text: "Something wrong with your network");
                      } else {
                        displaySnackBar(
                            context: context,
                            text: "Something Unexpected Happened");
                      }
                    }
                  },
                  (r) {},
                ),
              );
            },
            builder: (context, state) {
              if (state.isLoading) {
                return Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 0, 0, 0),
                      highlightColor: const Color.fromARGB(255, 207, 207, 207),
                      child: Container(
                        width: size * 0.4,
                        height: size * 0.4,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(34, 0, 0, 0),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    kheight10,
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 0, 0, 0),
                      highlightColor: const Color.fromARGB(255, 207, 207, 207),
                      child: Container(
                        width: size * 0.4,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(34, 0, 0, 0),
                        ),
                      ),
                    ),
                    kheight10,
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 0, 0, 0),
                      highlightColor: const Color.fromARGB(255, 207, 207, 207),
                      child: Container(
                        width: size * 0.5,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(34, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                );
              }
              state.isFailureOrSuccessForGet.fold(() {
                return Container(
                  width: double.infinity,
                  height: size * 0.6,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/imgs/noData.png'))),
                );
              }, (either) {
                either.fold((l) {
                  return Container(
                    width: double.infinity,
                    height: size * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/imgs/noData.png'))),
                  );
                }, (r) {});
              });
              return state.profileModel!.name == null ||
                      state.profileModel!.email == null
                  ? Container(
                      width: double.infinity,
                      height: size * 0.5,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/imgs/noData.png'))),
                    )
                  : Column(
                      children: [
                        Container(
                          width: size * 0.4,
                          height: size * 0.4,
                          decoration: const BoxDecoration(
                            color: maincolor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: state.profileModel!.name == null ||
                                    state.profileModel!.name == ''
                                ? const Icon(Icons.person)
                                : Text(
                                    state.profileModel!.name[0].toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: size * 0.2,
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                          ),
                        ),
                        kheight20,
                        state.profileModel!.name == null ||
                                state.profileModel!.name == ''
                            ? const SizedBox()
                            : Text(state.profileModel!.name,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ))),
                        state.profileModel!.email == null ||
                                state.profileModel!.email == ''
                            ? const SizedBox()
                            : Text(state.profileModel!.email!,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ))),
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
                    );
            },
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
                BlocProvider.of<ProfileCubit>(context).deleteEmail();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              }),
        ],
      ),
    );
  }
}
