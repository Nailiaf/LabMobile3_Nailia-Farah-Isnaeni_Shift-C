import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prak3/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  Widget _buildInputField(
      TextEditingController controller, String labelText, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon:
              isPassword ? const Icon(Icons.lock) : const Icon(Icons.person),
        ),
      ),
    );
  }

  Future<void> _showDialog(String message, Widget nextPage) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInputField(_usernameController, 'Masukkan Username', false),
            _buildInputField(_passwordController, 'Masukkan Password', true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  await _saveUsername();
                  _showDialog('Anda Berhasil Login', const HomePage());
                } else {
                  _showDialog('Username dan Password Salah', const LoginPage());
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
