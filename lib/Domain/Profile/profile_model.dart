class ProfileModel {
  final String name;
  final String specialization;
  final String experience;
  final String patients;
  final String education;
  final String currentWorkingHospital;
  final String about;

  ProfileModel( {
required this.specialization, required this.experience, required this.patients, required this.education, required this.currentWorkingHospital, required this.about,
    required this.name,
  });
}
