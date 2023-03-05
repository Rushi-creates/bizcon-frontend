import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../SearchProfile_fetch_logic/SearchProfile_fetch_bloc.dart';

class Profile_SearchBar_widget extends StatelessWidget {
  final searchProfileController;
  const Profile_SearchBar_widget(
      {super.key, required this.searchProfileController});

  @override
  Widget build(BuildContext context) {
    return mySearchBarDecoration(context);
  }

  mySearchBarDecoration(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(child: searchTextField(context)),
        ),
      ),
    );
  }

  searchTextField(context) {
    return TextField(
      autofocus: true,
      onChanged: (value) {
        // to refresh the previous search lists
        BlocProvider.of<SearchProfileFetchBloc>(context)
            .add(SearchProfile_Fetch_onRefresh_Event());
      },
      controller: searchProfileController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.shopping_bag_outlined),
          suffixIcon: performSearchButtonUi(context),
          hintText: 'Search...',
          border: InputBorder.none),
    );
  }

  performSearchButtonUi(context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.blue[900],
        child: CircleAvatar(
          backgroundColor: Colors.blue[900],
          child: FittedBox(
            child: Center(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  //# to call first set of pages
                  BlocProvider.of<SearchProfileFetchBloc>(context).add(
                      SearchProfile_Fetch_onInit_Event(
                          searchProfileController.text));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
