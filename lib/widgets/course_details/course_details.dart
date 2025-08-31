import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;

        // responsive paddings & font sizes
        final hPad        = w < 500 ? 16.0 : (w < 800 ? 24.0 : 32.0);
        final titleSize   = w < 200 ? 42.0 : (w < 400 ? 90.0 : 120.0);
        final subtitleSize= w < 200 ? 18.0 : (w < 520 ? 28.0 : 30.0);
        final bodySize    = w < 500 ? 15.0 : 18.0;

        return Align(
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'korazon',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      height: 0.9,
                      fontSize: titleSize,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Safety & Community for Greek Life',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: subtitleSize,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 40),
                  RichText(
  text: TextSpan(
    style: TextStyle(
      color: Colors.white,
      fontSize: bodySize,
      height: 1.7,
    ),
    children: const [
      TextSpan(text: "Korazon brings CU Boulder students together like never before. "),
      TextSpan(
        text: "Your @colorado.edu login is your pass",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ", creating a closed circle where you always know who’s inside: Buffs. That means a trusted space, better vibes, and parties that actually feel like your community. With our built-in "),
      TextSpan(
        text: "ticketing system",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ", you skip the hassle of waiting, worrying, or fumbling with guest lists. One scan, and you’re in—because the best nights should start at the door, not in line. Korazon isn’t just an app. It’s the new standard for Boulder parties."),
    ],
  ),
),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
