import 'package:flutter/material.dart';

// Import your contact page
import 'package:my_website/views/contact_view.dart';
import 'package:my_website/views/home/home_view.dart';

class WebNavBar extends StatelessWidget {
  const WebNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // breakpoints
    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1100;

    // responsive sizes
    final double barHeight = isMobile ? 56 : 80;
    final double logoSize = isMobile ? 32 : 50;
    final double brandFont = isMobile ? 16 : 22;
    final double itemFont = isMobile ? 14 : 18;
    final double spacing = isMobile ? 20 : 40;

    return Container(
      height: barHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      child: Row(
        children: <Widget>[
          // Logo + brand
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(
                  height: logoSize,
                  width: logoSize,
                  child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                ),
                const SizedBox(width: 8),
                Text(
                  "Korazon Development",
                  style: TextStyle(
                    fontSize: brandFont,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Nav items
          Row(
            children: <Widget>[
              NavBarItem(
                title: 'Contact',
                fontSize: itemFont,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactView()),
                  );
                },
              ),
              SizedBox(width: spacing),
              NavBarItem(
                title: 'Home',
                fontSize: itemFont,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeView()),
                  );
                },
              ),
              SizedBox(width: spacing),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double fontSize;

  const NavBarItem({
    Key? key,
    required this.title,
    this.onTap,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
