import 'package:flutter/material.dart';

class MyComponents {
  static errorSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(text),
      ),
    );
  }

  static Size screenSize(context) {
    Size size = MediaQuery.of(context).size;
    return size;
  }

  static successSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(text),
      ),
    );
  }

  static showFetchListEmptyMsg() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'No Data',
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 196, 196, 196),
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  static nothingMoreToLoad() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Nothing more to load',
        style:
            TextStyle(color: Color.fromARGB(255, 207, 207, 207), fontSize: 10),
      ),
    );
  }

  static emptyText() {
    return Text('');
  }

  static buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                   // old                                   */
/* -------------------------------------------------------------------------- */
  static buildTextField(controllerArg, String labelTextArg,
      {bool isKbNumber = false}) {
    // var dimVar = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          //******First text Field from here *****
          SizedBox(
            child: TextFormField(
              controller: controllerArg,
              keyboardType:
                  isKbNumber ? TextInputType.number : TextInputType.multiline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field required'; //if empty give error msg here
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelTextArg, //hint text here
              ),
            ),
          ),
          SizedBox(
            height: 20,
            //height : dimVar.height*0.04
          ),
        ],
      ),
    );
  }

  static createTableRow(col1DataArg, col2DataArg) {
    //! note this should be inside a table widget
    return TableRow(
        // decoration: BoxDecoration(color: Colors.blue),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              col1DataArg,
              textAlign: TextAlign.left,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              col2DataArg,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ]);
  }

  static createTableRowBlackText(col1DataArg, col2DataArg) {
    //! note this should be inside a table widget
    return TableRow(
        // decoration: BoxDecoration(color: Colors.blue),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              col1DataArg,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              col2DataArg,
              textAlign: TextAlign.center,
            ),
          ),
        ]);
  }
}
