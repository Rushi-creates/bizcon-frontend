import '../service_layer_stub/models/PostMembers.dart';
import '../service_layer_stub/services/ApiHelper.dart';
import '../service_layer_stub/services/SharedPreferences_helper.dart';
import '../service_layer_stub/services/secret_credentials/global.dart';

//Todo : (IMP) All functions of this class must be await , or else wont work
class PostMembers_api_repo {
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

  //   return PostMembers.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp_postFk_isAcceptedFalse(int counter, int post_fk) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.postMembers_getAll,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&post_fk=$post_fk&isAccepted=false');

    return PostMembers.fromMapList(rawData);
  }

  fetchProp_postFk_isAcceptedTrue(int counter, int post_fk) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.postMembers_getAll,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&post_fk=$post_fk&isAccepted=true');

    return PostMembers.fromMapList(rawData);
  }

  fetchProp_postFk_joinedPosts(int counter, int member_fk) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.postMembers_getAll,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&member_fk=$member_fk&isAccepted=true');

    return PostMembers.fromMapList(rawData);
  }

  fetchProp_postFk_appliedToJoin(int counter, int member_fk) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.postMembers_getAll,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&member_fk=$member_fk&isAccepted=false');

    return PostMembers.fromMapList(rawData);
  }
/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return PostMembers.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  create(modelObj) async {
    print(modelObj);
    print(modelObj.toJson());
    var rawData = await _provider.addApi(ApiLinks.postMembers_add, modelObj);
    print(rawData);
    return rawData;
    // print(PostMembers.fromMap(rawData));
    // return PostMembers.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  update(modelObj, modelObj_id) async {
    var rawData = await _provider.updateApi(
        ApiLinks.postMembers_update, modelObj, modelObj_id);

    print(rawData);
    return PostMembers.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  delete(modelObjArg_Id) async {
    var rawData =
        await _provider.deleteApi(ApiLinks.postMembers_delete, modelObjArg_Id);
    return rawData; // as api returns string, not a map
  }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//Todo : while using sp , make sure to use await , kw , or it wont work
// CacheHelper.get('UserAcc');
// await CacheHelper.set('UserAcc');
// await CacheHelper.remove('UserAcc');

class PostMembers_sp_repo {
  set_postmembers(value) async {
    return await CacheHelper.set('postmembers', value);
  }

  //! do not use await in get
  get_postmembers(key) {
    return CacheHelper.get(key);
  }

  remove_postmembers(key) async {
    return await CacheHelper.remove(key);
  }
}
