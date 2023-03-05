import 'dart:convert';

import 'package:bizcon1/service_layer_stub/models/User.dart';

import '../service_layer_stub/services/ApiHelper.dart';
import '../service_layer_stub/services/SharedPreferences_helper.dart';
import '../service_layer_stub/services/secret_credentials/global.dart';

//Todo : (IMP) All functions of this class must be await , or else wont work
class User_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15; // used in pagination of fetches

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
  create_verifyUserEmail_SendOtp(modelObj) async {
    var rawData = await _provider.addApi(
        ApiLinks.userAcc_verify_userEmail_beforeRegister, modelObj);

    // rawData can either have  OTP 1234 ||  String 'Account already exists, try to login'

    // return rawData;
    return 1234; //TODO : change this static otp later
  }

/* -------------------------------------------------------------------------- */
/*                                  //! Login                                 */
/* -------------------------------------------------------------------------- */

  create_loginUser(modelObj) async {
    // rawData can have 2 values:
    var rawData = await _provider.addApi(ApiLinks.userAcc_login, modelObj);

    // String - "This account doesn't exist, enter correct details or try to register."
    if (rawData is String) {
      return rawData;

      // Single Json map of logged in user
    } else if (rawData is Map<String, dynamic> ||
        rawData is Map<String, List>) {
      UserAcc response = UserAcc.fromMap(rawData);
      return response;

      //Todo : do this func , in bloc ( use func , from below)
      // //Storing reponse (UserAcc obj) to SP
      // await CacheHelper.set('Current_UserAcc_obj', response);

      // return 1; //Bloc flag = logged in success
    }
    ;
  }

/* -------------------------------------------------------------------------- */
/*                         //! Check Otp and Register                         */
/* -------------------------------------------------------------------------- */

  //Todo: make sure to write otp check logic in bloc
  create_UserRegister(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.userAcc_register, modelObj);
    print(rawData);
    print(UserAcc.fromMap(rawData));
    return UserAcc.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await _provider.fetchJsonList(
  //     fetchUrl: ApiLinks.someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //   );

  //   return User.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  // fetchProp(int counter) async {
  //   var rawData = await _provider.fetchJsonList_by_prop(
  //     fetchUrl: ApiLinks.someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //     customSearch: );

  //   return User.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  deleteUser_account(modelObjArg_Id) async {
    var rawData =
        await _provider.deleteApi(ApiLinks.userAcc_delete, modelObjArg_Id);
    return rawData;
  }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//Todo : while using sp , make sure to use await , kw , or it wont work
// CacheHelper.get('UserAcc');
// await CacheHelper.set('UserAcc');
// await CacheHelper.remove('UserAcc');

class User_sp_repo {
  set_user(value) async {
    return await CacheHelper.set('user', value);
  }

  //! do not use await in get
  static UserAcc? get_user() {
    var jsonMap = CacheHelper.getModel('user');

    if (jsonMap == null)
      return null;
    else
      return UserAcc.fromJson(jsonMap);
  }

  remove_user() async {
    return await CacheHelper.remove('user');
  }
}
