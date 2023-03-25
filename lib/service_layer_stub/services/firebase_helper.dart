import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  FirebaseHelper._instance();
  static final FirebaseHelper firebaseHelper = FirebaseHelper._instance();

/* -------------------------------------------------------------------------- */
/*                                  //! Fetch                                 */
/* -------------------------------------------------------------------------- */

  Future<bool> fetch(pathArg, docId) async {
    // var store = api.add().then((value) {
    //   print(value);
    //   return value;
    // });

    // return store;

    // var store =

    try {
      bool storeState = false;

      await pathArg.doc(docId).get().then((value) {
        if (value.exists) {
          print('Doc fetched = ${value.data()}');
          storeState = true;
          // return true;
        } else {
          storeState = false;
        }
      });
      // print('out fo then statement');
      print('this is store state $storeState');
      return storeState;
    } catch (e) {
      print('Failed to fetch doc: $e');
      return false;
    }
  }

  fetchCollection(pathArg) async {
    try {
      var store = await pathArg.get();
      return store;
    } catch (e) {
      print('Failed to fetch doc: $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                                   //! CUD                                  */
/* -------------------------------------------------------------------------- */

  set(pathArg, docId, modelObjArg) {
    return pathArg
        .doc(docId)
        .set(modelObjArg.toMap()) //this toMap() func , if from model class
        .then((value) {
      print('User Added = $value');
    }).catchError((error) => print('Failed to Add user: $error'));
  }

  add(pathArg, modelObjArg) {
    return pathArg
        .add(modelObjArg.toMap()) //this toMap() func , if from model class
        .then((value) => print('User Added = $value'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  // add(pathArg, modelObjArg) {
  //   try {
  //     var result = pathArg.add(modelObjArg.toMap()).timeout(
  //           const Duration(seconds: 35),
  //         );

  //     return result;
  //   } catch (e) {
  //     print('not added to api =>  $e');
  //   }
  // }

  update(pathArg, docId, modelObjArg) {
    return pathArg
        .doc(docId)
        .update(modelObjArg.toMap()) //this toMap() func , if from model class
        .then((value) => print("User Updated = $value"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  delete(pathArg, docId) {
    return pathArg
        .doc(docId)
        .delete()
        .then((value) => print('User Deleted = $value'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }
}
