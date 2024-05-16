import 'dart:core';
import 'package:dio/dio.dart';
import 'user_model.dart';

class APIServiceModel {
  static final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://664276cb3d66a67b34376d51.mockapi.io/api/v1'));

  // JSON Methods
  // Convert User Object to JSON
  static Map<String, dynamic> UserToJson(User user) {
    return {
      'email': user.email,
      'name': user.name,
      'score': user.score,
      'avatar': user.avatar,
      'password':user.password,
    };
  }

  // Convert fromJSON to User Model
  static User JsonToUser(Map<String, dynamic> json) {
    return User(
        email: json['email'] ?? '', // Provide a default value if email is null
        name: json['name'] ?? '', // Provide a default value if name is null
        score: json['score'] ?? 0, // Provide a default value if score is null
        avatar: json['avatar'] ?? '', // Provide a default value if avatarUrl is null
        id: json['id'] ?? '',
        password: json['password']?? '',
    );
  }

  // GET Method to Get User by ID
  static Future<User> getUser(int userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return JsonToUser(response.data);
    } catch (error) {
      // Handle error
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getUserJson(int userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return response.data;

    } catch (error) {
      // Handle error
      rethrow;
    }
  }
  // POST Method Create new User
  static Future<User?> createNewUser(User user) async {
    try {
      final response = await _dio.post('/users', data: UserToJson(user));
      if (response.statusCode == 201){
        return user;
      }
      else {
        return null;
      }
    } catch (error) {
      // Handle error
      rethrow;
    }
  }

  // Get Method to Verify user Login
  static Future<User?> verifyLogin(String email, String password) async {
    final Response response;
    try {
         response = await _dio.get('/users',
            queryParameters: {'email': email, 'password': password});
      } on Exception catch (e) {
          return null;
      }
      Map<String,dynamic> json = response.data[0];
      if (response.statusCode == 200) {
        User user = JsonToUser(json);
       return user;
      } else {
        return null;
      }
  }
  // GET Method to Return all users by score descending
  static Future<List> getUsersListDescending() async {
    try {
      final response = await _dio.get('/users?sortBy=score&order=desc');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Failed to load users. Status code : ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      rethrow;
    }
  }
  // PUT Method to update score
  static void updateUserScore({required String userId ,required int score}) async {
    try {
     await _dio.put('/users/$userId',data: {'score': score});
    } catch (error) {
      // Handle error
      rethrow;
    }
  }
  // GET Method to get Player Status
  static Future<bool> getUserStatus(int userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return response.data['inGame'];
    } catch (error) {
      // Handle error
      rethrow;
    }
  }

  // PUT Method to change Player Status
  static void putUserStatus(int userId,bool status) async {
    try {
      await _dio.put('/users/$userId',data : {'inGame': status});
    } catch (error) {
      // Handle error
      rethrow;
    }
  }
}
