import 'package:bizcon1/MODULES/POST/PostCard_forProfile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/myComponents.dart';
import '../MyPosts_fetch_logic/MyPosts_fetch_bloc.dart';

// part 'MyPosts_fetch_listTile_widget.dart';
part 'MyPosts_fetch_fetchList_widget.dart';
part 'MyPosts_fetch_belowList_widget.dart';

class MyPosts_Fetch_Screen extends StatefulWidget {
  const MyPosts_Fetch_Screen({Key? key}) : super(key: key);

  @override
  _MyPosts_Fetch_ScreenState createState() => _MyPosts_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _MyPosts_Fetch_ScreenState extends State<MyPosts_Fetch_Screen> {
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
    BlocProvider.of<MyPostsFetchBloc>(context)
        .add(MyPosts_Fetch_onInit_Event());
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
        BlocProvider.of<MyPostsFetchBloc>(context)
            .add(MyPosts_Fetch_onInit_Event());
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return myBody();
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
        scrollDirection: Axis.horizontal,
        //! note : make sure to pass controller in this list
        controller: scrollController,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              // fetch list
              MyPosts_fetch_fetchList_widget(),

              // below fetch list
              MyPosts_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener,
              ),

              //
            ]),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //# Scaffold widgets                             */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<MyPostsFetchBloc>(context)
        .add(MyPosts_Fetch_onRefresh_Event());
    BlocProvider.of<MyPostsFetchBloc>(context)
        .add(MyPosts_Fetch_onInit_Event());
    scrollController.addListener(scrollListener);
  }
}
