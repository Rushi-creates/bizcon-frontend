import 'package:flutter/material.dart';
import 'PostMembers_cud_save_button.dart';
import 'PostMembers_cud_update_button.dart';

class PostMembers_cud_form_widget extends StatelessWidget {
  final singleObj;
  final formKey;

  const PostMembers_cud_form_widget({
    super.key,
    required this.singleObj,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return formWidget(context);
  }

/* -------------------------------------------------------------------------- */
/*                            //@ Form widget                                 */
/* -------------------------------------------------------------------------- */

  formWidget(context) {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                all_textFormFields(context),
                // singleObj == null
                //     ?
                PostMembers_cud_save_button(
                  formKey: formKey,
                  singleObj: singleObj,
                )
                // : PostMembers_cud_update_button(
                //     formKey: formKey,
                //     singleObj: singleObj,
                //   )
              ],
            ),
          ),
        ),
      ),
    );
  }

  all_textFormFields(context) {
    var dimVar = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [],
    );
  }
}
