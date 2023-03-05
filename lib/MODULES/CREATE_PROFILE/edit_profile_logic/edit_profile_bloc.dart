import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../service_layer_stub/Exceptions/Exceptions.dart';
import '../../../service_layer_stub/models/Profile.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  //
  Profile_api_repo profile_api_repo = Profile_api_repo();
  Profile_sp_repo profile_sp_repo = Profile_sp_repo();

  //
  EditProfileBloc() : super(EditProfileInitial()) {
    //! add profile to fs
    on<EditProfile_ButtonPressed_Event>((event, emit) async {
      emit(EditProfile_loading_State());

      try {
        //# from api repo
        Profile response = event.isProfileUpdateEvent
            ? await profile_api_repo.update_profile(
                event.modelObjToAdd, event.modelObjToAdd.p_uid)
            : await profile_api_repo.add_profile(event.modelObjToAdd);

        //@ store profile in sp
        await profile_sp_repo.set_profile(response);

        emit(EditProfile_success_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(EditProfile_error_State(storeErr));
      }
    });
  }
}
