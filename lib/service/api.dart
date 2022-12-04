import 'package:http/http.dart' as http;

class ApiComom {
  final http.Client _httpClient = http.Client();
  final String linkUrl = "http://192.168.1.9/demo";
  final String login = "/login2.php";
  final String register = "/register.php";

  ApiComom._privateConstructor();

  static final ApiComom _instance = ApiComom._privateConstructor();

  factory ApiComom() {
    return _instance;
  }
  Future<http.Response> methodPost(String path,Map<String,dynamic> param) async{
    var uri = Uri.parse(linkUrl + path);
      return await _httpClient.post(uri,body: param);
  }
}
