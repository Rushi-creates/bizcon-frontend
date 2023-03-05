part of 'SearchProfile_fetch_screen.dart';

class SearchProfile_fetch_belowList_widget extends StatelessWidget {
  final scrollController;
  final scrollListener;
  final searchText;
  const SearchProfile_fetch_belowList_widget({
    super.key,
    required this.scrollController,
    required this.scrollListener,
    required this.searchText,
  });

  @override
  Widget build(BuildContext context) {
    return belowLastTile_STATES();
  }

  /* -------------------------------------------------------------------------- */
/*               //! display error,loading states widgets                     */
/* -------------------------------------------------------------------------- */

  belowLastTile_STATES() {
    return BlocConsumer<SearchProfileFetchBloc, SearchProfileFetchState>(
      listener: (context, state) {
        if (state is SearchProfile_Fetch_More_Loaded_ButEmpty_State) {
          // stop scrollListener, when no more items to fetch(do not dispose)
          scrollController.removeListener(scrollListener);
        } else if (state is SearchProfile_Fetch_Error_State) {
          // this is imp
          // scrollController.addListener(scrollListener);
          MyComponents.errorSnackBar(context, 'Some Network error');
        }
      },
      builder: (context, state) {
        if (state is SearchProfile_Fetch_Loading_State) {
          return customLoadingWidget();
        } else if (state is SearchProfile_Fetch_Error_State) {
          return connectionErrorText(context, state.error);
        } else if (state is SearchProfile_Fetch_More_Loaded_ButEmpty_State) {
          return MyComponents.nothingMoreToLoad();
        }
        return MyComponents.emptyText();

        //@ if you ever want to use button instead of scroll controller
        // loadMoreButton(context);
      },
    );
  }

  connectionErrorText(context, error) {
    return Center(
      child: Row(
        children: [
          Text(
            'Connection error or \n Error: $error',
            style: TextStyle(color: Colors.red),
          ),
          tryAgainButton(context)
        ],
      ),
    );
  }

  tryAgainButton(context) {
    return TextButton(
      child: Text(
        "Try again",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<SearchProfileFetchBloc>(context)
            .add(SearchProfile_Fetch_onInit_Event(searchText));
      },
    );
  }

  customLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MyComponents.buildLoading(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  loadMoreButton(context) {
    return TextButton(
      child: Text(
        "Load more ",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<SearchProfileFetchBloc>(context)
            .add(SearchProfile_Fetch_onInit_Event(searchText));
      },
    );
  }
}
