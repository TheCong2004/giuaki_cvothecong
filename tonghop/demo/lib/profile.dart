import 'package:flutter/material.dart';
import 'Setting.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
       title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Text(
              "Edit Profile",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
       ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'SAVE',
              style: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Image
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/tuantran.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '••••••',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Address Fields
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '123 Xo Viet Nghe Tinh',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Danang',
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Vietnam',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Phone Number
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Phone number',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '(+84) 912 345 678',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Change Available Time Button
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              child: const Text(
                'Change Available time',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        ),
      ),
  floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Điều hướng đến trang Setting
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Setting()),
          );
        },
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}


