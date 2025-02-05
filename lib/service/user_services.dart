import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //Store the userName and password using shared preferences

  static Future<void> storeUserDetails(
      {required String username,
      required String email,
      required String password,
      required String confirmPassword,
      required BuildContext context}) async {
    //check if the password and confirm password are the same

    if (password != confirmPassword) {
      //show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password and Confirm Password do not match"),
        ),
      );
    }
    //Store the username and email in shared preferences
    try {
      //check if the password and confirm password are the same
      if (password != confirmPassword) {
        //show a snackbar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password and Confirm Password do not match"),
          ),
        );
        return;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('email', email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User Details stored successfully"),
        ),
      );
    } catch (err) {
      print(err.toString());
    }
  }

  //Get the username and email from shared preferences
  static Future<Map<String, String>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? email = prefs.getString('email');
    return {'username': username!, 'email': email!};
  }

  //Check if the username is stored in shared preferences
  static Future<bool> checkUsername() async {
    //create an instance for shared pref
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    return username != null;
  }

  //remove the username and email from shared preferences
  static Future<void> clearUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('email');
  }

}
