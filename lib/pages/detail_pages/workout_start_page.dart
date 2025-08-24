import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutStartPage extends StatefulWidget {
  final String workoutName;
  
  const WorkoutStartPage({
    super.key,
    required this.workoutName,
  });

  @override
  State<WorkoutStartPage> createState() => _WorkoutStartPageState();
}

class _WorkoutStartPageState extends State<WorkoutStartPage> {
  bool _isWorkoutStarted = false;
  int _elapsedSeconds = 0;
  late DateTime _startTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.workoutName,
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // 메뉴 옵션
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('운동 메뉴 옵션')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 운동 정보 카드
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 운동 아이콘
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      _getWorkoutIcon(widget.workoutName),
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // 운동 이름
                  Text(
                    widget.workoutName,
                    style: GoogleFonts.notoSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // 운동 설명
                  Text(
                    _getWorkoutDescription(widget.workoutName),
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // 타이머 카드
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 타이머 표시
                  Text(
                    _formatTime(_elapsedSeconds),
                    style: GoogleFonts.notoSans(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: _isWorkoutStarted ? Colors.green : Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // 시작/정지 버튼
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _toggleWorkout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isWorkoutStarted ? Colors.red : Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _isWorkoutStarted ? '운동 정지' : '운동 시작',
                        style: GoogleFonts.notoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // 운동 통계 카드
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '운동 통계',
                    style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatItem('칼로리', '0', 'kcal'),
                      ),
                      Expanded(
                        child: _buildStatItem('거리', '0', 'km'),
                      ),
                      Expanded(
                        child: _buildStatItem('페이스', '0', 'min/km'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, String unit) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.notoSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        Text(
          unit,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _toggleWorkout() {
    setState(() {
      if (_isWorkoutStarted) {
        // 운동 정지
        _isWorkoutStarted = false;
      } else {
        // 운동 시작
        _isWorkoutStarted = true;
        _startTime = DateTime.now();
        _startTimer();
      }
    });
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_isWorkoutStarted) {
        setState(() {
          _elapsedSeconds++;
        });
        _startTimer();
      }
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
  }

  IconData _getWorkoutIcon(String workoutName) {
    switch (workoutName) {
      case '걷기':
        return Icons.directions_walk;
      case '풀 수영':
        return Icons.pool;
      case '달리기':
        return Icons.directions_run;
      case '래프팅':
        return Icons.rowing;
      case '스테어 클라이머':
        return Icons.stairs;
      case '내 루틴 1':
        return Icons.repeat;
      case '플랭크':
        return Icons.accessibility_new;
      case '실외 자전거':
        return Icons.directions_bike;
      case '팔 굽혀 펴기':
        return Icons.fitness_center;
      case '스쿼트':
        return Icons.accessibility;
      case '테니스':
        return Icons.sports_tennis;
      case '기타 운동':
        return Icons.sports_gymnastics;
      case '서킷 트레이닝':
        return Icons.timer;
      case '야외 수영':
        return Icons.beach_access;
      case '하이킹':
        return Icons.forest;
      case '기구 운동':
        return Icons.fitness_center;
      case '실내 자전거':
        return Icons.pedal_bike;
      case '로잉머신':
        return Icons.rowing;
      case '러닝머신':
        return Icons.directions_run;
      case '일립티컬':
        return Icons.trending_up;
      default:
        return Icons.fitness_center;
    }
  }

  String _getWorkoutDescription(String workoutName) {
    switch (workoutName) {
      case '걷기':
        return '일상적인 걷기 운동으로 건강을 유지하세요';
      case '풀 수영':
        return '수영장에서 하는 수영 운동입니다';
      case '달리기':
        return '유산소 운동의 대표적인 달리기입니다';
      case '래프팅':
        return '강에서 즐기는 래프팅 운동입니다';
      case '스테어 클라이머':
        return '계단 오르기 운동으로 하체를 강화하세요';
      case '내 루틴 1':
        return '개인 맞춤 운동 루틴입니다';
      case '플랭크':
        return '코어 근육을 강화하는 플랭크 운동입니다';
      case '실외 자전거':
        return '실외에서 즐기는 자전거 운동입니다';
      case '팔 굽혀 펴기':
        return '상체 근력을 강화하는 팔굽혀펴기입니다';
      case '스쿼트':
        return '하체 근력을 강화하는 스쿼트 운동입니다';
      case '테니스':
        return '테니스 운동으로 전신을 단련하세요';
      case '기타 운동':
        return '다양한 운동을 즐겨보세요';
      case '서킷 트레이닝':
        return '고강도 서킷 트레이닝입니다';
      case '야외 수영':
        return '자연 속에서 즐기는 수영입니다';
      case '하이킹':
        return '자연 속에서 즐기는 하이킹입니다';
      case '기구 운동':
        return '운동 기구를 활용한 근력 운동입니다';
      case '실내 자전거':
        return '실내에서 즐기는 자전거 운동입니다';
      case '로잉머신':
        return '로잉머신을 활용한 전신 운동입니다';
      case '러닝머신':
        return '실내에서 즐기는 러닝머신 운동입니다';
      case '일립티컬':
        return '일립티컬 머신을 활용한 유산소 운동입니다';
      default:
        return '운동을 시작하여 건강한 삶을 만들어보세요';
    }
  }
}
