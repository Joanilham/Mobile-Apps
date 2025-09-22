import 'package:flutter/material.dart';
import 'halaman_login.dart';

// Definisi kelas User untuk menyimpan data pengguna secara global
class User {
  final String fullname;
  final String username;
  final String email;
  final String password;

  User(
      {required this.fullname,
      required this.username,
      required this.email,
      required this.password});
}

// Variabel global untuk menyimpan daftar pengguna yang terdaftar
List<User> registeredUsers = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Order App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set to false to remove the "DEBUG" banner
      debugShowCheckedModeBanner: false,
      home: HalamanLogin(),
    );
  }
}
