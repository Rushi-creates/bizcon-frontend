import 'package:bizcon1/Repo/User_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'user_reg_button_event.dart';
part 'user_reg_button_state.dart';

class UserRegButtonBloc extends Bloc<UserRegButtonEvent, UserRegButtonState> {
  //

  User_api_repo user_api_repo = User_api_repo();
  User_sp_repo user_sp_repo = User_sp_repo();

  //
  UserRegButtonBloc() : super(UserRegButtonInitial()) {
    on<UserRegButtonClicked_Event>((event, emit) async {
      emit(UserRegisterLoadingState());

      if (event.otpFromTextField == event.otpFromPreviousPage) {
        try {
          var response =
              await user_api_repo.create_UserRegister(event.modelObjToAdd);

          //storing this response in SP
          await user_sp_repo.set_user(response);
          emit(UserRegisterSuccessState());

          //# error
        } catch (e) {
          var storeErr = CustomExceptions.checkExcp(e.runtimeType);
          emit(UserRegister_UnknownError_State(storeErr));
        }
      } else {
        emit(OtpDidntMatched_State());
      }
    });
  }
}
