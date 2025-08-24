import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';
import '../widgets/bingo_page.dart';
import '../widgets/fireworks_animation.dart';
import '../services/bingo_service.dart';
import 'detail_pages/sleep_detail_page.dart';
import 'detail_pages/workout_start_page.dart';
import 'detail_pages/energy_score_detail_page.dart';
import 'detail_pages/sleep_coaching_start_page.dart';
import 'detail_pages/all_workouts_page.dart';
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
  
  @override
  void initState() {
    super.initState();
    _bingoService.loadBingoData();
  }
  
  // 랜덤 명언을 가져오는 메서드 (선택되지 않은 명언만)
  Map<String, String> _getRandomQuote() {
    return _bingoService.getRandomQuote();
  }
  
  // 명언 팝업을 표시하는 메서드
  void _showMotivationalQuoteDialog() {
    final quote = _getRandomQuote();
    final quoteNumber = int.parse(quote['number']!);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 명언 번호
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "명언 #${quote['number']}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // 명언 내용
                Text(
                  quote['quote']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // 빙고판 확인하기 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _checkBingoAndNavigate(quoteNumber);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4CAF50),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '빙고판 확인하기',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // 닫기 버튼
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '닫기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  // 빙고 확인 및 네비게이션
  void _checkBingoAndNavigate(int quoteNumber) {
    final result = _bingoService.checkBingoAndNavigate(quoteNumber);
    
    if (result.isBingoCompleted) {
      _showBingoCompletionDialog();
    } else if (result.isNumberFound) {
      _navigateToBingoPage();
    } else {
      _showNoBingoDialog();
    }
  }
  
  // 빙고 완성 축하 다이얼로그
  void _showBingoCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.celebration,
                  size: 60,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                const Text(
                  '축하합니다~!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '드디어 빙고가 완성되었습니다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _bingoService.generateNewBingoBoard();
                      _showFireworksAnimation();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFFFFA500),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '새로운 빙고 시작하기',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  // 빙고판에 없는 번호 다이얼로그
  void _showNoBingoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            '아쉽습니다',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            '다음 기회에',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
  
  // 빙고판 페이지로 이동
  void _navigateToBingoPage() {
    final bingoData = _bingoService.getBingoData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BingoPage(
          bingoNumbers: bingoData.bingoNumbers,
          bingoSelected: bingoData.bingoSelected,
        ),
      ),
    );
  }
  
  // 폭죽 애니메이션 표시
  void _showFireworksAnimation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FireworksAnimation(
          onComplete: () {
            Navigator.of(context).pop();
          },
        );
      },
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
            label: '발견',
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
        // 명언 팝업 표시
        _showMotivationalQuoteDialog();
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
                  _buildActivityItem(Icons.directions_walk, '713 걸음', Colors.green),
                  const SizedBox(height: 8),
                  _buildActivityItem(Icons.access_time, '7분', Colors.blue),
                  const SizedBox(height: 8),
                  _buildActivityItem(Icons.local_fire_department, '27 kcal', Colors.pink),
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
            builder: (context) => const WorkoutStartPage(),
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
                  '713',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/6,000 걸음',
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
                    '11%',
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
              percent: 0.11,
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
