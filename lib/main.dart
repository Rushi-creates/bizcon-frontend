import 'package:bizcon1/MODULES/AUTH/Login_screen/UserLoginButton_logic/user_login_button_bloc.dart';
import 'package:bizcon1/MODULES/AUTH/Login_screen/UserLoginForm_logic/user_login_form_bloc.dart';
import 'package:bizcon1/MODULES/AUTH/Otp_screen/__UserOtp__/UserOtpButton_logic/user_otp_button_bloc.dart';
import 'package:bizcon1/MODULES/AUTH/Otp_screen/__UserOtp__/UserOtpForm_logic/user_otp_form_bloc.dart';
import 'package:bizcon1/MODULES/AUTH/Register_screen/UserRegButton_logic/user_reg_button_bloc.dart';
import 'package:bizcon1/MODULES/AUTH/Switch_tabs/UserSwitchScreen_logic/user_switch_screen_bloc.dart';
import 'package:bizcon1/MODULES/CREATE_POST/Post_cud_logic/Post_cud_bloc.dart';
import 'package:bizcon1/MODULES/CREATE_PROFILE/edit_profile_logic/edit_profile_bloc.dart';
import 'package:bizcon1/MODULES/My_BottomBar_stub/MyBottomBar_logic/my_bottom_bar_bloc.dart';
import 'package:bizcon1/MODULES/PROFILE/__AppliedToJoinPosts_fetch_stub__/AppliedToJoinPosts_fetch_logic/AppliedToJoinPosts_fetch_bloc.dart';
import 'package:bizcon1/MODULES/PROFILE/__MyJoinedPosts_fetch_stub__/MyJoinedPosts_fetch_logic/MyJoinedPosts_fetch_bloc.dart';

// import 'package:bizcon1/MODULES/HOME/AllPosts_fetch_logic/AllPosts_fetch_bloc.dart';
// import 'package:bizcon1/MODULES/HOME/PostMembers_cud_logic/PostMembers_cud_bloc.dart';
// import 'package:bizcon1/MODULES/PROFILE/PostMembersAccepted_fetch_logic/PostMembersAccepted_fetch_bloc.dart';
// import 'package:bizcon1/MODULES/PROFILE/PostMembers_fetch_logic/PostMembers_fetch_bloc.dart';
// import 'package:bizcon1/MODULES/PROFILE/Posts_fetch_logic/Posts_fetch_bloc.dart';
import 'package:bizcon1/MODULES/SEARCH_SCREEN/__SearchProfile_fetch_stub__/SearchProfile_fetch_logic/SearchProfile_fetch_bloc.dart';
import 'package:bizcon1/MODULES/SETTINGS_SCREEN/UserLod_logic/user_lod_bloc.dart';
import 'package:bizcon1/service_layer_stub/services/SharedPreferences_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'MODULES/HOME/AllPosts_fetch_logic/AllPosts_fetch_bloc.dart';
import 'MODULES/HOME/PostMembers_cud_logic/PostMembers_cud_bloc.dart';
import 'MODULES/POST/__AcceptedPostMembers_fetch_stub__/AcceptedPostMembers_fetch_logic/AcceptedPostMembers_fetch_bloc.dart';
import 'MODULES/POST/__WaitingPostMembers_fetch_stub__/WaitingPostMembers_fetch_logic/WaitingPostMembers_fetch_bloc.dart';
import 'MODULES/PROFILE/__MyPosts_fetch_stub__/MyPosts_fetch_logic/MyPosts_fetch_bloc.dart';
import 'MODULES/Splash_stub/SplashScreen.dart';
import 'MODULES/Splash_stub/Splash_roles_logic/splash_roles_bloc.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  // await Firebase.initializeApp();
  // Profile_sp_repo profile_sp_repo = Profile_sp_repo();

  // await profile_sp_repo.remove_profile();

  //  User_sp_repo user_sp_repo = User_sp_repo();
  // await user_sp_repo.remove_user();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // //@ CUBITS
        // BlocProvider(
        //   create: (context) => DiffProfileBloc(),
        // ),

        //@ BLOCS
        BlocProvider(
          create: (context) => SplashRolesBloc(),
        ),
        BlocProvider(
          create: (context) => UserLoginButtonBloc(),
        ),
        BlocProvider(
          create: (context) => UserLoginFormBloc(),
        ),

        BlocProvider(
          create: (context) => UserLoginButtonBloc(),
        ),
        BlocProvider(
          create: (context) => UserOtpButtonBloc(),
        ),
        BlocProvider(
          create: (context) => UserOtpFormBloc(),
        ),
        BlocProvider(
          create: (context) => UserRegButtonBloc(),
        ),
        BlocProvider(
          create: (context) => UserSwitchScreenBloc(),
        ),
        BlocProvider(
          create: (context) => EditProfileBloc(),
        ),
        BlocProvider(
          create: (context) => MyBottomBarBloc(),
        ),

        BlocProvider(
          create: (context) => UserLodBloc(),
        ),
        BlocProvider(
          create: (context) => PostCudBloc(),
        ),
        BlocProvider(
          create: (context) => MyPostsFetchBloc(),
        ),
        BlocProvider(
          create: (context) => AllPostsFetchBloc(),
        ),
        BlocProvider(
          create: (context) => PostMembersCudBloc(),
        ),
        // BlocProvider(
        //   create: (context) => PostMembersFetchBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => PostMembersAcceptedFetchBloc(),
        // ),
        BlocProvider(
          create: (context) => SearchProfileFetchBloc(),
        ),
        BlocProvider(
          create: (context) => WaitingPostMembersFetchBloc(),
        ),
        BlocProvider(
          create: (context) => AcceptedPostMembersFetchBloc(),
        ),
        BlocProvider(
          create: (context) => MyJoinedPostsFetchBloc(),
        ),
        BlocProvider(
          create: (context) => AppliedToJoinPostsFetchBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // onGenerateRoute: _appRouter.onGenerateRoute, //dont pass brackets here

          home: SplashScreen()),
    );
  }

  // @override
  // void dispose() {
  //   _appRouter.dispose();
  //   super.dispose();
  // }
}
