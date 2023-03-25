import 'package:bizcon1/Repo/PostMembers_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../service_layer_stub/Exceptions/Exceptions.dart';
import '../../../service_layer_stub/models/PostMembers.dart';

part 'PostMembers_cud_event.dart';
part 'PostMembers_cud_state.dart';

class PostMembersCudBloc
    extends Bloc<PostMembersCudEvent, PostMembersCudState> {
  PostMembersCudBloc() : super(PostMembersCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */

    PostMembers_api_repo postMembers_api_repo = PostMembers_api_repo();

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<PostMembers_create_onButtonPressed_Event>((event, emit) async {
      emit(PostMembers_create_Loading_State());

      try {
        //# from api repo
        var response = await postMembers_api_repo.create(event.modelObjToAdd);
        print(response);

        if (response is Map) {
          // PostMembers.fromMap(response);
          emit(PostMembers_create_Loaded_State());
        } else {
          if (response == true) {
            emit(PostMembers_create_AlreadyExisiting_Loaded_State());
          } else if (response == false) {
            emit(PostMembers_create_AlreadyWaiting_Loaded_State());
          }
        }

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(PostMembers_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
    on<PostMembers_Update_onButtonPressed_Event>((event, emit) async {
      emit(PostMembers_update_Loading_State());

      try {
        //# from api repo
        var response = await postMembers_api_repo.update(
            event.modelObjToAdd, event.modelObj_id);

        //# from GS repo (NOTE:  if using GS, dont store response in var)
        // await hoo_update_Gs_repo.update_hoo(
        //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

        emit(PostMembers_update_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(PostMembers_update_Error_State(storeErr));
      }
    });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ delete                                 */
// /* -------------------------------------------------------------------------- */
    on<PostMembers_Delete_onButtonPressed_Event>((event, emit) async {
      emit(PostMembers_Delete_Loading_state());

      try {
        //# from api repo
        //! note : api returns string response to delete
        // dont use this stringResponse for logic, just use this to print
        var StringReponse =
            await postMembers_api_repo.delete(event.modelObj_id);

        //# from Gs repo (NOTE:  if using GS, dont store response in var)
        // await poo_delete_api_repo.delete_poo(event.modelObj_id);

        emit(PostMembers_Delete_Loaded_state());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(PostMembers_Delete_Error_State(storeErr));
      }
    });
  }
}
