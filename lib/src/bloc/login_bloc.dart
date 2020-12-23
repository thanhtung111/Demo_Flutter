
import 'dart:async';

import 'package:demo_flutter/src/validators/validations.dart';

class LoginBloc{
  StreamController _userContronller = new StreamController();
  StreamController _passContronller = new StreamController();

  Stream get userStream => _userContronller.stream;
  Stream get passStream => _passContronller.stream;

  bool isValidInfo(String username, String password){
    if(!Validations.isValidUser(username)){
      _userContronller.sink.addError("Username must be at least 3 characters");//sink là dữ liệu đầu vào, là sẽ đưa ra thông báo lỗi để xử lý UI
      //_userContronller.stream.//stream là dữ liệu đầu ra đừ data
      return false;
    }
    _userContronller.sink.add("Ok");

    if(!Validations.isValidPassword(password)){
      _passContronller.sink.addError("Password must be at least 6 characters");
      return false;
    }
    _passContronller.sink.add("Ok");

    return true;
  }

  void dispose(){
    _userContronller.close();
    _passContronller.close();
  }
}