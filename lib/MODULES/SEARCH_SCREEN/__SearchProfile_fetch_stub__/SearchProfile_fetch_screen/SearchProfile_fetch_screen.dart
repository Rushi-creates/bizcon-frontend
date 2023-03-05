import 'package:bizcon1/MODULES/SEARCH_SCREEN/__SearchProfile_fetch_stub__/SearchProfile_fetch_screen/Profile_SearchBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/myComponents.dart';
import '../SearchProfile_fetch_logic/SearchProfile_fetch_bloc.dart';

part 'SearchProfile_fetch_listTile_widget.dart';
part 'SearchProfile_fetch_fetchList_widget.dart';
part 'SearchProfile_fetch_belowList_widget.dart';

class SearchProfile_Fetch_Screen extends StatefulWidget {
  const SearchProfile_Fetch_Screen({Key? key}) : super(key: key);

  @override
  _SearchProfile_Fetch_ScreenState createState() =>
      _SearchProfile_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _SearchProfile_Fetch_ScreenState
    extends State<SearchProfile_Fetch_Screen> {
  final ScrollController scrollController = ScrollController();

  TextEditingController profileNameController = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();

    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);

    //# to call first set of pages
    BlocProvider.of<SearchProfileFetchBloc>(context)
        .add(SearchProfile_Fetch_onInit_Event(profileNameController.text));
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
        BlocProvider.of<SearchProfileFetchBloc>(context)
            .add(SearchProfile_Fetch_onInit_Event(profileNameController.text));
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
      appBar: myHeader(),
      // body: myBody_STATES(),
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
      child: SingleChildScrollView(
        //! note : make sure to pass controller in this list
        controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //@ Search bar
              Profile_SearchBar_widget(
                  searchProfileController: profileNameController),

              // fetch list
              SearchProfile_fetch_fetchList_widget(),

              // below fetch list
              SearchProfile_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener,
                searchText: profileNameController.text,
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
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Search users',
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
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
    BlocProvider.of<SearchProfileFetchBloc>(context)
        .add(SearchProfile_Fetch_onRefresh_Event());
    BlocProvider.of<SearchProfileFetchBloc>(context)
        .add(SearchProfile_Fetch_onInit_Event(profileNameController.text));
    scrollController.addListener(scrollListener);
  }
}
