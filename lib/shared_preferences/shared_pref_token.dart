import 'package:munchin_app/shared_preferences/sp_models/user_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesToken {
  //Set User
  Future<bool> saveUser(UserTokenModel userTokenModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', userTokenModel!.token.toString());
    return true;
  }

  //Get User
  Future<UserTokenModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    print(token);
    return UserTokenModel(token: token);
  }

  //remove user
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
