
class Validations{
  static bool isValidUser(String user){
    return user != null && user.length >= 3;
  }
  static bool isValidPassword(String pass){
    return pass != null && pass.length >= 6;
  }
}