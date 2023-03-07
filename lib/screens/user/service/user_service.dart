import 'package:dio/dio.dart';
import 'package:satasat_app/api/api.dart';
import 'package:satasat_app/constant/snackbar.dart';
import 'package:satasat_app/screens/user/model/user_model.dart';

class UserService {
  Future<UserModel?> getUserData() async {
    Response response =
        await API().get(path: "accounts/profile/", useToken: true);
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      showSnackbar("No user data available.");
    }
    return null;
  }
}
