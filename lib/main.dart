import 'package:flutter/material.dart';
import 'package:mini_project/register_page.dart';

// Class untuk menyimpan data pengguna.
class User {
  final String fullname;
  final String username;
  final String email;
  final String password;

  User({
    required this.fullname,
    required this.username,
    required this.email,
    required this.password,
  });
}

// List global untuk menyimpan daftar pengguna yang terdaftar.
final List<User> registeredUsers = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // Atur halaman register sebagai halaman awal aplikasi.
      home: RegisterPage(),
    );
  }
}