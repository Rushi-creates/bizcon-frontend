import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:bizcon1/Repo/User_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../service_layer_stub/models/User.dart';

part 'user_lod_event.dart';
part 'user_lod_state.dart';

class UserLodBloc extends Bloc<UserLodEvent, UserLodState> {
  //
  User_api_repo user_api_repo = User_api_repo();
  User_sp_repo user_sp_repo = User_sp_repo();
  Profile_sp_repo profile_sp_repo = Profile_sp_repo();

//
  UserLodBloc() : super(UserLodInitial()) {
/* -------------------------------------------------------------------------- */
/*                                 //! Logout                                 */
/* -------------------------------------------------------------------------- */

    on<UserLogoutButtonPressedEvent>((event, emit) async {
      emit(UserLogout_Loading_State());

      //# remove SP : after log out
      await profile_sp_repo.remove_profile();

      //#
      await user_sp_repo.remove_user().then((value) {
        emit(UserLogout_Success_State());
      }).catchError((e, s) {
        emit(UserLogout_Failure_State());
      });
    });

/* -------------------------------------------------------------------------- */
/*                          //! Logout for superAdmin                         */
/* -------------------------------------------------------------------------- */
    // on<Logout_forSuperAdmin_ButtonPressedEvent>((event, emit) async {
    //   emit(Logout_SuperAdmin_Loading_State());

    //   //# remove SP : remove superAdmin=true key , to log out SA
    //   await account_sp_repo.removeSuperAdmin().then((value) {
    //     emit(Logout_SuperAdmin_Success_State());
    //   }).catchError((e, st) {
    //     emit(Logout_SuperAdmin_Failure_State());
    //   });
    // });

/* -------------------------------------------------------------------------- */
/*                           //! Delete user Account                          */
/* -------------------------------------------------------------------------- */
    on<UserDeleteUserAccount_ButtonPressedEvent>((event, emit) async {
      emit(UserDeleteUserAccount_Loading_State());

      //# get SP :
      UserAcc user = User_sp_repo.get_user()!;
      int id = user.id!;

      //Todo: delete each user realated DB , using deleteByUid url path
      try {
        //# deleting acc from DB
        var response = await user_api_repo.deleteUser_account(id);
        print('response decoded from api===>$response');

        //# remove SP : when User/Admin deletes acc
        await profile_sp_repo.remove_profile();

        await user_sp_repo.remove_user().then((value) {
          emit(UserDeleteUserAccount_Success_State());
        }).catchError((e, s) {
          emit(UserDeleteUserAccount_Success_State());
        });

        //#error
      } catch (e) {
        emit(UserDeleteUserAccount_Failure_State());
      }
    });
  }
}
