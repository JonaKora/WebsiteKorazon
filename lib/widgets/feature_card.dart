// lib/widgets/feature_card.dart
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String body;
  final Widget? icon;            // <--- ICON AS WIDGET
  final Gradient? badgeGradient;
  final double maxWidth;
  final double height;
  final double badgeSize;

  const FeatureCard({
    super.key,
    required this.title,
    required this.body,
    this.icon,
    this.badgeGradient,
    this.maxWidth = 320,         // smaller card
    this.height = 360,           // smaller height
    this.badgeSize = 72,         // smaller badge
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFDFDFDF),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Badge with centered icon
            Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: badgeGradient ??
                    const LinearGradient(
                      begin: Alignment(1.00, 0.12),
                      end: Alignment(0.23, 1.00),
                      colors: [
                        Color(0xFFFF3AB0),
                        Color(0xFFFF177C),
                        Color(0xFFDF107C),
                        Color(0xFF98007C),
                      ],
                    ),
              ),
              child: icon == null
                  ? const SizedBox.shrink()
                  : Center(child: icon),
            ),

            const SizedBox(height: 32),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,               // smaller
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 0.1),

            // Body
            Expanded(
              child: Center(
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF686868),
                    fontSize: 15,            // smaller
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
