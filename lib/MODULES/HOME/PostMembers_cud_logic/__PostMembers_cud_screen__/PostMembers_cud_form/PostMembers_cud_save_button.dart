import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Repo/Profile_repo.dart';
import '../../../../../service_layer_stub/models/PostMembers.dart';
import '../../../../COMMON/myComponents.dart';
import '../../PostMembers_cud_bloc.dart';

class PostMembers_cud_save_button extends StatelessWidget {
  final singleObj;
  final formKey;

  const PostMembers_cud_save_button({
    super.key,
    required this.formKey,
    required this.singleObj,
  });

  @override
  Widget build(BuildContext context) {
    return saveButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  saveButton_STATES() {
    return BlocConsumer<PostMembersCudBloc, PostMembersCudState>(
      listener: (context, state) {
        if (state is PostMembers_create_Loaded_State) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
        } else if (state is PostMembers_create_AlreadyExisiting_Loaded_State) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.blue[700],
              content: Text('You are already a team member'),
            ),
          );

          Navigator.pop(context);
        } else if (state is PostMembers_create_AlreadyWaiting_Loaded_State) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.blue[700],
              content: Text(
                  'You have already applied to be a member, please wait until you are accepted'),
            ),
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        //default state
        if (state is PostMembersCudInitial) {
          return joinTeamButton(context);
        } else if (state is PostMembers_create_Loading_State) {
          return customLoading();
        } else if (state is PostMembers_create_Error_State) {
          return errorWidget(context, state);
        }

        //! extra states
        else if (state is PostMembers_update_Loading_State ||
            state is PostMembers_Delete_Loading_state) {
          return Text('Please wait .....');
        }

        // if any other state (which is not mentioned)
        return joinTeamButton(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  // joinTeamButton(context) {
  //   return TextButton(
  //     child: Text(
  //       "Save",
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
  //     onPressed: () async => save_FUNC(context),
  //   );
  // }

  joinTeamButton(context) {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            gradient: LinearGradient(colors: [
              // Color.fromARGB(255, 45, 0, 53),
              // Color.fromARGB(255, 102, 0, 161),
              Color.fromARGB(255, 74, 0, 158),
              Color.fromARGB(255, 16, 0, 87),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: TextButton(
          onPressed: () async => save_FUNC(context),
          style: TextButton.styleFrom(
            // backgroundColor: Color.fromARGB(255, 233, 101, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          ),
          child: Text(
            'Join Team',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
          joinTeamButton(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  save_FUNC(context) {
    if (formKey.currentState!.validate()) {
      // make model obj here to add
      PostMembers postMembers = PostMembers(
          post_fk: singleObj.id!,
          member_fk: Profile_sp_repo.get_profile()!.p_uid,
          isAccepted: false,
          joinedTime: DateTime.now().toString());

      //
      BlocProvider.of<PostMembersCudBloc>(context)
          .add(PostMembers_create_onButtonPressed_Event(postMembers));
    }
  }
}
