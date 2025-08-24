import 'package:flutter/material.dart';

class StepsDetailPage extends StatelessWidget {
  const StepsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('걸음 수'),
      ),
      body: const Center(
        child: Text('걸음 수 상세 페이지'),
      ),
    );
  }
}
