import 'package:dinjan_task/firebase_options.dart';
import 'package:dinjan_task/utils/app_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/modules/auth/login/login.dart';
import 'package:dinjan_task/utils/router_utils.dart';
import 'package:dinjan_task/utils/theme_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        title: 'Practical Task',
        theme: AppTheme.appTheme,
        // home: Splash(),
        initialRoute: AppUtils.initialRout,
        getPages: RouterUtils.pages,
      ),
    );
  }
}
