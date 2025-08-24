import 'package:flutter/material.dart';

class EnergyScoreDetailPage extends StatelessWidget {
  const EnergyScoreDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('에너지 점수'),
      ),
      body: const Center(
        child: Text('에너지 점수 상세 페이지'),
      ),
    );
  }
}
