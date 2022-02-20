import 'dart:async';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/dashboard.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _storage = SecureStorage();
  @override
  void initState() {
    super.initState();
    /*Timer(Duration(seconds: 3),() => Navigator.pushNamed(context, route.dashboardPatient));*/
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(AppImages.imgLogo),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.drName,
                style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: AppStrings.slogan1,
                      style: AppTextStyle.body1(txtColor: AppColors.primary)),
                  TextSpan(
                      text: AppStrings.slogan2,
                      style: AppTextStyle.body1(txtColor: AppColors.greyDark)),
                ]),
              ),
              FutureBuilder(
                future: _initialization,
                builder: (context, snapshot) {
                  // If Firebase App init, snapshot has error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }

                  // Connection Initialized - Firebase App is running
                  if (snapshot.connectionState == ConnectionState.done) {
                    // StreamBuilder can check the login state live
                    return StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, streamSnapshot) {
                        // If Stream Snapshot has error
                        if (streamSnapshot.hasError) {
                          return Scaffold(
                            body: Center(
                              child: Text("Error: ${streamSnapshot.error}"),
                            ),
                          );
                        }

                        // Connection state active - Do the user login check inside the
                        // if statement
                        if (streamSnapshot.connectionState ==
                            ConnectionState.active) {
                          // Get the user
                          User? _user = streamSnapshot.data as User?;

                          // If the user is null, we're not logged in
                          if (_user == null) {
                            // user not logged in, head to login
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Navigator.pushReplacementNamed(
                                  context, route.dashboardPatient);
                            });
                          } else {
                            // The user is logged in, head to homepage
                            if (_storage.getUserRoleId() == UserRoles.doctor) {
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                Navigator.pushReplacementNamed(
                                    context, route.dashboardDoctor);
                              });
                            } else {
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                Navigator.pushReplacementNamed(
                                    context, route.dashboardPatient);
                              });
                            }
                          }
                        }

                        // Checking the auth state - Loading
                        return const Expanded(
                            child: SpinKitCircle(
                          color: AppColors.primary,
                        ));
                      },
                    );
                  }

                  // Connecting to Firebase - Loading
                  return const Expanded(
                      child: SpinKitCircle(
                    color: AppColors.primary,
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
