import 'package:flaury_business/app/authentication/controllers/password_visibility_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final passwordvisible = ChangeNotifierProvider((ref) => Passwordvisible());
final passwordsvisible = ChangeNotifierProvider((ref) => Visibilitynew());
final confirmvisible = ChangeNotifierProvider((ref) => Visibilityconfirm());
