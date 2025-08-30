import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';
import '../services/bingo_service.dart';
import 'detail_pages/daily_activity_detail_page.dart';
import 'detail_pages/sleep_detail_page.dart';
import 'detail_pages/energy_score_detail_page.dart';
import 'detail_pages/sleep_coaching_start_page.dart';
import 'detail_pages/all_workouts_page.dart';
import 'detail_pages/workout_history_page.dart';
import 'detail_pages/steps_detail_page.dart';
import 'tab_pages/together_page.dart';
import 'tab_pages/discover_page.dart';
import 'tab_pages/fitness_page.dart';
import 'tab_pages/my_page.dart';

class SamsungHealthHomePage extends StatefulWidget {
  const SamsungHealthHomePage({super.key});

  @override
  State<SamsungHealthHomePage> createState() => _SamsungHealthHomePageState();
}

class _SamsungHealthHomePageState extends State<SamsungHealthHomePage> {
  int _selectedIndex = 0;
  
  // MethodChannel for Samsung Health check
  static const MethodChannel _channel = MethodChannel('samsung_health_check');
  
  // Bingo service
  final BingoService _bingoService = BingoService();
  
  // 일일 활동 데이터 상태
  int _currentSteps = 0;
  int _currentActiveMinutes = 0;
  int _currentCalories = 0;
  Timer? _activityTimer;
  
  // 목표 값들
  final int _dailyStepGoal = 10000;
  final int _dailyActiveMinutesGoal = 30;
  final int _dailyCaloriesGoal = 200;
  
  @override
  void initState() {
    super.initState();
    _bingoService.loadBingoData();
    _initializeActivityData();
    _startActivityTimer();
  }
  
  @override
  void dispose() {
    _activityTimer?.cancel();
    super.dispose();
  }
  
  // 현재 시간에 따른 활동 데이터 초기화
  void _initializeActivityData() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final minutesSinceStart = now.difference(startOfDay).inMinutes;
    
    // 하루 중 시간에 따른 자연스러운 증가
    final progressRatio = _calculateProgressRatio(now);
    
    _currentSteps = (_dailyStepGoal * progressRatio).round();
    _currentActiveMinutes = (_dailyActiveMinutesGoal * progressRatio).round();
    _currentCalories = (_dailyCaloriesGoal * progressRatio).round();
    
