import 'package:flutter/material.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';

class RecommendationDialog extends StatelessWidget {
  const RecommendationDialog({
    required this.animationController,
    required this.animation,
    super.key,
  });

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
              0,
              30 * (1.0 - animation.value),
              0,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFD7E0F9),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 68,
                                  bottom: 12,
                                  right: 16,
                                  top: 12,
                                ),
                                child: Text(
                                  "Don't forget to share "
                                  'about target sinking using the radio',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: TDCTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    color: TDCTheme.nearlyDarkBlue.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox.square(
                          dimension: 60,
                          child: Image.asset('assets/images/radio.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
