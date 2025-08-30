import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더 섹션
              _buildHeader(),
              const SizedBox(height: 24),
              
              // Health Hub 온보딩 카드
              Expanded(
                child: _buildHealthHubCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // 왼쪽 제목과 부제목
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover',
                style: GoogleFonts.notoSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'For your healthy life',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        
        // 우상단 메뉴 버튼
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Discover 메뉴')),
            );
          },
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black87,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildHealthHubCard() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Health Hub 온보딩 시작')),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[300]!,
              Colors.teal[300]!,
              Colors.green[300]!,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 배경 아이콘들
            _buildBackgroundIcons(),
            
            // 인물 실루엣들
            _buildPeopleSilhouettes(),
            
            // 메인 콘텐츠
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목
                  Text(
                    'Health Hub onboarding',
                    style: GoogleFonts.notoSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // 부제목
                  Text(
                    'Health Hub 서비스와 연동해보세요.',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundIcons() {
    return Positioned.fill(
      child: CustomPaint(
        painter: BackgroundIconsPainter(),
      ),
    );
  }

  Widget _buildPeopleSilhouettes() {
    return Positioned.fill(
      child: CustomPaint(
        painter: PeopleSilhouettesPainter(),
      ),
    );
  }
}

// 배경 아이콘들을 그리는 CustomPainter
class BackgroundIconsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
              ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
              ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // 심박수 그래프 아이콘 (상단 왼쪽)
    _drawHeartRateIcon(canvas, Offset(size.width * 0.1, size.height * 0.1), paint, strokePaint);
    
    // 수면 아이콘 (상단 중앙)
    _drawSleepIcon(canvas, Offset(size.width * 0.5, size.height * 0.08), paint, strokePaint);
    
    // 심장 아이콘 (상단 중앙)
    _drawHeartIcon(canvas, Offset(size.width * 0.5, size.height * 0.15), paint, strokePaint);
    
    // 캘린더 아이콘 (상단 오른쪽)
    _drawCalendarIcon(canvas, Offset(size.width * 0.85, size.height * 0.1), paint, strokePaint);
    
    // 의료 십자가 아이콘 (상단 오른쪽)
    _drawMedicalIcon(canvas, Offset(size.width * 0.9, size.height * 0.2), paint, strokePaint);
    
    // 데이터 아이콘 (하단 왼쪽)
    _drawDataIcon(canvas, Offset(size.width * 0.15, size.height * 0.8), paint, strokePaint);
    
    // 플러스 아이콘 (하단 왼쪽)
    _drawPlusIcon(canvas, Offset(size.width * 0.25, size.height * 0.85), paint, strokePaint);
    
    // 연결선들
    _drawConnectionLines(canvas, size, strokePaint);
  }

  void _drawHeartRateIcon(Canvas canvas, Offset center, Paint paint, Paint strokePaint) {
    final path = Path();
    path.moveTo(center.dx - 15, center.dy);
    path.lineTo(center.dx - 10, center.dy - 8);
    path.lineTo(center.dx - 5, center.dy + 5);
    path.lineTo(center.dx, center.dy - 3);
    path.lineTo(center.dx + 5, center.dy + 7);
    path.lineTo(center.dx + 10, center.dy - 2);
    path.lineTo(center.dx + 15, center.dy + 4);
    
    canvas.drawPath(path, strokePaint);
    
    // 심장 모양
    final heartPath = Path();
    heartPath.moveTo(center.dx, center.dy + 10);
    heartPath.quadraticBezierTo(center.dx - 8, center.dy + 2, center.dx - 8, center.dy + 8);
    heartPath.quadraticBezierTo(center.dx - 8, center.dy + 14, center.dx, center.dy + 18);
    heartPath.quadraticBezierTo(center.dx + 8, center.dy + 14, center.dx + 8, center.dy + 8);
    heartPath.quadraticBezierTo(center.dx + 8, center.dy + 2, center.dx, center.dy + 10);
    
    canvas.drawPath(heartPath, paint);
  }

  void _drawSleepIcon(Canvas canvas, Offset center, Paint paint, Paint strokePaint) {
    // 사람 실루엣
    final personPath = Path();
    personPath.moveTo(center.dx, center.dy - 10);
    personPath.lineTo(center.dx - 5, center.dy);
    personPath.lineTo(center.dx - 3, center.dy + 5);
    personPath.lineTo(center.dx + 3, center.dy + 5);
    personPath.lineTo(center.dx + 5, center.dy);
    personPath.close();
    
    canvas.drawPath(personPath, paint);
    
    // Z 모양 (수면 표현)
    final zPath = Path();
    zPath.moveTo(center.dx - 8, center.dy + 8);
    zPath.lineTo(center.dx + 8, center.dy + 8);
    zPath.lineTo(center.dx - 8, center.dy + 12);
    zPath.lineTo(center.dx + 8, center.dy + 12);
    
    canvas.drawPath(zPath, strokePaint);
  }

  void _drawHeartIcon(Canvas canvas, Offset center, Paint paint, Paint strokePaint) {
    final path = Path();
    path.moveTo(center.dx, center.dy + 8);
    path.quadraticBezierTo(center.dx - 8, center.dy, center.dx - 8, center.dy + 6);
    path.quadraticBezierTo(center.dx - 8, center.dy + 12, center.dx, center.dy + 16);
    path.quadraticBezierTo(center.dx + 8, center.dy + 12, center.dx + 8, center.dy + 6);
    path.quadraticBezierTo(center.dx + 8, center.dy, center.dx, center.dy + 8);
    
    canvas.drawPath(path, paint);
  }

  void _drawCalendarIcon(Canvas canvas, Offset center, Paint paint, Paint strokePaint) {
    // 캘린더 외곽
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: 20, height: 16),
      const Radius.circular(2),
    );
    canvas.drawRRect(rect, strokePaint);
    
    // 상단 부분
    final topRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(center.dx, center.dy - 6), width: 20, height: 4),
      const Radius.circular(2),
    );
    canvas.drawRRect(topRect, paint);
    
    // 날짜 점들
    canvas.drawCircle(Offset(center.dx - 4, center.dy + 2), 1, paint);
    canvas.drawCircle(Offset(center.dx, center.dy + 2), 1, paint);
    canvas.drawCircle(Offset(center.dx + 4, center.dy + 2), 1, paint);
  }

  void _drawMedicalIcon(Canvas canvas, Offset center, Paint paint, Paint strokePaint) {
    // 십자가
    final verticalRect = Rect.fromCenter(center: center, width: 3, height: 12);
    final horizontalRect = Rect.fromCenter(center: center, width: 12, height: 3);
    
    canvas.drawRect(verticalRect, paint);
    canvas.drawRect(horizontalRect, paint);
  }

  void _drawDataIcon(Canvas canvas, Offset center, Paint paint, Paint strokePaint) {
    // 연결된 원들
    final positions = [
      Offset(center.dx - 8, center.dy - 8),
      Offset(center.dx + 8, center.dy - 8),
      Offset(center.dx, center.dy + 8),
    ];
    
    for (final pos in positions) {
      canvas.drawCircle(pos, 4, paint);
    }
    
    // 연결선
    canvas.drawLine(positions[0], positions[1], strokePaint);
    canvas.drawLine(positions[1], positions[2], strokePaint);
    canvas.drawLine(positions[2], positions[0], strokePaint);
  }

  void _drawPlusIcon(Canvas canvas, Offset center, Paint paint, Paint strokePaint) {
    final verticalRect = Rect.fromCenter(center: center, width: 3, height: 12);
    final horizontalRect = Rect.fromCenter(center: center, width: 12, height: 3);
    
    canvas.drawRect(verticalRect, paint);
    canvas.drawRect(horizontalRect, paint);
  }

  void _drawConnectionLines(Canvas canvas, Size size, Paint strokePaint) {
    // 배경 아이콘들을 연결하는 선들
    final points = [
      Offset(size.width * 0.1, size.height * 0.1),
      Offset(size.width * 0.5, size.height * 0.08),
      Offset(size.width * 0.85, size.height * 0.1),
      Offset(size.width * 0.15, size.height * 0.8),
    ];
    
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 인물 실루엣들을 그리는 CustomPainter
class PeopleSilhouettesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
              ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    // 왼쪽 노인들 (수염 난 남성과 여성)
    _drawElderlyMan(canvas, Offset(size.width * 0.15, size.height * 0.4), paint);
    _drawElderlyWoman(canvas, Offset(size.width * 0.25, size.height * 0.45), paint);
    
    // 중앙 스마트폰
    _drawSmartphone(canvas, Offset(size.width * 0.5, size.height * 0.5), paint);
    
    // 오른쪽 의료진 (2명 남성, 1명 여성)
    _drawDoctor(canvas, Offset(size.width * 0.75, size.height * 0.35), paint);
    _drawDoctor(canvas, Offset(size.width * 0.85, size.height * 0.45), paint);
    _drawNurse(canvas, Offset(size.width * 0.8, size.height * 0.55), paint);
  }

  void _drawElderlyMan(Canvas canvas, Offset center, Paint paint) {
    // 머리
    canvas.drawCircle(Offset(center.dx, center.dy - 8), 6, paint);
    
    // 몸통
    final bodyRect = Rect.fromCenter(center: Offset(center.dx, center.dy + 2), width: 12, height: 16);
    canvas.drawRect(bodyRect, paint);
    
    // 수염
    final beardPath = Path();
    beardPath.moveTo(center.dx - 4, center.dy - 2);
    beardPath.quadraticBezierTo(center.dx, center.dy + 2, center.dx + 4, center.dy - 2);
    canvas.drawPath(beardPath, paint);
  }

  void _drawElderlyWoman(Canvas canvas, Offset center, Paint paint) {
    // 머리
    canvas.drawCircle(Offset(center.dx, center.dy - 8), 6, paint);
    
    // 몸통
    final bodyRect = Rect.fromCenter(center: Offset(center.dx, center.dy + 2), width: 12, height: 16);
    canvas.drawRect(bodyRect, paint);
    
    // 머리카락
    final hairPath = Path();
    hairPath.moveTo(center.dx - 6, center.dy - 8);
    hairPath.quadraticBezierTo(center.dx, center.dy - 14, center.dx + 6, center.dy - 8);
    canvas.drawPath(hairPath, paint);
  }

  void _drawSmartphone(Canvas canvas, Offset center, Paint paint) {
    // 스마트폰 외곽
    final phoneRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: 16, height: 24),
      const Radius.circular(2),
    );
    canvas.drawRRect(phoneRect, paint);
    
    // 화면
    final screenRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: 12, height: 18),
      const Radius.circular(1),
    );
          canvas.drawRRect(screenRect, Paint()..color = Colors.white.withValues(alpha: 0.3));
    
    // "HEALTH HUB" 텍스트 (간단한 직사각형으로 표현)
    final textRect = Rect.fromCenter(center: center, width: 10, height: 3);
          canvas.drawRect(textRect, Paint()..color = Colors.white.withValues(alpha: 0.5));
  }

  void _drawDoctor(Canvas canvas, Offset center, Paint paint) {
    // 머리
    canvas.drawCircle(Offset(center.dx, center.dy - 8), 5, paint);
    
    // 몸통
    final bodyRect = Rect.fromCenter(center: Offset(center.dx, center.dy + 2), width: 10, height: 14);
    canvas.drawRect(bodyRect, paint);
    
    // 의사 가운 (넓은 어깨)
    final coatRect = Rect.fromCenter(center: Offset(center.dx, center.dy + 2), width: 14, height: 12);
          canvas.drawRect(coatRect, Paint()..color = Colors.white.withValues(alpha: 0.1));
  }

  void _drawNurse(Canvas canvas, Offset center, Paint paint) {
    // 머리
    canvas.drawCircle(Offset(center.dx, center.dy - 8), 5, paint);
    
    // 몸통
    final bodyRect = Rect.fromCenter(center: Offset(center.dx, center.dy + 2), width: 10, height: 14);
    canvas.drawRect(bodyRect, paint);
    
    // 간호사 모자
    final hatPath = Path();
    hatPath.moveTo(center.dx - 6, center.dy - 8);
    hatPath.lineTo(center.dx + 6, center.dy - 8);
    hatPath.lineTo(center.dx + 4, center.dy - 12);
    hatPath.lineTo(center.dx - 4, center.dy - 12);
    hatPath.close();
    canvas.drawPath(hatPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
