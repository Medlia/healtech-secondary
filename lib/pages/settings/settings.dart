import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/widgets/back_button.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onTap: () {
            Get.back();
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profile Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Update your profile settings",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdcdc),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        onTap: () {},
                        icon: Icons.edit,
                        title: "Edit Profile",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.change_circle,
                        title: "Change Password",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Account Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Update your account information",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdcdc),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        onTap: () {},
                        icon: Icons.alternate_email,
                        title: "Email Preferences",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.privacy_tip,
                        title: "Privacy Settings",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.account_box,
                        title: "Linked Accounts",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Enable your notification preferences",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdcdc),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        onTap: () {},
                        icon: Icons.notifications,
                        title: "Push Notifications",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.email,
                        title: "Email Notifications",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.sms,
                        title: "SMS Notifications",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Language",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Change your language preferences",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdcdc),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        onTap: () {},
                        icon: Icons.language,
                        title: "Language Preferences",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Help and Support",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Don't hesitate to reach out to us",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdcdc),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        onTap: () {},
                        icon: Icons.question_answer,
                        title: "FAQs",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.contact_support,
                        title: "Contact Support",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.sync_problem,
                        title: "Report a Problem",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "About",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Important information about the application",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdcdc),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        onTap: () {},
                        icon: Icons.verified,
                        title: "App Version",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.description,
                        title: "Terms of Service",
                      ),
                      const SizedBox(height: 8.0),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      const SizedBox(height: 8.0),
                      SettingTile(
                        onTap: () {},
                        icon: Icons.book,
                        title: "Licenses",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Log out of the application",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffdbdcdc),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SettingTile(
                        onTap: () {},
                        icon: Icons.logout,
                        title: "Logout",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 20.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.chevron_right,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
