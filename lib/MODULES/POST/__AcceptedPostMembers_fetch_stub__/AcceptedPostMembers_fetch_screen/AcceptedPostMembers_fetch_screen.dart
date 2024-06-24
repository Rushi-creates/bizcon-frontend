import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/myComponents.dart';
import '../../../HOME/PostMembers_cud_logic/PostMembers_cud_bloc.dart';
import '../AcceptedPostMembers_fetch_logic/AcceptedPostMembers_fetch_bloc.dart';

part 'AcceptedPostMembers_fetch_listTile_widget.dart';
part 'AcceptedPostMembers_fetch_fetchList_widget.dart';
part 'AcceptedPostMembers_fetch_belowList_widget.dart';

class AcceptedPostMembers_Fetch_Screen extends StatefulWidget {
  final post_fk;
  final fromProfile;
  const AcceptedPostMembers_Fetch_Screen(
      {required this.post_fk, required this.fromProfile});

  @override
  _AcceptedPostMembers_Fetch_ScreenState createState() =>
      _AcceptedPostMembers_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _AcceptedPostMembers_Fetch_ScreenState
    extends State<AcceptedPostMembers_Fetch_Screen> {
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
    BlocProvider.of<AcceptedPostMembersFetchBloc>(context)
        .add(AcceptedPostMembers_Fetch_onInit_Event(widget.post_fk));
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
        BlocProvider.of<AcceptedPostMembersFetchBloc>(context)
            .add(AcceptedPostMembers_Fetch_onInit_Event(widget.post_fk));
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
        BlocProvider.of<AcceptedPostMembersFetchBloc>(context)
            .add(AcceptedPostMembers_Fetch_onRefresh_Event());
        Navigator.pop(context);
        return await true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        // body: myBody_STATES(),
        body: deleteButton_STATES(),
      ),
    );
  }

  deleteButton_STATES() {
    return BlocConsumer<PostMembersCudBloc, PostMembersCudState>(
      listener: (context, state) {
        if (state is PostMembers_Delete_Loaded_state) {
          onRefreshFunc();
          MyComponents.successSnackBar(context, 'Action completed');
        } else if (state is PostMembers_Delete_Error_State) {
          MyComponents.errorSnackBar(context, 'Some Error');
        }
      },
      builder: (context, state) {
        if (state is PostMembers_Delete_Loading_state) {
          return MyComponents.buildLoading();
        }

        // if any other state (which is not mentioned)
        return myBody();
      },
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
      child: SingleChildScrollView(
        //! note : make sure to pass controller in this list
        controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // fetch list
              AcceptedPostMembers_fetch_fetchList_widget(
                fromProfile: widget.fromProfile,
              ),

              // below fetch list
              AcceptedPostMembers_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener,
                post_fk: widget.post_fk,
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
            BlocProvider.of<AcceptedPostMembersFetchBloc>(context)
                .add(AcceptedPostMembers_Fetch_onRefresh_Event());
            Navigator.pop(context);
          }),
      title: Text(
        'Idea Members',
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
    BlocProvider.of<AcceptedPostMembersFetchBloc>(context)
        .add(AcceptedPostMembers_Fetch_onRefresh_Event());
    BlocProvider.of<AcceptedPostMembersFetchBloc>(context)
        .add(AcceptedPostMembers_Fetch_onInit_Event(widget.post_fk));
    scrollController.addListener(scrollListener);
  }
}
