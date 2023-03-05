import 'dart:convert';

import '../service_layer_stub/models/Profile.dart';
import '../service_layer_stub/services/ApiHelper.dart';
import '../service_layer_stub/services/SharedPreferences_helper.dart';
import '../service_layer_stub/services/secret_credentials/global.dart';

//Todo : (IMP) All functions of this class must be await , or else wont work
class Profile_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15; // used in pagination of fetches

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await _provider.fetchJsonList(
  //     fetchUrl: ApiLinks.someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //   );

  //   return Profile.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp_byUsername(int counter, searchText) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.profile_getAll,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&username=$searchText');

    return Profile.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  doesProfileExists(modelObj_id) async {
    var rawData = await _provider.fetchSingleJson_by_id(
        ApiLinks.profile_isExists, modelObj_id);

    // var decodedJson = json.decode(rawData);
    print(rawData);
    if (rawData == false)
      return false;
    else if (rawData is Map<String, dynamic>) return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return Profile.fromMap(rawData);
  // }

  Future<Profile> add_profile(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.profile_add, modelObj);
    print('******************');

    print(rawData);
    print('******************');
    return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  Future<Profile> update_profile(modelObj, modelObj_id) async {
    var rawData = await _provider.updateApi(
        ApiLinks.profile_update, modelObj, modelObj_id);
    return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(modelObjArg_Id) async {
//     var rawData = await _provider.deleteApi(ApiLinks.deleteApiUrl, modelObjArg_Id);
//     return rawData; // as api returns string, not a map
//   }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//Todo : while using sp , make sure to use await , kw , or it wont work
// CacheHelper.get('UserAcc');
// await CacheHelper.set('UserAcc');
// await CacheHelper.remove('UserAcc');

class Profile_sp_repo {
  set_profile(value) async {
    return await CacheHelper.set('profile', value);
  }

  //! do not use await in get
  static Profile? get_profile() {
    var jsonMap = CacheHelper.getModel('profile');

    if (jsonMap == null)
      return null;
    else
      return Profile.fromJson(jsonMap);
  }

  remove_profile() async {
    return await CacheHelper.remove('profile');
  }
}
