import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepCoachingStartPage extends StatelessWidget {
  const SleepCoachingStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.purple),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '내 수면 유형 확인하기',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // 동물 캐릭터 섹션
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildAnimalCharacter(
                            Icons.pets,
                            Colors.brown[400]!,
                            '고슴도치',
                          ),
                          _buildAnimalCharacter(
                            Icons.flutter_dash,
                            Colors.blue[400]!,
                            '펭귄',
                          ),
                          _buildAnimalCharacter(
                            Icons.pets,
                            Colors.orange[300]!,
                            '사자',
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // 첫 번째 설명 단락
                      Text(
                        '내 수면 유형을 확인하고 적절한 수면 코칭을 받아보세요. 최근 30일 중 7일 동안 수면을 기록해야 하며, 평일 전날 밤과 휴일 전날 밤을 각각 하루 이상 포함해야 합니다. 수면 데이터는 워치나 밴드 또는 링을 착용하고 잠을 자면 자동으로 기록됩니다.',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // 두 번째 설명 단락
                      Text(
                        '수면을 개선할 필요가 있는 사람들에게 맞춤형 수면 코칭을 제공합니다. 수면 코칭은 3-4주 진행되며 수면의 질을 높이는 건강한 습관을 기를 수 있도록 도와줍니다.',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // 다음 버튼
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // 다음 페이지로 이동 (수면 유형 테스트 페이지)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('수면 유형 테스트 페이지로 이동합니다'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  '다음',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalCharacter(IconData icon, Color color, String name) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                              color: color.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 40,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
