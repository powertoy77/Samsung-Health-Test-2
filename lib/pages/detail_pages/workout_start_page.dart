import 'package:flutter/material.dart';

class WorkoutStartPage extends StatelessWidget {
  const WorkoutStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('운동 시작'),
      ),
      body: const Center(
        child: Text('운동 시작 페이지'),
      ),
    );
  }
}
