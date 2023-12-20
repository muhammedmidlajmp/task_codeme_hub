import 'package:code_me_hub/controller/provider/bottum_nav_proider/bottom_nav_provider.dart';
import 'package:code_me_hub/model/bottum_nav_item/botom_nav_item.dart';
import 'package:code_me_hub/view/lead_list/lead_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Define your screens
    final List<Widget> screens = [
      HomeScreen(),
      LeadListScreen(),
      SettingsScreen(),
      ProfileScreen(),
    ];

    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        body: screens[
            Provider.of<BottomNavBarProvider>(context).currentItem.index],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 8.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 23, 8, 116),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(context, BottomNavItem.Home),
                buildNavItem(context, BottomNavItem.Favorites),
                buildNavItem(context, BottomNavItem.Settings),
                buildNavItem(context, BottomNavItem.Profile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(BuildContext context, BottomNavItem item) {
    BottomNavItem currentItem =
        Provider.of<BottomNavBarProvider>(context).currentItem;

    return GestureDetector(
      onTap: () {
        Provider.of<BottomNavBarProvider>(context, listen: false)
            .setCurrentItem(item);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: currentItem == item ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          getIcon(item),
          color: currentItem == item ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  IconData getIcon(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.Home:
        return Icons.window_sharp;
      case BottomNavItem.Favorites:
        return Icons.file_copy_rounded;
      case BottomNavItem.Settings:
        return Icons.manage_accounts;
      case BottomNavItem.Profile:
        return Icons.edit_document;
    }
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const Center(
        child: Text('Favorites Screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
