import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../service_layer_stub/models/Post.dart';
import '../../../../service_layer_stub/models/PostMembers.dart';
import '../../../COMMON/myComponents.dart';
import '../../../HOME/PostMembers_cud_logic/PostMembers_cud_bloc.dart';
import '../WaitingPostMembers_fetch_logic/WaitingPostMembers_fetch_bloc.dart';

part 'WaitingPostMembers_fetch_listTile_widget.dart';
part 'WaitingPostMembers_fetch_fetchList_widget.dart';
part 'WaitingPostMembers_fetch_belowList_widget.dart';

class WaitingPostMembers_Fetch_Screen extends StatefulWidget {
  final post_fk;
  const WaitingPostMembers_Fetch_Screen({required this.post_fk});

  @override
  _WaitingPostMembers_Fetch_ScreenState createState() =>
      _WaitingPostMembers_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _WaitingPostMembers_Fetch_ScreenState
    extends State<WaitingPostMembers_Fetch_Screen> {
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
    BlocProvider.of<WaitingPostMembersFetchBloc>(context)
        .add(WaitingPostMembers_Fetch_onInit_Event(widget.post_fk));
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
        BlocProvider.of<WaitingPostMembersFetchBloc>(context)
            .add(WaitingPostMembers_Fetch_onInit_Event(widget.post_fk));
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
          BlocProvider.of<WaitingPostMembersFetchBloc>(context)
              .add(WaitingPostMembers_Fetch_onRefresh_Event());
          Navigator.pop(context);
          return await true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          // resizeToAvoidBottomInset: false,
          appBar: myHeader(),
          // body: myBody_STATES(),
          body: updateButton_STATES(),
        ));
  }

  updateButton_STATES() {
    return BlocConsumer<PostMembersCudBloc, PostMembersCudState>(
      listener: (context, state) {
        if (state is PostMembers_update_Loaded_State) {
          onRefreshFunc();
          MyComponents.successSnackBar(context, 'Action completed');
        } else if (state is PostMembers_update_Error_State) {
          MyComponents.errorSnackBar(context, 'Some Error');
        }
      },
      builder: (context, state) {
        if (state is PostMembers_update_Loading_State) {
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
              WaitingPostMembers_fetch_fetchList_widget(),

              // below fetch list
              WaitingPostMembers_fetch_belowList_widget(
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
            BlocProvider.of<WaitingPostMembersFetchBloc>(context)
                .add(WaitingPostMembers_Fetch_onRefresh_Event());
            Navigator.pop(context);
          }),
      title: Text(
        'Waiting members',
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
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: () {
      //         onRefreshFunc()
      //       },
      //       icon: Icon(
      //         Icons.refresh,
      //         color: Colors.black,
      //       )),
      // )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<WaitingPostMembersFetchBloc>(context)
        .add(WaitingPostMembers_Fetch_onRefresh_Event());
    BlocProvider.of<WaitingPostMembersFetchBloc>(context)
        .add(WaitingPostMembers_Fetch_onInit_Event(widget.post_fk));
    scrollController.addListener(scrollListener);
  }
}
