import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/myComponents.dart';
import '../AppliedToJoinPosts_fetch_logic/AppliedToJoinPosts_fetch_bloc.dart';

part 'AppliedToJoinPosts_fetch_listTile_widget.dart';
part 'AppliedToJoinPosts_fetch_fetchList_widget.dart';
part 'AppliedToJoinPosts_fetch_belowList_widget.dart';

class AppliedToJoinPosts_Fetch_Screen extends StatefulWidget {
  final member_fk;
  const AppliedToJoinPosts_Fetch_Screen({required this.member_fk});

  @override
  _AppliedToJoinPosts_Fetch_ScreenState createState() =>
      _AppliedToJoinPosts_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _AppliedToJoinPosts_Fetch_ScreenState
    extends State<AppliedToJoinPosts_Fetch_Screen> {
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
    BlocProvider.of<AppliedToJoinPostsFetchBloc>(context)
        .add(AppliedToJoinPosts_Fetch_onInit_Event(widget.member_fk));
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
        BlocProvider.of<AppliedToJoinPostsFetchBloc>(context)
            .add(AppliedToJoinPosts_Fetch_onInit_Event(widget.member_fk));
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          BlocProvider.of<AppliedToJoinPostsFetchBloc>(context)
              .add(AppliedToJoinPosts_Fetch_onRefresh_Event());
          Navigator.pop(context);
          return await true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          // resizeToAvoidBottomInset: false,
          appBar: myHeader(),
          // body: myBody_STATES(),
          body: myBody(),
        ));
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
      child: SingleChildScrollView(
        //! note : make sure to pass controller in this list
        controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // fetch list
              AppliedToJoinPosts_fetch_fetchList_widget(),

              // below fetch list
              AppliedToJoinPosts_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener,
                member_fk: widget.member_fk,
              ),

              //
            ]),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //# Scaffold widgets                             */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            BlocProvider.of<AppliedToJoinPostsFetchBloc>(context)
                .add(AppliedToJoinPosts_Fetch_onRefresh_Event());
            Navigator.pop(context);
          }),
      title: Text(
        'Applied to Join',
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: IconButton(
      //         onPressed: () {
      //           // Navigator.pushNamed(context, '/Home');
      //         },
      //         icon: Icon(
      //           Icons.settings,
      //           color: Colors.black,
      //         )),
      //   )
      //   // Padding(
      //   //   padding: const EdgeInsets.all(8.0),
      //   //   child: IconButton(
      //   //       onPressed: () {
      //   //         onRefreshFunc()
      //   //       },
      //   //       icon: Icon(
      //   //         Icons.refresh,
      //   //         color: Colors.black,
      //   //       )),
      //   // )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<AppliedToJoinPostsFetchBloc>(context)
        .add(AppliedToJoinPosts_Fetch_onRefresh_Event());
    BlocProvider.of<AppliedToJoinPostsFetchBloc>(context)
        .add(AppliedToJoinPosts_Fetch_onInit_Event(widget.member_fk));
    scrollController.addListener(scrollListener);
  }
}