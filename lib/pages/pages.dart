/// package
import 'dart:async';

import 'package:ditraheal/provider/store_provide.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// local class
import '../controllers/auth_controller.dart';
import '../controllers/loading_controller.dart';
import '../controllers/periode_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/signup_controller.dart';
import '../controllers/signin_controller.dart';
import '../controllers/question_controller.dart';
import '../controllers/treatment_controller.dart';
import '../models/models.dart';
import "../shared/shared.dart";
import "../widgets/widgets.dart";
import "../utils/utils.dart";
import 'main/treatment_empty.dart';
import 'main/treatment_not.dart';
import 'main/treatment_view.dart';
import 'main/treatment_kelompok_view.dart';
import 'main/treatment_result.dart';

/// pages and widget
part 'signup/signup_page.dart';
part 'signup/sosial_signup_page.dart';
part 'signup/hobi_signup_page.dart';
part 'signin/signin_page.dart';

part 'quiz/efikasi/landing_effication_quiz.dart';
part 'quiz/efikasi/effication_quiz.dart';
part 'quiz/efikasi/effication_result.dart';
part 'quiz/trauma/landing_trauma_quiz.dart';
part 'quiz/trauma/trauma_quiz.dart';
part 'quiz/trauma/trauma_result.dart';

part 'quiz/post-efikasi/landing_post_effication_quiz.dart';
part 'quiz/post-efikasi/post_effication_quiz.dart';
part 'quiz/post-efikasi/post_effication_result.dart';



part 'main/loading.dart';
part 'main/main_page.dart';
part 'main/dashboard.dart';
part 'main/pemulihan.dart';
part 'main/pemulihan_kelompok.dart';
part 'main/pemulihan_empty.dart';

part 'account/account_page.dart';
part 'account/profile_page.dart';
part 'account/hobi_page.dart';

part 'splash_screen.dart';
part 'error_page.dart';
