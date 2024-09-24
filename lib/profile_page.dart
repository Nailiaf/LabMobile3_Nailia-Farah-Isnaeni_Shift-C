import 'package:flutter/material.dart';
import 'package:prak3/sidemenu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman Profile'),
      ),
      drawer: const Sidemenu(),
    );
  }
}
