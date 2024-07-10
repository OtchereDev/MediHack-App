
abstract class ProfileRepository {
  // Future<User?> getProfileById(context, String? profileId);
  // Future<User?> getProfileByToken();
  // Future<User?> updateUser(context, User user);
  Future<Map<String, dynamic>> changePin(context, dynamic data);
  Future<Map<String, dynamic>> checkPhone(context, dynamic data);
  Future<Map<String, dynamic>> verifyForgotOtp(context, dynamic data);
  Future<dynamic> getUserQuestions(context);
  Future<dynamic> getMyQuestions(context);
  Future<dynamic> setQuestions(context, dynamic data);
  Future<dynamic> verifyQuestion(context, dynamic data);
  Future<dynamic> changePassword(context, dynamic data);
  Future<dynamic> forgotPassword(context, dynamic data);
}
