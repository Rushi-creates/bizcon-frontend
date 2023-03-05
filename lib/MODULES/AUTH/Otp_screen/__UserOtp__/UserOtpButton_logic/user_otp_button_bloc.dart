import 'package:bizcon1/Repo/User_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'user_otp_button_event.dart';
part 'user_otp_button_state.dart';

class UserOtpButtonBloc extends Bloc<UserOtpButtonEvent, UserOtpButtonState> {
  //

  User_api_repo user_api_repo = User_api_repo();

  //
  UserOtpButtonBloc() : super(UserOtpButtonInitial()) {
    on<UserOtpButtonClicked_Event>((event, emit) async {
      print('otpbutton presed');
      emit(UserOtp_LoadingState());

      try {
        var response =
            await user_api_repo.create_verifyUserEmail_SendOtp(event.modelObj);

        // response here has account already exists
        if (response is String) {
          emit(UserOtp_accountAlreadyExists_State(response));

          //response here has otp
        } else if (response is int) {
          emit(UserOtp_SuccessState(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(UserOtp_UnknownError_State(storeErr));
      }
    });
  }
}
