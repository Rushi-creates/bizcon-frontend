import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:bizcon1/Repo/User_repo.dart';

import '../service_layer_stub/models/Post.dart';
import '../service_layer_stub/services/ApiHelper.dart';
import '../service_layer_stub/services/SharedPreferences_helper.dart';
import '../service_layer_stub/services/secret_credentials/global.dart';

//Todo : (IMP) All functions of this class must be await , or else wont work
class Post_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15; // used in pagination of fetches

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  fetchAll(int counter) async {
    var rawData = await _provider.fetchJsonList(
      fetchUrl: ApiLinks.post_getAll,
      pageSize: pageSizeVar,
      pageNum: counter,
    );

    return Post.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchPosts_byProp_pUid(int counter) async {
    print("=============${Profile_sp_repo.get_profile()!.p_uid}");
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.post_getAll,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: "&post_fk=${Profile_sp_repo.get_profile()!.p_uid}");
    return Post.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return Post.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return Post.fromMap(rawData);
  // }

  Future<Post> add_post(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.post_add, modelObj);
    print(rawData);
    return Post.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return Post.fromMap(rawData);
  // }

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

class Post_sp_repo {
  set_post(value) async {
    return await CacheHelper.set('post', value);
  }

  //! do not use await in get
  get_post() {
    return CacheHelper.get('post');
  }

  remove_post() async {
    return await CacheHelper.remove('post');
  }
}
