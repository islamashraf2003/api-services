import 'dart:developer';

import 'package:api_app/Models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ApiService {
  final String baseUrl = "https://gorest.co.in/public/v2/";
  final String userUrlById = "https://gorest.co.in/public/v2/users/";
  Dio dio;
  ApiService(this.dio);
  Future<dynamic> get({required String endPoint}) async {
    Response response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<dynamic> getUserById({required int userId}) async {
    Response response =
        await dio.get('https://gorest.co.in/public/v2/users/$userId');
    return response.data;
  }

  Future<dynamic> addNewUser(
      {required User newUser, @required String? token}) async {
    try {
      if (token == null) {
        throw Exception('Token is null'); // Throw an error if token is null
      }

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await dio.post(
        'https://gorest.co.in/public/v2/users/',
        data: newUser.toJson(), // Assuming toJson() serializes User to JSON
        options: Options(headers: headers),
      );

      return response.data;
    } catch (e) {
      log('Error adding new user: $e');
      return e; // Rethrow the caught exception for upper layers to handle
    }
  }
}
