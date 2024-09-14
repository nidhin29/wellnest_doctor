import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnest_doctor/Domain/LoggedIn/logged_in_service.dart';

@LazySingleton(as: LoggedInService)
class LoggedInRepo implements LoggedInService {
  @override
  Future<bool> isLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    final email = sharedPref.getString('email');
    if (email == null) {
      return false;
    } else {
      return true;
    }
  }
}
