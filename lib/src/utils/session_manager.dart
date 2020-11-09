import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences _sharedPrefs;

  static void initialize(SharedPreferences sharedPreferences) {
    _sharedPrefs = sharedPreferences;
  }

  static void rememberMe(bool remember) {
    _sharedPrefs.setBool('remember', remember);
  }

  static bool rememberedMe() {
    return _sharedPrefs.getBool('remember') ?? false;
  }

  static void setLogIn(bool flag) {
    _sharedPrefs.setBool('login_flag', flag);
  }

  static bool getLogIn() {
    return _sharedPrefs.getBool('login_flag') ?? false;
  }

  static void setIPadFlag(int flag) {
    _sharedPrefs.setInt('ipad_flag', flag);
  }

  static int getIPadFlag() {
    return _sharedPrefs.getInt('ipad_flag') ?? -1;
  }

  static void setToken(String token) {
    _sharedPrefs.setString('access_token', token);
  }

  static String getToken() {
    return _sharedPrefs.getString('access_token') ?? "";
  }

  // static void setLanguage(String lang) {
  //   _sharedPrefs.setString('lang', lang);
  // }

  // static String getLanguage() {
  //   return _sharedPrefs.getString('lang') ?? '';
  // }

  static void setUserID(int id) {
    _sharedPrefs.setInt('user_id', id);
  }

  static int getUserID() {
    return _sharedPrefs.getInt('user_id') ?? -1;
  }
  
  static void setUserName(String username) {
    _sharedPrefs.setString('username', username);
  }

  static String getUserName() {
    return _sharedPrefs.getString('username') ?? '';
  }
  static void setStopWatchState(bool flag) {
    _sharedPrefs.setBool('running_flag', flag);
  }

  static bool getStopWatchState() {
    return _sharedPrefs.getBool('running_flag') ?? false;
  }

  // static void setUfullName(String ufullame) {
  //   _sharedPrefs.setString('ufullame', ufullame);
  // }

  // static String getUfullName() {
  //   return _sharedPrefs.getString('ufullame') ?? '';
  // }

  static void setEmail(String email) {
    _sharedPrefs.setString('email', email);
  }

  static String getEmail() {
    return _sharedPrefs.getString('email') ?? '';
  }

  // static void setPhone(String phone) {
  //   _sharedPrefs.setString('phone', phone);
  // }

  // static String getPhone() {
  //   return _sharedPrefs.getString('phone') ?? '';
  // }

  // static void setForgotPass(bool flag) {
  //   _sharedPrefs.setBool('login_flag', flag);
  // }

  // static bool getForgotPass() {
  //   return _sharedPrefs.getBool('login_flag') ?? false;
  // }

  static void setAvatar(String avatar) {
    _sharedPrefs.setString('avatar', avatar);
  }

  static String getAvatar() {
    return _sharedPrefs.getString('avatar') ?? '';
  }

  // static void setAddress(String address) {
  //   _sharedPrefs.setString('address', address);
  // }

  // static String getAddress() {
  //   return _sharedPrefs.getString('address') ?? '';
  // }

  // static void setSchoolStatus(int status) {
  //   _sharedPrefs.setInt('school_status', status);
  // }

  // static int getSchoolStatus() {
  //   return _sharedPrefs.getInt('school_status') ?? -1;
  // }

  static void setSubscriptionActiveFlag(bool flag) {
    _sharedPrefs.setBool('sub_active_flag', flag);
  }

  static bool getSubscriptionActiveFlag() {
    return _sharedPrefs.getBool('sub_active_flag_flag') ?? false;
  }


}
