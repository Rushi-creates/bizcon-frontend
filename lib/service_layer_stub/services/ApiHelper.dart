import 'dart:async';
import 'dart:convert';

import 'secret_credentials/global.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  //! making it singleton
  ApiHelper._instance();
  static final ApiHelper ApiHelperObj = ApiHelper._instance();

/* -------------------------------------------------------------------------- */
/*                      //! Api with basic auth var                           */
/* -------------------------------------------------------------------------- */
  http.Client client = http.Client();

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */

  addApi(postUrl, modelObjArg) async {
    try {
      http.Response myResponse = await client
          .post(Uri.parse(postUrl), body: modelObjArg.toJson(), headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not added to api =>  $e');
    }
  }

  raw_addApi(postUrl, toAdd) async {
    try {
      http.Response myResponse = await client
          .post(Uri.parse(postUrl), body: json.encode(toAdd), headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not added to api =>  $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */

  updateApi(updateUrl, modelObjArg, modelObj_Id_Arg) async {
    try {
      http.Response myResponse = await client.put(
          Uri.parse(updateUrl + modelObj_Id_Arg.toString() + "/"),
          body: modelObjArg.toJson(),
          headers: {
            'authorization': basicAuth,
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not updated to api $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  deleteApi(deleteUrl, modelObjArgId) async {
    try {
      var myResponse = await client.delete(
          Uri.parse(deleteUrl + modelObjArgId.toString() + "/"),
          headers: {
            'authorization': basicAuth,
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('Not deleted from api ==> $e');
    }
  }
/* -------------------------------------------------------------------------- */
/*                                //! Fetch all                               */
/* -------------------------------------------------------------------------- */

  Future fetchJsonList({
    required fetchUrl,
    required int pageSize,
    required int pageNum,
  }) async {
    try {
      http.Response myResponse = await client.get(
          Uri.parse(fetchUrl + '?pagesize=$pageSize&pagenum=$pageNum'),
          headers: {
            'authorization': basicAuth,
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not fetched  ==> $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by prop                             */
/* -------------------------------------------------------------------------- */

  // pass search String like &isAdmin=true in customSearch
  fetchJsonList_by_prop({
    required fetchUrl,
    required int pageSize,
    required int pageNum,
    required String customSearch,
  }) async {
    try {
      http.Response myResponse = await client.get(
          Uri.parse(
              fetchUrl + '?pagesize=$pageSize&pagenum=$pageNum' + customSearch),
          headers: {
            'authorization': basicAuth,
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }).timeout(
        const Duration(seconds: 35),
        //      onTimeout: () {

        //   // return http.Response('Error', 408);
        //   // throw TimeoutException('Timed out');
        // }
      );

      return json.decode(myResponse.body);
    } on TimeoutException catch (e) {
      print('this should not be reached if the exception is raised');
    } catch (e) {
      print('not fetched  ==> $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */

  fetchSingleJson_by_id(fetchUrl, modelObjArgId) async {
    try {
      http.Response myResponse = await client
          .get(Uri.parse(fetchUrl + modelObjArgId.toString() + "/"), headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not fetched  ==> $e');
    }
  }
}
