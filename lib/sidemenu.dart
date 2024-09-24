import 'package:flutter/material.dart';
import 'package:prak3/home_page.dart';
import 'package:prak3/about_page.dart';
import 'package:prak3/profile_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/profil.jpeg'), // Gambar profil
                ),
                SizedBox(height: 10),
                Text(
                  'Selamat Datang!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.teal),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.teal),
            title: const Text('About'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.teal),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
