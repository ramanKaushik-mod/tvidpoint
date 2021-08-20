import 'package:shared_preferences/shared_preferences.dart';
import 'package:tvidpoint/constants.dart';

class Utilties {
  static setUserId({required String userId}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setString(Constants.userID, userId);
    });
  }

  static getUserId() async => await SharedPreferences.getInstance()
      .then((value) => value.getString(Constants.userID));
  static clearUserId() async {
    await SharedPreferences.getInstance()
        .then((value) => value.remove(Constants.userID));
  }

  static setFlagForOnBoardScreen() async {
    await SharedPreferences.getInstance()
        .then((value) => value.setBool(Constants.onBoardVisit, true));
  }

  static getFlagOfOnBoardScreen() async => await SharedPreferences.getInstance()
      .then((value) => value.getBool(Constants.onBoardVisit) ?? false);

  static setSignedInStatus() async {
    await SharedPreferences.getInstance()
        .then((value) => value.setBool(Constants.signedIn, true));
  }

  static getSignedInStatus() async => await SharedPreferences.getInstance()
      .then((value) => value.getBool(Constants.signedIn) ?? false);

  static clearEveryThing() async {
    await SharedPreferences.getInstance().then((value) => value.clear());
  }
}
