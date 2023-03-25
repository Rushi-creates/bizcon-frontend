import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
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
      child: Center(
        child: Column(
          children: [
            // SizedBox(height: 50),
            SizedBox(
              height: MyComponents.screenSize(context).height * 0.3,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('images/isAdmin.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
            SizedBox(
              width: MyComponents.screenSize(context).width * 0.9,
              child: Card(
                color: Colors.indigo[900],
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: myText(
                                widget.singleObj.recordDate.substring(0, 10),
                                fontSize: 12),
                          ),
                          myText(widget.singleObj.title,
                              fontSize: 24, isBold: true),
                          myText(widget.singleObj.description),
                          SizedBox(height: 40),
                          myText('Goals: ' + widget.singleObj.goals),
                          Divider(),
                          myText('Salary method: ' +
                              widget.singleObj.salary_method),
                          Divider(),
                          myText('Qualifications required: ' +
                              widget.singleObj.qualifications_req),
                          Divider(),
                          myText('Skills required: ' +
                              widget.singleObj.skills_req),
                          Divider(),
                          myText('Max users: ' +
                              widget.singleObj.max_users.toString()),
                          Divider(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                myText('Post by', isBold: true, fontSize: 15),
                                myText(widget.singleObj.owner_username),
                                // myText(widget.singleObj.owner_bio),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            PostMembers_cud_form_widget(
              singleObj: widget.singleObj,
              formKey: formKey1,
            ),
          ],
        ),
      ),
    );
  }

  myText(String text, {double fontSize = 14.0, bool isBold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.indigo,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            // fontWeight: FontWeight.w300,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  // appbar                                 */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
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
        "Join the Team", //give here appBar title
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
