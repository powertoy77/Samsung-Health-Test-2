import 'package:flutter/material.dart';

class SleepDetailPage extends StatelessWidget {
  const SleepDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수면'),
      ),
      body: const Center(
        child: Text('수면 상세 페이지'),
      ),
    );
  }
}
