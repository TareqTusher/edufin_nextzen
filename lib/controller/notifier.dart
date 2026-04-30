import 'package:edufin/controller/state.dart';
import 'package:edufin/services/app_routes.dart';
import 'package:edufin/services/auth.dart'; 
import 'package:edufin/services/router.dart';
import 'package:flutter_riverpod/legacy.dart';

class EdufinNotifier extends StateNotifier<EdufinState> {
  EdufinNotifier() : super(EdufinState()){
   checkLogin();
  }

  Future<void> checkLogin() async {
    final role = await SessionService.getRole();

    if (mounted) {
      if (role == 'student') {
       router.push(AppRoutesPath.studentDescription);
      } else if (role == 'teacher') {
              router.push(AppRoutesPath.teacherDescription);

      } else {
        // setState(() => isLoading = false
        // );
      }
    }
  }
}

final stateProvider = StateNotifierProvider<EdufinNotifier, EdufinState>((ref) {
  return EdufinNotifier();
});
