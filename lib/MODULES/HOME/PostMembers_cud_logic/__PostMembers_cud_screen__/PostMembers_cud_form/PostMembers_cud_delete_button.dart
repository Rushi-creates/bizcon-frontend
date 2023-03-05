import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../COMMON/myComponents.dart';
import '../../PostMembers_cud_bloc.dart';

class PostMembers_cud_delete_button extends StatelessWidget {
  final singleObj;
  //

  const PostMembers_cud_delete_button({
    super.key,
    required this.singleObj,
    //
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: deleteButton_STATES(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  deleteButton_STATES() {
    return BlocConsumer<PostMembersCudBloc, PostMembersCudState>(
      listener: (context, state) {
        if (state is PostMembers_Delete_Loaded_state) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
        } else if (state is PostMembers_Delete_Error_State) {
          MyComponents.errorSnackBar(
            context,
            "Some error!, couldn't complete action \n Error: ${state.error}",
          );
        }
      },
      builder: (context, state) {
        //default state
        if (state is PostMembersCudInitial) {
          return deleteButton_Ui(context);
        } else if (state is PostMembers_Delete_Loading_state) {
          return MyComponents.buildLoading();
        } else if (state is PostMembers_Delete_Error_State) {
          return deleteButton_Ui(context);
        }

        //! extra states
        else if (state is PostMembers_create_Loading_State ||
            state is PostMembers_update_Loading_State) {
          return Text('Please wait..');
        }

        // if any other state (which is not mentioned)
        return deleteButton_Ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */

  deleteButton_Ui(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
      child: TextButton(
        child: Row(
          children: [
            Text(
              "DELETE",
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 12,
              ),
            ),
            Icon(
              Icons.delete,
              color: Colors.red[300],
            )
          ],
        ),
        onPressed: () => deleteButton_FUNC(context),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  deleteButton_FUNC(context) {
    //# Delete bloc, ( pass widget.single.id as ID )
    BlocProvider.of<PostMembersCudBloc>(context)
        .add(PostMembers_Delete_onButtonPressed_Event(singleObj!.id));
  }
}
