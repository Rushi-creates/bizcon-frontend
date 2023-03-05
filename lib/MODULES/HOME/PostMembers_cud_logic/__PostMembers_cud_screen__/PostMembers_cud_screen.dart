import 'package:flutter/material.dart';

import 'PostMembers_cud_form/PostMembers_cud_delete_button.dart';
import 'PostMembers_cud_form/PostMembers_cud_form_widget.dart';

/* -------------------------------------------------------------------------- */
/*                               //@ Stateful                                 */
/* -------------------------------------------------------------------------- */

class PostMembers_cud_screen extends StatefulWidget {
  final singleObj;

  PostMembers_cud_screen({this.singleObj});
  PostMembers_cud_screen.named(this.singleObj);

  @override
  _PostMembers_cud_screenState createState() => _PostMembers_cud_screenState();
}

/* -------------------------------------------------------------------------- */
/*                               //@ State class                              */
/* -------------------------------------------------------------------------- */

class _PostMembers_cud_screenState extends State<PostMembers_cud_screen> {
  //* Declaration
  final formKey1 = GlobalKey<FormState>();

/* -------------------------------------------------------------------------- */
/*                             //@ Controllers                                */
/* -------------------------------------------------------------------------- */

  // create controllers here

/* -------------------------------------------------------------------------- */
/*                           //! Life cycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    if (widget.singleObj == null) {
      //pass all the controllers here

    } else {
      // assign controller to model props
      // desController.text = widget.singleObj!.propName;
      // /(make sure model propName is proper)

    }
  }

/* -------------------------------------------------------------------------- */
/*                            //!  Build                                      */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: myBody());
  }

/* -------------------------------------------------------------------------- */
/*                              //@ Widgets here                              */
/* -------------------------------------------------------------------------- */

  myBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          PostMembers_cud_form_widget(
            singleObj: widget.singleObj,
            formKey: formKey1,
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  // appbar                                 */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        // widget.singleObj != null ? "Update" :
        "Create", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        //! Delete button
        // widget.singleObj != null
        //     ? PostMembers_cud_delete_button(
        //         singleObj: widget.singleObj,
        //         //
        //       )
        //     : Text('')
      ],
    );
  }
}
