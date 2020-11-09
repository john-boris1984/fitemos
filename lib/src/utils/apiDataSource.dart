import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fitemos/src/utils/networkUtil.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  static final BASE_URL = "https://fitemos.com/api/";
  //static final BASE_URL = "https://dev.fitemos.com/api/";
  static final BASE_URL_GET = "fitemos.com";
  //static final BASE_URL_GET = "dev.fitemos.com";
  static final LOGIN_URL = BASE_URL + "login";
  static final GOOGLE_LOGIN_URL = BASE_URL + "google/login";
  static final FACEBOOK_LOGIN_URL = BASE_URL + "facebook/login";
  static final WORKOUT_URL = BASE_URL + "done/workouts";
  static final CHECK_URL = BASE_URL + "done/check";
  static final RSET_URL = BASE_URL + "password/reset";
  static final BLOG_URI = "/api/events/home";
  static final SHOP_URI = "/api/companies/home";
  static final LEVEL_URI = BASE_URL + "levelTests";
  static final EQUIPMENT_URI = BASE_URL + "customers/changeWeights";
  static final OBJECTIVE_URI = BASE_URL + "customers/changeObjective";
  static final SWITCH_WORKOUT_URI = BASE_URL + "customers/trigger-workout";
  static final SWITCH_NOTIFY_URI = BASE_URL + "customers/trigger-notifiable";
  static final ACCESS_TOKEN_URI = BASE_URL + "users/accessToken";
  static final ADD_BENCH_URL = BASE_URL + "benchmarkResults";
  static final ADD_WEIGHT_URL = BASE_URL + "customers/weights";
  static final UPDATE_URL = BASE_URL + "users/accessToken";
  static final UPDATE_CUSTOMER_URL = BASE_URL + "users/customerUpdate";
  static final UPLOAD_AVATAR_URL = BASE_URL + "users/upload-image";
  static final SAVE_CONTACT_URL = BASE_URL + "contacts";
  static final SAVE_SURVEY_URL = BASE_URL + "survey-reports";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL,
        body: {"email": username, "password": password}).then((dynamic res) {
      storage.setItem('accessToken', res);
      return new User.map(res);
    });
  }

  Future<User> getUserInfo(String accessToken) {
    return _netUtil.postWithAccessToken(UPDATE_URL, accessToken, body: {}).then(
        (dynamic res) {
      storage.setItem('accessToken', res);
      return new User.map(res);
    });
  }

  Future<User> loginWithGoogle(String googleAccessToken) {
    return _netUtil.post(GOOGLE_LOGIN_URL, body: {
      "access_token": googleAccessToken,
      //"mobile": "true"
    }).then((dynamic res) {
      storage.setItem('accessToken', res);
      return new User.map(res);
    });
  }

  Future<User> loginWithFacebook(String facebookToken) {
    return _netUtil.post(FACEBOOK_LOGIN_URL,
        body: {"access_token": facebookToken}).then((dynamic res) {
      storage.setItem('accessToken', res);
      return new User.map(res);
    });
  }

  Future<Account> updateUserInfo(String accessToken) {
    return _netUtil.postWithAccessToken(UPDATE_URL, accessToken, body: {}).then(
        (dynamic res) {
      storage.setItem('accessToken', res);
      return new Account.map(res);
    });
  }

  Future<ResetPassword> resetPassword(String username) {
    return _netUtil
        .post(RSET_URL, body: {"email": username}).then((dynamic res) {
      return new ResetPassword.map(res);
    });
  }

  Future<Workout> getWorkout(String date, String accessToken) {
    return _netUtil.postWithAccessToken(WORKOUT_URL, accessToken,
        body: {"date": date.toString()}).then((dynamic res) {     
      return new Workout.map(res);
    });
  }

  Future<CheckVal> setCheck(String date, bool checkVal, String accessToken) {
    return _netUtil.postWithAccessToken(CHECK_URL, accessToken, body: {
      "date": date.toString(),
      "blog": checkVal.toString()
    }).then((dynamic res) {
      return new CheckVal.map(res);
    });
  }

  Future<Account> addBenchMark(
      String itemId, String date, String repetition, String accessToken) {
    return _netUtil.postWithAccessToken(ADD_BENCH_URL, accessToken, body: {
      "benchmark_id": itemId,
      "recording_date": date,
      "repetition": repetition
    }).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<GetBlog> getBlogData(
      String pageSize, String pageNumber, String accessToken) {
    var queryParameters = {
      'pageSize': pageSize,
      'pageNumber': pageNumber,
    };
    return _netUtil
        .getWithParams(BASE_URL_GET, BLOG_URI, accessToken, queryParameters)
        .then((dynamic res) {
      return new GetBlog.map(res);
    });
  }

  Future<GetShop> getShopData(
      String pageSize, String pageNumber, String accessToken) {
    var queryParameters = {
      'pageSize': pageSize,
      'pageNumber': pageNumber,
    };
    return _netUtil
        .getWithParams(BASE_URL_GET, SHOP_URI, accessToken, queryParameters)
        .then((dynamic res) {
      return new GetShop.map(res);
    });
  }

  Future<GetShopItem> getShopItem(
      String pageSize, String pageNumber, String accessToken, String itemId) {
    var queryParameters = {
      'pageSize': pageSize,
      'pageNumber': pageNumber,
    };
    String customUri = '/api/companies/$itemId/home';

    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new GetShopItem.map(res);
    });
  }

  Future<GetShopItem> getGalleries(
      String pageSize, String pageNumber, String accessToken, String itemId) {
    var queryParameters = {
      'pageSize': pageSize,
      'pageNumber': pageNumber,
    };
    String customUri = '/api/products/$itemId/home';

    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new GetShopItem.map(res);
    });
  }

  Future<Download> downloadBrochure(
      String filePath, String itemId, String accessToken) {
    var queryParameters;
    String customUri = '/api/products/$itemId/download';
    return _netUtil
        .getDownload(BASE_URL_GET, customUri, accessToken, queryParameters,
            filePath, itemId)
        .then((File res) {
      return new Download.map(res);
    });
  }

  Future<Account> getProfileWorkout(String accessToken) {
    var queryParameters;
    String customUri = '/api/customers/recentWorkouts';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> getItemHistory(String itemId, String accessToken) {
    var queryParameters;
    String customUri = '/api/benchmarkResults/$itemId/benchmark';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> getBenchmark(String accessToken) {
    var queryParameters;
    String customUri = '/api/benchmarks/published';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> updateBenchMark(
      String itemId, String date, String repetition, String accessToken) {
    var queryParameters = {
      'id': itemId,
      'recording_date': date,
      'repetition': repetition,
    };
    String customUri = '/api/benchmarkResults/$itemId';
    return _netUtil
        .putWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> getHistory(String accessToken) {
    var queryParameters;
    String customUri = '/api/benchmarkResults/history';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> getCurrentLevel(
      String pageSize, String pageNumber, String accessToken) {
    var queryParameters = {
      'pageSize': pageSize,
      'pageNumber': pageNumber,
    };
    String customUri = '/api/levelTests';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> deleteLevelHistory(String accessToken, int itemId) {
    var queryParameters;
    String customUri = 'api/levelTests/$itemId';
    return _netUtil
        .deleteWithAccessToken(
            BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> updateLevel(int level, String accessToken) {
    return _netUtil.postWithAccessToken(LEVEL_URI, accessToken,
        body: {"repetition": level.toString()}).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> setEquipment(String equipmentVal, String accessToken) {
    return _netUtil.postWithAccessToken(EQUIPMENT_URI, accessToken,
        body: {"weights": equipmentVal}).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> setObjective(String objectiveVal, String accessToken) {
    return _netUtil.postWithAccessToken(OBJECTIVE_URI, accessToken,
        body: {"goal": objectiveVal}).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> switchWorkout(String accessToken) {
    return _netUtil
        .postWithAccessToken(SWITCH_WORKOUT_URI, accessToken)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> switchNotify(String accessToken) {
    return _netUtil
        .postWithAccessToken(SWITCH_NOTIFY_URI, accessToken)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> updateUserInfor(String accessToken) {
    return _netUtil
        .postWithAccessToken(ACCESS_TOKEN_URI, accessToken)
        .then((dynamic res) {
      storage.setItem('accessToken', res);
      return new Account.map(res);
    });
  }

  Future<Account> deleteBenchHistory(String accessToken, String itemId) {
    var queryParameters;
    String customUri = '/api/benchmarkResults/$itemId';
    return _netUtil
        .deleteWithAccessToken(
            BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> getWeightHistory(String accessToken) {
    var queryParameters;
    String customUri = '/api/customers/weights';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> deleteWeightHistory(String accessToken, String itemId) {
    var queryParameters = {
      'id': itemId,
    };
    String customUri = '/api/customers/weights';
    return _netUtil
        .deleteWithAccessToken(
            BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> updateWeight(
      String itemId, String date, String repetition, String accessToken) {
    var queryParameters = {
      'date': date,
      'id': itemId,
      'size': repetition,
    };
    String customUri = '/api/customers/weights';
    return _netUtil
        .putWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> addWeight(
      String date, String repetition, String accessToken) {
    return _netUtil.postWithAccessToken(ADD_WEIGHT_URL, accessToken,
        body: {"date": date, "size": repetition}).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> updateChangedInfor(
      String firstName,
      String lastName,
      String whatNumber,
      String country,
      String isoCode,
      String height,
      String gender,
      String accessToken) {
    return _netUtil
        .postWithAccessToken(UPDATE_CUSTOMER_URL, accessToken, body: {
      "first_name": firstName,
      "last_name": lastName,
      "whatsapp_phone_number": whatNumber,
      "country": country,
      "country_code": isoCode,
      "current_height": height,
      "gender": gender,
    }).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> updateEmailOnly(String email, String accessToken) {
    var queryParameters = {
      'email': email,
    };
    String customUri = '/api/users/email-only';
    return _netUtil
        .putWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> updatePassword(String password, String accessToken) {
    //var queryParameters;
    var queryParameters = {
      'password': password,
    };
    String customUri = '/api/users/update-password';
    return _netUtil
        .putWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> uploadAvatarImage1(File img, String accessToken) {
    return _netUtil.postWithAccessToken(UPLOAD_AVATAR_URL, accessToken,
        body: {"image": img.readAsBytes()}).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> uploadAvatarImage(File img, String accessToken) {
    return _netUtil
        .uploadAvatarImage(UPLOAD_AVATAR_URL, accessToken, img)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> saveContactContent(
      String email, String message, String name, String accessToken) {
    print(message);
    return _netUtil.postWithAccessToken(SAVE_CONTACT_URL, accessToken, body: {
      "email": email,
      "message": message,
      "name": name
    }).then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> getReferral(String accessToken) {
    var queryParameters;
    String customUri = '/api/customers/referral';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> getSurvey(String accessToken) {
    var queryParameters;
    String customUri = '/api/surveys/me';
    return _netUtil
        .getWithParams(BASE_URL_GET, customUri, accessToken, queryParameters)
        .then((dynamic res) {
      return new Account.map(res);
    });
  }

  Future<Account> sendSurvey(dynamic retVal, String accessToken) {
    return _netUtil.postWithAccessTokenByDynamic(SAVE_SURVEY_URL, accessToken,
        body: {'items': retVal}).then((dynamic res) {
      return new Account.map(res);
    });
  }
}
