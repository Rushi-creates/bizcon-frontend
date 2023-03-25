import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Repo/Chats_repo.dart';
import '../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'Chats_cud_event.dart';
part 'Chats_cud_state.dart';

class ChatsCudBloc extends Bloc<ChatsCudEvent, ChatsCudState> {
  ChatsCudBloc() : super(ChatsCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */

    Chats_api_repo chats_api_repo = Chats_api_repo();

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<Chats_create_onButtonPressed_Event>((event, emit) async {
      emit(Chats_create_Loading_State());

      try {
        //# from api repo
        var response = await chats_api_repo.sendMessage(
            event.collectionName, event.modelObjToAdd);

        emit(Chats_create_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Chats_create_Error_State(storeErr));
      }
    });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ update                                 */
// /* -------------------------------------------------------------------------- */
//     on<Chats_Update_onButtonPressed_Event>((event, emit) async {
//       emit(Chats_update_Loading_State());

//       try {
//         //# from api repo
//         var response =
//             await Chats_api_repo.update(event.modelObjToAdd, event.modelObj_id);

//         //# from GS repo (NOTE:  if using GS, dont store response in var)
//         // await hoo_update_Gs_repo.update_hoo(
//         //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

//         emit(Chats_update_Loaded_State());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(Chats_update_Error_State(storeErr));
//       }
//     });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ delete                                 */
// /* -------------------------------------------------------------------------- */
//     on<Chats_Delete_onButtonPressed_Event>((event, emit) async {
//       emit(Chats_Delete_Loading_state());

//       try {
//         //# from api repo
//         //! note : api returns string response to delete
//         // dont use this stringResponse for logic, just use this to print
//         var StringReponse = await Chats_api_repo.delete(event.modelObj_id);

//         //# from Gs repo (NOTE:  if using GS, dont store response in var)
//         // await poo_delete_api_repo.delete_poo(event.modelObj_id);

//         emit(Chats_Delete_Loaded_state());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(Chats_Delete_Error_State(storeErr));
//       }
//     });
  }
}
