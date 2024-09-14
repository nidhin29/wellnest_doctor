// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wellnest_doctor/Application/edit_profile/editprofile_cubit.dart'
    as _i457;
import 'package:wellnest_doctor/Application/home/home_cubit.dart' as _i371;
import 'package:wellnest_doctor/Application/loggedin/loggedin_cubit.dart'
    as _i177;
import 'package:wellnest_doctor/Application/profile/profile_cubit.dart' as _i25;
import 'package:wellnest_doctor/Application/signin/signin_cubit.dart' as _i167;
import 'package:wellnest_doctor/Application/signup/signup_cubit.dart' as _i164;
import 'package:wellnest_doctor/Domain/Home/home_service.dart' as _i284;
import 'package:wellnest_doctor/Domain/LoggedIn/logged_in_service.dart'
    as _i449;
import 'package:wellnest_doctor/Domain/Profile/profile_service.dart' as _i518;
import 'package:wellnest_doctor/Domain/SignIn/sign_in_service.dart' as _i180;
import 'package:wellnest_doctor/Domain/SignUp/signup_service.dart' as _i409;
import 'package:wellnest_doctor/Domain/TokenManager/token_service.dart'
    as _i522;
import 'package:wellnest_doctor/Infrastructure/Home/home_repo.dart' as _i819;
import 'package:wellnest_doctor/Infrastructure/LoggedIn/logged_in_repo.dart'
    as _i855;
import 'package:wellnest_doctor/Infrastructure/Profile/profile_repo.dart'
    as _i171;
import 'package:wellnest_doctor/Infrastructure/SignIn/sign_in_repo.dart'
    as _i950;
import 'package:wellnest_doctor/Infrastructure/SignUp/signup_repo.dart'
    as _i613;
import 'package:wellnest_doctor/Infrastructure/TokenManager/token_repo.dart'
    as _i610;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i518.ProfileService>(() => _i171.ProfileRepo());
    gh.lazySingleton<_i522.TokenService>(() => _i610.TokenRepo());
    gh.factory<_i457.EditprofileCubit>(
        () => _i457.EditprofileCubit(gh<_i518.ProfileService>()));
    gh.lazySingleton<_i180.SignInService>(() => _i950.SignInRepo());
    gh.factory<_i25.ProfileCubit>(() => _i25.ProfileCubit(
          gh<_i518.ProfileService>(),
          gh<_i522.TokenService>(),
        ));
    gh.lazySingleton<_i409.SignUpService>(() => _i613.SignUpRepo());
    gh.lazySingleton<_i284.HomeService>(() => _i819.HomeRepo());
    gh.lazySingleton<_i449.LoggedInService>(() => _i855.LoggedInRepo());
    gh.factory<_i177.LoggedinCubit>(
        () => _i177.LoggedinCubit(gh<_i449.LoggedInService>()));
    gh.factory<_i164.SignupCubit>(() => _i164.SignupCubit(
          gh<_i409.SignUpService>(),
          gh<_i522.TokenService>(),
        ));
    gh.factory<_i167.SigninCubit>(() => _i167.SigninCubit(
          gh<_i180.SignInService>(),
          gh<_i522.TokenService>(),
        ));
    gh.factory<_i371.HomeCubit>(() => _i371.HomeCubit(gh<_i284.HomeService>()));
    return this;
  }
}
