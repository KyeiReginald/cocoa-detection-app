import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:helloworld/models/constants.dart';
import 'package:helloworld/pages/bottom-nav/read_more.dart';
import 'package:helloworld/pages/bottom-nav/contact_officers.dart';
import 'package:helloworld/pages/bottom-nav/detect_screen.dart';
import 'package:helloworld/pages/bottom-nav/main_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'Cocoa Diseases Detection',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          backgroundColor: secondaryColor,
          content: Text('Tap back again to leave'),
        ),
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
               MainPage(),
              DetectScreen(),
              const ContactOfficers(),
              const DiseaseCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return BottomNavyBar(
            containerHeight:
                constraints.maxHeight > 60 ? 60 : constraints.maxHeight,
            backgroundColor: primaryColor,
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 8,
            curve: Curves.easeInOut,
            onItemSelected: (index) {
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items: <BottomNavyBarItem>[
              _buildNavItem('Home', Ionicons.home_sharp),
              _buildNavItem('Detection', Ionicons.leaf_sharp),
              _buildNavItem('Contact', Ionicons.call_sharp),
              _buildNavItem('Read More', Ionicons.newspaper_sharp),
            ],
          );
        },
      ),
    );
  }

  BottomNavyBarItem _buildNavItem(String title, IconData icon) {
    return BottomNavyBarItem(
      title: Text(title),
      icon: Icon(icon, size: 24),
      activeColor: secondaryColor,
      inactiveColor: backgroundColor,
      textAlign: TextAlign.center,
    );
  }
}
