import 'package:flutter/material.dart';

class SleepCoachingStartPage extends StatelessWidget {
  const SleepCoachingStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수면 코칭'),
      ),
      body: const Center(
        child: Text('수면 코칭 시작 페이지'),
      ),
    );
  }
}
