import 'package:flutter/material.dart';
import 'package:my_website/theme/korazon_theme.dart';
import 'package:my_website/widgets/centered_view/centered_view.dart';
import 'package:my_website/widgets/course_details/course_details.dart';
import 'package:my_website/widgets/navigation_bar/navigation_bar.dart';
import 'package:my_website/widgets/feature_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: KorazonGradient.background(angleDeg: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WebNavBar(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Hero/intro section
                    const CenteredView(
                      child: Row(
                        children: [Expanded(child: CourseDetails())],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // === Feature cards section (responsive grid) ===
                    // inside HomeView, replace ONLY the Feature cards section widget:
CenteredView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;

        // Breakpoints: phone=1, tablet=2, desktop=3
        final crossAxisCount = w < 600 ? 1 : (w < 1000 ? 2 : 3);

        // Keep these in sync with FeatureCard defaults
        const cardHeight = 360.0;
        const crossSpacing = 20.0;
        const mainSpacing = 20.0;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,  // <- now responsive
            crossAxisSpacing: crossSpacing,
            mainAxisSpacing: mainSpacing,
            mainAxisExtent: cardHeight,      // keeps cards compact
          ),
          itemBuilder: (context, i) {
            switch (i) {
              case 0:
                return FeatureCard(
                  title: 'Safety First',
                  body:
                      'Advanced safety tools and real-time monitoring to keep your Greek life community secure and protected.',
                  icon: const Icon(Icons.verified_user, color: Colors.white, size: 40),
                  maxWidth: 320,
                  height: cardHeight,
                  badgeSize: 72,
                );
              case 1:
                return FeatureCard(
                  title: 'Verified Community',
                  body:
                      'Seamlessly integrated with your university domain, ensuring institutional compliance and security.',
                  icon: const Icon(Icons.school, color: Colors.white, size: 40),
                  maxWidth: 320,
                  height: cardHeight,
                  badgeSize: 72,
                );
              default:
                return FeatureCard(
                  title: 'Smooth Ticketing',
                  body:
                      'No more guest-list chaos. One scan at the door and you’re in—fast, simple, reliable.',
                  icon: const Icon(Icons.confirmation_number, color: Colors.white, size: 40),
                  maxWidth: 320,
                  height: cardHeight,
                  badgeSize: 72,
                );
            }
          },
        );
      },
    ),
  ),
),



                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
