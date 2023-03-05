import 'package:bizcon1/MODULES/SEARCH_SCREEN/__SearchProfile_fetch_stub__/SearchProfile_fetch_screen/SearchProfile_fetch_screen.dart';

import '../AllPosts_fetch_bloc.dart';
import 'AllPosts_fetch_fetchList/AllPosts_fetch_belowList_widget.dart';
import 'AllPosts_fetch_fetchList/AllPosts_fetch_fetchList_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPosts_Fetch_Screen extends StatefulWidget {
  const AllPosts_Fetch_Screen({Key? key}) : super(key: key);

  @override
  _AllPosts_Fetch_ScreenState createState() => _AllPosts_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _AllPosts_Fetch_ScreenState extends State<AllPosts_Fetch_Screen> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();

    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);

    //# to call first set of pages
    BlocProvider.of<AllPostsFetchBloc>(context)
        .add(AllPosts_Fetch_onInit_Event());
  }

  @override
  void dispose() {
    scrollController.dispose();
    print('scroll controller disposed');
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      Future.delayed(Duration(milliseconds: 100), () {
        BlocProvider.of<AllPostsFetchBloc>(context)
            .add(AllPosts_Fetch_onInit_Event());
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      // floatingActionButton: Positioned(
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     backgroundColor: Colors.purple,
      //     // tooltip: "Hint text on hover ",
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return SearchProfile_Fetch_Screen();
      //       }));
      //     },
      //   ),
      // ),
      // appBar: myHeader(),
      body: myBody(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! body structure                             */
/* -------------------------------------------------------------------------- */

  // myBody_STATES() {
  //   return BlocConsumer<JooCudBloc, JooCudState>(
  //     listener: (context, state) {
  //       if (state is Joo_create_Loaded_State ||
  //           state is Joo_update_Loaded_State ||
  //           state is Joo_Delete_Loaded_state) {
  //         onRefreshFunc();
  //       }
  //     },
  //     builder: (context, state) {
  //       return myBody();
  //     },
  //   );
  // }

  myBody() {
    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        onRefreshFunc();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          //! note : make sure to pass controller in this list
          controller: scrollController,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.topLeft,
                  child: headingText(),
                ), // fetch list

                SizedBox(height: 10),
                AllPosts_fetch_fetchList_widget(),

                // below fetch list
                AllPosts_fetch_belowList_widget(
                  scrollController: scrollController,
                  scrollListener: scrollListener,
                ),

                //
                SizedBox(height: 70),
              ]),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //# Scaffold widgets                             */
/* -------------------------------------------------------------------------- */

  headingText() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20, right: 20),
      child: Container(
        // color: Colors.amber,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  'Browser through ideas & join teams\n'
                  'which interests you',
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchProfile_Fetch_Screen();
                    }));
                    // Navigator.pushNamed(context, '/Home');
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  )),
            )
          ],
        ),
      ),
    );
  }
  // AppBar myHeader() {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     centerTitle: true,
  //     title: Text(
  //       'Home',
  //       style: TextStyle(color: Colors.black
  //           // fontWeight: FontWeight.bold
  //           // fontSize: 15,
  //           ),
  //     ),
  //     actions: [
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: IconButton(
  //             onPressed: () {
  //               Navigator.push(context, MaterialPageRoute(builder: (context) {
  //                 return SearchProfile_Fetch_Screen();
  //               }));
  //               // Navigator.pushNamed(context, '/Home');
  //             },
  //             icon: Icon(
  //               Icons.search,
  //               color: Colors.black,
  //             )),
  //       )
  //       //   // Padding(
  //       //   //   padding: const EdgeInsets.all(8.0),
  //       //   //   child: IconButton(
  //       //   //       onPressed: () {
  //       //   //         onRefreshFunc()
  //       //   //       },
  //       //   //       icon: Icon(
  //       //   //         Icons.refresh,
  //       //   //         color: Colors.black,
  //       //   //       )),
  //       //   // )
  //     ],
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<AllPostsFetchBloc>(context)
        .add(AllPosts_Fetch_onRefresh_Event());
    BlocProvider.of<AllPostsFetchBloc>(context)
        .add(AllPosts_Fetch_onInit_Event());
    scrollController.addListener(scrollListener);
  }
}
