import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio();

  Future<dynamic> postLogin(String email, String password) async {
    Map<String, dynamic> formData = {
      "email": email,
      "password": password,
    };
    try {
      var response =
          await dio.post("https://reqres.in/api/login/", data: formData);

      print("Hasilnya --> ${response.data}");
      if (response.statusCode == 200) {
        return response.data;
      }
    } on Exception catch (error) {
      print("Error di -> $error");
    }
  }

  Future<dynamic> postRegister(String email, String password) async {
    try {
      Map<String, dynamic> formData = {
        "email": email,
        "password": password,
      };
      var response =
          await dio.post("https://reqres.in/api/register/", data: formData);
      print("Hasilnya --> ${response.data}");
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      print("Error di -> $error");
    }
  }
}
