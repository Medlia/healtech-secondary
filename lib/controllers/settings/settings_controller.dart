import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/pages/settings/widgets/settings_tile.dart';

class SettingsController extends GetxController {
  late final TextEditingController search;
  var tiles = <SettingTile>[].obs;
  var filteredTiles = <SettingTile>[].obs;

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
    tiles.addAll([
      SettingTile(
        onTap: () {},
        icon: Icons.edit,
        title: "Edit Profile",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.change_circle,
        title: "Change Password",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.alternate_email,
        title: "Email Preferences",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.privacy_tip,
        title: "Privacy Settings",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.account_box,
        title: "Linked Accounts",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.notifications,
        title: "Push Notifications",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.email,
        title: "Email Notifications",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.sms,
        title: "SMS Notifications",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.language,
        title: "Language Preferences",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.question_answer,
        title: "FAQs",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.contact_support,
        title: "Contact Support",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.sync_problem,
        title: "Report a Problem",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.verified,
        title: "App Version",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.description,
        title: "Terms of Service",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.book,
        title: "Licenses",
      ),
      SettingTile(
        onTap: () {},
        icon: Icons.logout,
        title: "Logout",
      ),
    ]);
    filteredTiles.addAll(tiles);
    search.addListener(_filterTiles);
  }

  void _filterTiles() {
    var query = search.text.toLowerCase();
    if (query.isEmpty) {
      filteredTiles.assignAll(tiles);
    } else {
      filteredTiles.assignAll(
        tiles
            .where(
              (tile) => tile.title.toLowerCase().contains(query),
            )
            .toList(),
      );
    }
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
