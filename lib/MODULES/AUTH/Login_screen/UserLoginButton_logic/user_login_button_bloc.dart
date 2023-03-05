import 'package:bizcon1/Repo/User_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../service_layer_stub/Exceptions/Exceptions.dart';
import '../../../../service_layer_stub/models/User.dart';

part 'user_login_button_event.dart';
part 'user_login_button_state.dart';

class UserLoginButtonBloc
    extends Bloc<UserLoginButtonEvent, UserLoginButtonState> {
  //
  User_api_repo user_api_repo = User_api_repo();
  User_sp_repo user_sp_repo = User_sp_repo();

  //
  UserLoginButtonBloc() : super(UserLoginButtonInitial()) {
/* -------------------------------------------------------------------------- */
/*                               //@ Login User                               */
/* -------------------------------------------------------------------------- */

    on<UserLoginButton_Clicked_Event>((event, emit) async {
      emit(UserLoginLoadingState());

      try {
        print('started login');

        var response = await user_api_repo.create_loginUser(event.modelObj);

        if (response is UserAcc) {
          //# Set sp : store new User/Admin creds to SP
          await user_sp_repo.set_user(response);
          emit(UserLoginSuccessState());

          //# LOGIC : reponse is Stirng , means acc NOT added to DB (already exists)
        } else if (response is String) {
          emit(UserLoginFailure_accountDontExist_State(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(UserLogin_UnknownError_State(storeErr));
      }
    });
  }
}
