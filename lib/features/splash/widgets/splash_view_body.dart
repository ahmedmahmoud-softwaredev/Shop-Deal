import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/core/utils/assets_constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> iconAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );
    iconAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsConstants.splashBackgroundImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: iconAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: iconAnimation.value,
              child: SvgPicture.asset(
                AssetsConstants.appIcon,
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
