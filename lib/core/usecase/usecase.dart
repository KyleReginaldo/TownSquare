import 'package:townsquare/main.dart';



Future<bool> joinActivity({required int id}) async {
  final pref = await sharedPreferences?.setInt(id.toString(), id);
  return pref ?? false;
}

Future<bool> unjoinActivity({required int id}) async {
  final pref = await sharedPreferences?.remove(id.toString());
  return pref ?? false;
}
