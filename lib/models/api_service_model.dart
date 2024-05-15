import 'dart:core';
import 'package:dio/dio.dart';
import 'user_model.dart';
import 'dart:async';

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
      'avatarUrl': user.avatarUrl,
    };
  }

  // Convert fromJSON to User Model
  static User JsonToUser(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        name: json['name'],
        score: json['score'],
        avatarUrl: json['avatarUrl'],
        id: json['id']);
  }

  // GET Method to Get User by ID
  static Future<dynamic> getUser(int userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return response.data;
    } catch (error) {
      // Handle error
      rethrow;
    }
  }

  // POST Method Create new User
  static Future<int?> createNewUser(User user) async {
    try {
      final response = await _dio.post('/users', data: UserToJson(user));
      return response.statusCode;
    } catch (error) {
      // Handle error
      rethrow;
    }
  }

  // Get Method to Verify user Login
  static Future<bool> verifyLogin(String email, String password) async {
    try {
      final response = await _dio.get('/users',
          queryParameters: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      // Handle error
      rethrow;
    }
  }
  // GET Method Return all users list
  static Future<dynamic> getUsersList() async {
    try {
      final response = await _dio.get('/users');
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
  // GET Method to Return all users by score descending
  static Future<dynamic> getUsersListDescending() async {
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
  static void updateUserScore({required int userId ,required int score}) async {
    try {
     await _dio.put('/users/$userId',data: 'score: $score');
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
      await _dio.put('/users/$userId',data : 'inGame: $status');
    } catch (error) {
      // Handle error
      rethrow;
    }
  }

}
