// class FirebaseHelper {
//   FirebaseHelper._instance();
//   static final FirebaseHelper firebaseHelper = FirebaseHelper._instance();

//   Future<void> set(pathArg, modelObjArg) {
//     return pathArg
//         .set(modelObjArg.toMap()) //this toMap() func , if from model class
//         .then((value) => print('User Added'))
//         .catchError((error) => print('Failed to Add user: $error'));
//   }

//   Future<void> add(pathArg, modelObjArg) {
//     return pathArg
//         .add(modelObjArg.toMap()) //this toMap() func , if from model class
//         .then((value) => print('User Added'))
//         .catchError((error) => print('Failed to Add user: $error'));
//   }

//   Future<void> update(pathArg, modelObjArg) {
//     return pathArg
//         .update(modelObjArg.toMap()) //this toMap() func , if from model class
//         .then((value) => print("User Updated"))
//         .catchError((error) => print("Failed to update user: $error"));
//   }

//   Future<void> delete(pathArg) {
//     return pathArg
//         .delete()
//         .then((value) => print('User Deleted'))
//         .catchError((error) => print('Failed to Delete user: $error'));
//   }
// }
