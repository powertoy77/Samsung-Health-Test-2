import 'package:flutter/material.dart';
import 'dart:math';

class FireworksAnimation extends StatefulWidget {
  final VoidCallback onComplete;

  const FireworksAnimation({
    super.key,
    required this.onComplete,
  });

  @override
  State<FireworksAnimation> createState() => _FireworksAnimationState();
}

class _FireworksAnimationState extends State<FireworksAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<Star> _stars = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    
    // 별들 생성
    for (int i = 0; i < 50; i++) {
      _stars.add(Star(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 10 + 5,
        color: _getRandomColor(),
        delay: _random.nextDouble() * 0.5,
      ));
    }
    
    _controller.forward().then((_) {
      widget.onComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getRandomColor() {
    final colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
    ];
    return colors[_random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.8),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: _stars.map((star) {
              final progress = (_animation.value - star.delay).clamp(0.0, 1.0);
              final scale = Curves.elasticOut.transform(progress);
              final opacity = (1.0 - progress).clamp(0.0, 1.0);
              
              return Positioned(
                left: star.x * MediaQuery.of(context).size.width,
                top: star.y * MediaQuery.of(context).size.height,
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: Icon(
                      Icons.star,
                      size: star.size,
                      color: star.color,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

// 별 클래스
class Star {
  final double x;
  final double y;
  final double size;
  final Color color;
  final double delay;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.delay,
  });
}
