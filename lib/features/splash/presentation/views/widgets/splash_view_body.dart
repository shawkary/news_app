import 'package:flutter/material.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: slidingAnimation,
        builder: (BuildContext context, Widget? child) {
          return SlideTransition(
            position: slidingAnimation,
            child: Image.asset(
              'assets/images/news.jpg',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }

  void initSlidingAnimation(){
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
        begin: const Offset(0, 2),
        end: Offset.zero).animate(animationController);

    animationController.forward();
  }


  void navigateToHome(){
    Future.delayed(const Duration(seconds: 4),() {
    },);
  }
}
