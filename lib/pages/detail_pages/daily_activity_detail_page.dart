import 'package:flutter/material.dart';

class DailyActivityDetailPage extends StatelessWidget {
  const DailyActivityDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일일 활동'),
      ),
      body: const Center(
        child: Text('일일 활동 상세 페이지'),
      ),
    );
  }
}
