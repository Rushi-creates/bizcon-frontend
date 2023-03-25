import 'dart:convert';

/* -------------------------------------------------------------------------- */
/*                   //! Basic authentication credentials :                   */
/* -------------------------------------------------------------------------- */
String basicAuth_username = 'rushi.creates';
String basicAuth_password = 'bizcon@123***';
String basicAuth = 'Basic ' +
    base64Encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

class ApiLinks {
/* -------------------------------------------------------------------------- */
/*                                 //! Domain                                 */
/* -------------------------------------------------------------------------- */
  static const String domainUrl = 'https://bizcon-production.up.railway.app/';
  // 'https://bizon-pythonanywhere-1-production.up.railway.app/';

/* -------------------------------------------------------------------------- */
/*                                //! Endpoints                               */
/* -------------------------------------------------------------------------- */

//@ notify next 5th queueuser by email (for his turn)
  static String notifyQu_byEmail = domainUrl + 'notifyUpcomingUserByEmail/';

//@ Super admin
  static String checkSuperAdmin = domainUrl + 'sa/checkSuperAdmin/';

//@ UserAcc
  static const String userAcc_getAll = domainUrl + 'userAcc/';
  static const String userAcc_register = domainUrl + 'userAcc/register/';
  static const String userAcc_resetAccount =
      domainUrl + 'userAcc/resetAccount/';
  static const String userAcc_delete = domainUrl + 'userAcc/delete/';

  static const String userAcc_login = domainUrl + 'userAcc/login_userAcc/';
  static const String userAcc_forgotPass =
      domainUrl + 'userAcc/forgotPasword_userAcc/';
  static const String userAcc_verify_userEmail_beforeRegister =
      domainUrl + 'userAcc/verify_userEmail_beforeRegister/';

//@ Profile

  static const String profile_getAll = domainUrl + 'profile/';
  static const String profile_add = domainUrl + 'profile/add/';
  static const String profile_update = domainUrl + 'profile/update/';
  static const String profile_delete = domainUrl + 'profile/delete/';

  static const String profile_isExists = domainUrl + 'profile/doesExists/';

  //@ Post

  static const String post_getAll = domainUrl + 'post/';
  static const String post_add = domainUrl + 'post/add/';
  static const String post_update = domainUrl + 'post/update/';
  static const String post_delete = domainUrl + 'post/delete/';

  //@ PostMembers

  static const String postMembers_getAll = domainUrl + 'postMembers/';
  static const String postMembers_add = domainUrl + 'postMembers/add/';
  static const String postMembers_update = domainUrl + 'postMembers/update/';
  static const String postMembers_delete = domainUrl + 'postMembers/delete/';
}
