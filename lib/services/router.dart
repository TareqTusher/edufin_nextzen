import 'package:edufin/presentation/screens/home_page.dart';
import 'package:edufin/presentation/screens/portal_screen.dart';
import 'package:edufin/presentation/screens/splash_screen.dart';
import 'package:edufin/presentation/screens/student_description.dart';
import 'package:edufin/presentation/screens/teacher_description.dart';
import 'package:edufin/services/app_routes.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutesPath.splashScreen,

      name: AppRoutesName.splashScreen,
      pageBuilder: (context, state) => NoTransitionPage(child: SplashScreen()),
    ),

    GoRoute(
      path: AppRoutesPath.portalScreen,

      name: AppRoutesName.portalScreen,
      pageBuilder: (context, state) => NoTransitionPage(child: PortalScreen()),
    ),

    GoRoute(
      path: AppRoutesPath.studentDescription,

      name: AppRoutesName.studentDescription,
      pageBuilder: (context, state) =>
          NoTransitionPage(child: StudentDescription()),
    ),

    GoRoute(
      path: AppRoutesPath.teacherDescription,

      name: AppRoutesName.teacherDescription,
      pageBuilder: (context, state) =>
          NoTransitionPage(child: TeacherDescription()),
    ),

    GoRoute(
      path: AppRoutesPath.homePage,

      name: AppRoutesName.homePage,
      pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
    ),
  ],
);
