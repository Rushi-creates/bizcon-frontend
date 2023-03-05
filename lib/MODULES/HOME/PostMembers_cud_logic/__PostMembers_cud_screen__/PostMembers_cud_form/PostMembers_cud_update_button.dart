import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Repo/Profile_repo.dart';
import '../../../../../service_layer_stub/models/PostMembers.dart';
import '../../../../COMMON/myComponents.dart';
import '../../PostMembers_cud_bloc.dart';

class PostMembers_cud_update_button extends StatelessWidget {
  final singleObj;
  // final formKey;

  const PostMembers_cud_update_button({
    super.key,
    // required this.formKey,
    required this.singleObj,
  });

  @override
  Widget build(BuildContext context) {
    return updateButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  updateButton_STATES() {
    return BlocConsumer<PostMembersCudBloc, PostMembersCudState>(
      listener: (context, state) {
        if (state is PostMembers_update_Loaded_State) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        //default state
        if (state is PostMembersCudInitial) {
          return update_Button_ui(context);
        } else if (state is PostMembers_update_Loading_State) {
          return customLoading();
        } else if (state is PostMembers_update_Error_State) {
          return errorWidget(context, state);
        }

        //! extra states
        else if (state is PostMembers_create_Loading_State ||
            state is PostMembers_Delete_Loading_state) {
          return Text('Please wait .....');
        }

        // if any other state (which is not mentioned)
        return update_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */
  update_Button_ui(context) {
    return TextButton(
      child: Text(
        "Update",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
      onPressed: () async => update_FUNC(context),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

  customLoading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          MyComponents.buildLoading(),
          Text('Please wait ...'),
        ],
      ),
    );
  }

  errorWidget(context, state) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error : ${state.error}'),
          update_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  update_FUNC(context) {
    // if (formKey.currentState!.validate()) {
    // create diff obj to update ( with id )or else , to much error

    PostMembers postMembers = PostMembers(
        post_fk: singleObj.id!,
        member_fk: Profile_sp_repo.get_profile()!.p_uid,
        isAccepted: true,
        joinedTime: DateTime.now().toString());

    BlocProvider.of<PostMembersCudBloc>(context).add(
        PostMembers_Update_onButtonPressed_Event(postMembers, postMembers.id));
  }
  // }
}
