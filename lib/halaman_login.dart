import 'package:flutter/material.dart';
import 'package:mini_project/main.dart';

class HalamanLogin extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HalamanLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final user = registeredUsers.firstWhere(
      (u) => u.username == username && u.password == password,
      orElse: () => User(fullname: '', username: '', email: '', password: ''),
    );

    if (user.username.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome back, ${user.fullname}!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau Password salah.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.shopping_bag,
                size: 80,
                color: Color(0xFF0088FF),
              ),
              const SizedBox(height: 20),
              const Text('WELCOME BACK!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text('Sign in to continue'),
              const SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text('Lost Password?', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}