    // 최소값 보장
    _currentSteps = _currentSteps.clamp(0, _dailyStepGoal);
    _currentActiveMinutes = _currentActiveMinutes.clamp(0, _dailyActiveMinutesGoal);
    _currentCalories = _currentCalories.clamp(0, _dailyCaloriesGoal);
  }
  
  // 시간에 따른 진행률 계산 (0.0 ~ 1.0)
  double _calculateProgressRatio(DateTime now) {
    final hour = now.hour;
    final minute = now.minute;
    final totalMinutes = hour * 60 + minute;
    
    // 하루 24시간을 기준으로 진행률 계산
    // 오전 6시부터 오후 10시까지가 주요 활동 시간
    if (hour < 6) {
      // 새벽 시간 (0-6시): 매우 낮은 활동
      return 0.05;
    } else if (hour < 9) {
      // 아침 시간 (6-9시): 점진적 증가
      return 0.1 + (totalMinutes - 6 * 60) / (3 * 60) * 0.15;
    } else if (hour < 12) {
      // 오전 시간 (9-12시): 활발한 활동
      return 0.25 + (totalMinutes - 9 * 60) / (3 * 60) * 0.25;
    } else if (hour < 15) {
      // 점심 시간 (12-15시): 점심 후 활동
      return 0.5 + (totalMinutes - 12 * 60) / (3 * 60) * 0.2;
    } else if (hour < 18) {
      // 오후 시간 (15-18시): 하루 중 가장 활발한 시간
      return 0.7 + (totalMinutes - 15 * 60) / (3 * 60) * 0.2;
    } else if (hour < 21) {
      // 저녁 시간 (18-21시): 저녁 활동
      return 0.9 + (totalMinutes - 18 * 60) / (3 * 60) * 0.08;
    } else {
      // 밤 시간 (21-24시): 활동 감소
      return 0.98 + (totalMinutes - 21 * 60) / (3 * 60) * 0.02;
    }
  }
  
  // 활동 타이머 시작
  void _startActivityTimer() {
    _activityTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        setState(() {
          _updateActivityData();
        });
      }
    });
  }
  
  // 활동 데이터 업데이트
  void _updateActivityData() {
    final now = DateTime.now();
    final progressRatio = _calculateProgressRatio(now);
    
    final newSteps = (_dailyStepGoal * progressRatio).round();
    final newActiveMinutes = (_dailyActiveMinutesGoal * progressRatio).round();
    final newCalories = (_dailyCaloriesGoal * progressRatio).round();
    
    // 자연스러운 증가를 위해 현재 값과 새 값 사이에서 점진적 증가
    _currentSteps = _lerp(_currentSteps, newSteps, 0.1);
    _currentActiveMinutes = _lerp(_currentActiveMinutes, newActiveMinutes, 0.1);
    _currentCalories = _lerp(_currentCalories, newCalories, 0.1);
  }
  
  // 선형 보간 함수
  int _lerp(int start, int end, double t) {
    return (start + (end - start) * t).round();
  }
  
  // 랜덤 명언을 가져오는 메서드 (선택되지 않은 명언만)
  Map<String, String> _getRandomQuote() {
    return _bingoService.getRandomQuote();
  }
  
  // 일일 활동 상세 페이지로 이동
  void _navigateToDailyActivity() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DailyActivityDetailPage(),
      ),
    );
  }
  

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _getBodyForIndex(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.favorite),
                if (_selectedIndex == 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            label: '홈',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: '투게더',
          ),
                     const BottomNavigationBarItem(
             icon: Icon(Icons.explore),
             label: 'Discover',
           ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.play_circle_outline),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            label: '피트니스',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 페이지',
          ),
        ],
      ),
    );
  }

  Widget _getBodyForIndex(int index) {
    switch (index) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const TogetherPage();
      case 2:
        return const DiscoverPage();
      case 3:
        return const FitnessPage();
      case 4:
        return const MyPage();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildActivitySummaryCard(),
          const SizedBox(height: 16),
          _buildSleepScoreCard(),
          const SizedBox(height: 16),
          _buildActivityShortcutsCard(),
          const SizedBox(height: 16),
          _buildEnergyScoreCard(),
          const SizedBox(height: 16),
          _buildSleepCoachingCard(),
          const SizedBox(height: 16),
          _buildWeeklyWorkoutCard(),
          const SizedBox(height: 16),
          _buildStepGoalCard(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Samsung Health',
            style: GoogleFonts.notoSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.watch, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '연결됨',
                      style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _requestAllPermissions(),
                icon: const Icon(Icons.security, size: 16),
                label: Text(
                  '권한 요청',
                  style: GoogleFonts.notoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySummaryCard() {
    return GestureDetector(
      onTap: () {
        // 일일 활동 상세 페이지로 이동
        _navigateToDailyActivity();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildActivityItem(Icons.directions_walk, '$_currentSteps 걸음', Colors.green),
                  const SizedBox(height: 8),
                  _buildActivityItem(Icons.access_time, '$_currentActiveMinutes분', Colors.blue),
                  const SizedBox(height: 8),
                  _buildActivityItem(Icons.local_fire_department, '$_currentCalories kcal', Colors.pink),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.green[100]!, Colors.blue[100]!, Colors.pink[100]!],
                    ),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                const Icon(Icons.star_border, color: Colors.grey),
                const SizedBox(height: 8),
                const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSleepScoreCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SleepDetailPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '78',
                      style: GoogleFonts.notoSans(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '좋음',
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          color: Colors.purple[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '수면 점수',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildSleepItem(Icons.bed, '오전 1:47'),
                const SizedBox(height: 4),
                _buildSleepItem(Icons.alarm, '오전 9:20'),
                const SizedBox(height: 4),
                _buildSleepItem(Icons.bed, '7시간 33분'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[600], size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityShortcutsCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AllWorkoutsPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActivityShortcut(Icons.directions_walk, '걷기', Colors.green),
            _buildActivityShortcut(Icons.pool, '풀 수영', Colors.blue),
            _buildActivityShortcut(Icons.directions_run, '달리기', Colors.orange),
            _buildActivityShortcut(Icons.more_horiz, '더보기', Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityShortcut(IconData icon, String text, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildEnergyScoreCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EnergyScoreDetailPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '86',
                      style: GoogleFonts.notoSans(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(Icons.trending_up, color: Colors.green, size: 16),
                        Text(
                          '.21',
                          style: GoogleFonts.notoSans(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '에너지 점수',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.blue[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.cloud,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepCoachingCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SleepCoachingStartPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.pets,
                color: Colors.orange,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '수면 코칭',
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.purple[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '내 수면 동물 유형을 확인하려면 7일 동안 수면을',
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '기록해 보세요.',
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      color: Colors.grey[600],
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

  Widget _buildWeeklyWorkoutCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WorkoutHistoryPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '00:00',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '운동을 시작해 볼까요?',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '이번 주 운동 기록',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepGoalCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StepsDetailPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$_currentSteps',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/$_dailyStepGoal 걸음',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${((_currentSteps / _dailyStepGoal) * 100).round()}%',
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      color: Colors.green[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 64,
              lineHeight: 8,
              percent: _currentSteps / _dailyStepGoal,
              backgroundColor: Colors.grey[300]!,
              progressColor: Colors.green,
              barRadius: const Radius.circular(4),
            ),
          ],
        ),
      ),
    );
  }

  // Samsung Health SDK 관련 메서드들
  Future<void> _requestAllPermissions() async {
    try {
      await _channel.invokeMethod('requestAllPermissions');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('모든 권한이 승인되었습니다'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } on PlatformException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('권한 요청 중 오류: ${e.message}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
