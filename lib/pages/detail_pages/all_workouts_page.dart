import 'package:flutter/material.dart';

class AllWorkoutsPage extends StatelessWidget {
  const AllWorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('모든 운동'),
      ),
      body: const Center(
        child: Text('모든 운동 페이지'),
      ),
    );
  }
}
