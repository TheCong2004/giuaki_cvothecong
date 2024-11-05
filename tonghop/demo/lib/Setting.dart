import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'profile.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<Setting> {
  bool notificationsEnabled = true;

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
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/tuantran.png'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Tuan Tran',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Guide',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Profile()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'EDIT PROFILE',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Settings List
            _buildSettingItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              trailing: CupertinoSwitch(
                value: notificationsEnabled,
                activeColor: Colors.cyan,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),
            _buildSettingItem(
              icon: Icons.language_outlined,
              title: 'Languages',
              showDivider: true,
            ),
            _buildSettingItem(
              icon: Icons.credit_card_outlined,
              title: 'Payment Info',
              showDivider: true,
            ),
            _buildSettingItem(
              icon: Icons.bar_chart_outlined,
              title: 'Income Stats',
              showDivider: true,
            ),
            _buildSettingItem(
              icon: Icons.shield_outlined,
              title: 'Privacy & Policies',
              showDivider: true,
            ),
            _buildSettingItem(
              icon: Icons.message_outlined,
              title: 'Feedback',
              showDivider: true,
            ),
            _buildSettingItem(
              icon: Icons.book_outlined,
              title: 'Usage',
              showDivider: true,
            ),

            // Sign Out Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign out',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    bool showDivider = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.black54,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          trailing: trailing ?? const Icon(
            Icons.chevron_right,
            color: Colors.black54,
          ),
          onTap: () {},
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 56,
          ),
      ],
    );
  }
}