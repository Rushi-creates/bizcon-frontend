import 'package:bizcon1/Repo/Post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'Post_cud_event.dart';
part 'Post_cud_state.dart';

class PostCudBloc extends Bloc<PostCudEvent, PostCudState> {
  PostCudBloc() : super(PostCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */
    Post_api_repo post_api_repo = Post_api_repo();

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<Post_create_onButtonPressed_Event>((event, emit) async {
      emit(Post_create_Loading_State());

      try {
        //# from api repo
        var response = await post_api_repo.add_post(event.modelObjToAdd);
        print('from post cud = > ${response}');

        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        emit(Post_create_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Post_create_Error_State(storeErr));
      }
    });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ update                                 */
// /* -------------------------------------------------------------------------- */
//     on<Post_Update_onButtonPressed_Event>((event, emit) async {
//       emit(Post_update_Loading_State());

//       try {
//         //# from api repo
//         var response =
//             await Post_api_repo.update(event.modelObjToAdd, event.modelObj_id);

//         //# from GS repo (NOTE:  if using GS, dont store response in var)
//         // await hoo_update_Gs_repo.update_hoo(
//         //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

//         emit(Post_update_Loaded_State());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(Post_update_Error_State(storeErr));
//       }
//     });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ delete                                 */
// /* -------------------------------------------------------------------------- */
//     on<Post_Delete_onButtonPressed_Event>((event, emit) async {
//       emit(Post_Delete_Loading_state());

//       try {
//         //# from api repo
//         //! note : api returns string response to delete
//         // dont use this stringResponse for logic, just use this to print
//         var StringReponse = await Post_api_repo.delete(event.modelObj_id);

//         //# from Gs repo (NOTE:  if using GS, dont store response in var)
//         // await poo_delete_api_repo.delete_poo(event.modelObj_id);

//         emit(Post_Delete_Loaded_state());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
    //   emit(Post_Delete_Error_State(storeErr));
    // }
    // });
  }
}
