import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prak3/sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String namauser = '';

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namauser = prefs.getString('username') ?? 'Guest';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Selamat datang, $namauser',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
