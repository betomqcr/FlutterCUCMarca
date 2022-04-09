part of 'providers.dart';

class UserProvider  with ChangeNotifier {

  String _token = '';
  User _user = User.empty();
  bool _isLogin = false;

  String get token => _token;

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  bool get isLogin => _isLogin;

  set isLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }
}