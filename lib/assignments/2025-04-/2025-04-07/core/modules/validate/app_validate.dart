abstract class AppValidate {
  static bool email(String email){
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); 
    return emailRegex.hasMatch(email);
  }
}