import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const SamsungHealthApp());
}

class SamsungHealthApp extends StatelessWidget {
  const SamsungHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samsung Health',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      home: const SamsungHealthHomePage(),
    );
  }
}

class SamsungHealthHomePage extends StatefulWidget {
  const SamsungHealthHomePage({super.key});

  @override
  State<SamsungHealthHomePage> createState() => _SamsungHealthHomePageState();
}

class _SamsungHealthHomePageState extends State<SamsungHealthHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // 헤더
            _buildHeader(),
            // 메인 콘텐츠
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
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
                    _buildWeeklyExerciseCard(),
                    const SizedBox(height: 16),
                    _buildStepsGoalCard(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            // 하단 네비게이션
            _buildBottomNavigation(),
          ],
        ),
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
        ],
      ),
    );
  }

  Widget _buildActivitySummaryCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DailyActivityDetailPage(),
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

  Widget _buildWeeklyExerciseCard() {
    return Container(
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
    );
  }

  Widget _buildStepsGoalCard() {
    return Container(
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
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Secured by Knox',
                  style: GoogleFonts.notoSans(
                    fontSize: 10,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
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
        ],
      ),
    );
  }
}

class DailyActivityDetailPage extends StatefulWidget {
  const DailyActivityDetailPage({super.key});

  @override
  State<DailyActivityDetailPage> createState() => _DailyActivityDetailPageState();
}

class _DailyActivityDetailPageState extends State<DailyActivityDetailPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '일일 활동',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildDailyActivityCard(),
            const SizedBox(height: 16),
            _buildActivityDetailsCard(),
            const SizedBox(height: 16),
            _buildActivityHistoryCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                selectedDate = selectedDate.subtract(const Duration(days: 1));
              });
            },
          ),
          Text(
            '${selectedDate.month}월 ${selectedDate.day}일',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                selectedDate = selectedDate.add(const Duration(days: 1));
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDailyActivityCard() {
    return Container(
      padding: const EdgeInsets.all(20),
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
          // 중앙 시각화 - 원형 진행률 표시기
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 가장 바깥쪽 원 (걸음 수)
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 12,
                  percent: 967 / 6000, // 967/6000
                  center: const Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.pink,
                  ),
                  progressColor: Colors.green,
                  backgroundColor: Colors.grey[200]!,
                ),
                // 중간 원 (활동 시간)
                CircularPercentIndicator(
                  radius: 65,
                  lineWidth: 12,
                  percent: 10 / 90, // 10/90
                  center: const SizedBox.shrink(),
                  progressColor: Colors.blue,
                  backgroundColor: Colors.transparent,
                ),
                // 가장 안쪽 원 (활동 칼로리)
                CircularPercentIndicator(
                  radius: 50,
                  lineWidth: 12,
                  percent: 38 / 500, // 38/500
                  center: const SizedBox.shrink(),
                  progressColor: Colors.pink,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // 주요 활동 지표
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActivityMetric(
                Icons.directions_walk,
                '967',
                '/6,000',
                '걸음',
                Colors.green,
              ),
              _buildActivityMetric(
                Icons.access_time,
                '10',
                '/90분',
                '활동 시간',
                Colors.blue,
              ),
              _buildActivityMetric(
                Icons.local_fire_department,
                '38',
                '/500kcal',
                '활동 칼로리',
                Colors.pink,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // 추가 요약 정보
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryItem('총 칼로리 소모량', '976 kcal'),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.grey[300],
                ),
                _buildSummaryItem('활동으로 이동한 거리', '0.76 km'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityMetric(IconData icon, String current, String target, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          current,
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          target,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityDetailsCard() {
    return Container(
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
          Text(
            '활동 상세',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailItem('걸음 수', '967', '6,000', 967 / 6000, Colors.green),
          const SizedBox(height: 12),
          _buildDetailItem('활동 시간', '10분', '90분', 10 / 90, Colors.blue),
          const SizedBox(height: 12),
          _buildDetailItem('활동 칼로리', '38 kcal', '500 kcal', 38 / 500, Colors.pink),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String current, String target, double progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$current / $target',
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 64,
          lineHeight: 6,
          percent: progress,
          backgroundColor: Colors.grey[200]!,
          progressColor: color,
          barRadius: const Radius.circular(3),
        ),
      ],
    );
  }

  Widget _buildActivityHistoryCard() {
    return Container(
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
          Text(
            '주간 활동 기록',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeekDay('월', 1200, Colors.green),
              _buildWeekDay('화', 800, Colors.green),
              _buildWeekDay('수', 1500, Colors.green),
              _buildWeekDay('목', 1100, Colors.green),
              _buildWeekDay('금', 967, Colors.green),
              _buildWeekDay('토', 0, Colors.grey),
              _buildWeekDay('일', 0, Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDay(String day, int steps, Color color) {
    final maxSteps = 6000;
    final height = 80.0;
    final barHeight = steps > 0 ? (steps / maxSteps) * height : 0.0;
    
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 20,
                height: barHeight,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          steps.toString(),
          style: GoogleFonts.notoSans(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

class SleepDetailPage extends StatefulWidget {
  const SleepDetailPage({super.key});

  @override
  State<SleepDetailPage> createState() => _SleepDetailPageState();
}

class _SleepDetailPageState extends State<SleepDetailPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '수면',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildWeeklySleepChart(),
            const SizedBox(height: 16),
            _buildSleepTimeCard(),
            const SizedBox(height: 16),
            _buildSleepScoreCard(),
            const SizedBox(height: 16),
            _buildSleepStagesCard(),
            const SizedBox(height: 16),
            _buildBloodOxygenCard(),
            const SizedBox(height: 16),
            _buildSnoringCard(),
            const SizedBox(height: 16),
            _buildSkinTemperatureCard(),
            const SizedBox(height: 16),
            _buildHeartRateCard(),
            const SizedBox(height: 16),
            _buildRespirationRateCard(),
            const SizedBox(height: 16),
            _buildSleepRegularityCard(),
            const SizedBox(height: 16),
            _buildSleepCoachingCard(),
            const SizedBox(height: 16),
            _buildRelatedContentCard(),
            const SizedBox(height: 16),
            _buildAddSleepRecordButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklySleepChart() {
    return Container(
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
          Text(
            '주간 수면 시간',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeekDay('17', 7.5, false),
              _buildWeekDay('18', 6.8, false),
              _buildWeekDay('19', 8.2, false),
              _buildWeekDay('20', 7.0, false),
              _buildWeekDay('21', 6.5, false),
              _buildWeekDay('22', 7.8, false),
              _buildWeekDay('23', 7.6, true), // 현재 선택된 날짜
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDay(String day, double hours, bool isSelected) {
    final maxHours = 10.0;
    final height = 80.0;
    final barHeight = (hours / maxHours) * height;
    
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: isSelected ? Colors.blue : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 20,
                height: barHeight,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${hours.toStringAsFixed(1)}h',
          style: GoogleFonts.notoSans(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSleepTimeCard() {
    return _buildDetailCard(
      '수면 시간',
      Icons.bed,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.bed, size: 40, color: Colors.blue),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '7시간 33분',
                    style: GoogleFonts.notoSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '오전 1:47 - 오전 9:20',
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '실제 수면 시간 6시간 24분',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSleepScoreCard() {
    return _buildDetailCard(
      '수면 점수',
      Icons.favorite,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '좋음',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '78.13',
                style: GoogleFonts.notoSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.favorite, size: 30, color: Colors.green),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '수면 점수에 영향을 주는 요인',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildSleepFactor('실제 수면 시간', 0.8, '좋음'),
          const SizedBox(height: 8),
          _buildSleepFactor('깊은 수면', 0.85, '좋음'),
          const SizedBox(height: 8),
          _buildSleepFactor('렘 수면', 0.75, '좋음'),
          const SizedBox(height: 8),
          _buildSleepFactor('숙면 정도', 0.6, '관심 필요'),
          const SizedBox(height: 8),
          _buildSleepFactor('잠들기까지 걸린 시간', 0.9, '매우 좋음'),
        ],
      ),
    );
  }

  Widget _buildSleepFactor(String label, double progress, String status) {
    Color statusColor = Colors.green;
    if (status == '관심 필요') statusColor = Colors.orange;
    if (status == '매우 좋음') statusColor = Colors.blue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: statusColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 64,
          lineHeight: 6,
          percent: progress,
          backgroundColor: Colors.grey[200]!,
          progressColor: statusColor,
          barRadius: const Radius.circular(3),
        ),
      ],
    );
  }

  Widget _buildSleepStagesCard() {
    return _buildDetailCard(
      '수면 단계',
      Icons.timeline,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 33,
                  child: Container(color: Colors.lightBlue),
                ),
                Expanded(
                  flex: 39,
                  child: Container(color: Colors.blue),
                ),
                Expanded(
                  flex: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSleepStage('각성', '25%', '1시간 9분', Colors.orange),
              _buildSleepStage('얕은 수면', '33%', '2시간 17분', Colors.lightBlue),
              _buildSleepStage('깊은 수면', '39%', '2시간 50분', Colors.blue),
              _buildSleepStage('렘 수면', '16%', '1시간 17분', Colors.indigo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSleepStage(String label, String percentage, String duration, Color color) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          percentage,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          duration,
          style: GoogleFonts.notoSans(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildBloodOxygenCard() {
    return _buildDetailCard(
      '수면 중 혈중 산소',
      Icons.air,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '혈중 산소 그래프',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '- 90% 미만: 3분 56초',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '정확한 측정을 위해 자는 동안 웨어러블 기기를 꼭 맞게 착용했는지 확인하세요.',
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSnoringCard() {
    return _buildDetailCard(
      '코골이',
      Icons.mic,
      Text(
        '수면 중 휴대전화가 충전되지 않아 코골이 기능이 동작하지 않았습니다.',
        style: GoogleFonts.notoSans(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildSkinTemperatureCard() {
    return _buildDetailCard(
      '수면 중 피부 온도',
      Icons.thermostat,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '-0.7에서 +1.1 °C',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '최근 평균 대비 변화',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '피부 온도 그래프',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRateCard() {
    return _buildDetailCard(
      '심박수',
      Icons.favorite,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '평균 심박수 58 bpm',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '심박수 그래프',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRespirationRateCard() {
    return _buildDetailCard(
      '호흡수',
      Icons.air,
      Text(
        '평균 호흡수 9.6 회/분',
        style: GoogleFonts.notoSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSleepRegularityCard() {
    return _buildDetailCard(
      '수면 규칙성',
      Icons.calendar_today,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '7일 중 0일 목표 달성함',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildRegularityDay('18', true, false),
              _buildRegularityDay('19', false, true),
              _buildRegularityDay('20', false, true),
              _buildRegularityDay('21', false, true),
              _buildRegularityDay('22', false, false),
              _buildRegularityDay('23', false, false),
              _buildRegularityDay('24', false, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRegularityDay(String day, bool sleepGoal, bool wakeGoal) {
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Icon(
          Icons.bed,
          size: 16,
          color: sleepGoal ? Colors.blue : Colors.grey[300],
        ),
        const SizedBox(height: 4),
        Icon(
          Icons.alarm,
          size: 16,
          color: wakeGoal ? Colors.blue : Colors.grey[300],
        ),
      ],
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

  Widget _buildRelatedContentCard() {
    return _buildDetailCard(
      '연관 콘텐츠',
      Icons.video_library,
      Column(
        children: [
          _buildContentItem('7일간의 행복 CALM', 'CALM'),
          const SizedBox(height: 8),
          _buildContentItem('초보자용 전신 스트레칭 BLESSLIFE', 'BLESSLIFE'),
          const SizedBox(height: 8),
          _buildContentItem('기상후 스트레칭 BLESSLIFE', 'BLESSLIFE'),
          const SizedBox(height: 8),
          _buildContentItem('전신 BLESS', 'BLESS'),
        ],
      ),
    );
  }

  Widget _buildContentItem(String title, String source) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(Icons.play_arrow, color: Colors.grey[600]),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                source,
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddSleepRecordButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          '수면 기록 추가',
          style: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, IconData icon, Widget content) {
    return Container(
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
                title,
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}

class WorkoutStartPage extends StatefulWidget {
  const WorkoutStartPage({super.key});

  @override
  State<WorkoutStartPage> createState() => _WorkoutStartPageState();
}

class _WorkoutStartPageState extends State<WorkoutStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '운동 시작',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWorkoutCategories(),
            const SizedBox(height: 24),
            _buildPopularWorkouts(),
            const SizedBox(height: 24),
            _buildRecentWorkouts(),
            const SizedBox(height: 24),
            _buildWorkoutGoals(),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '운동 카테고리',
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: [
            _buildCategoryCard('걷기', Icons.directions_walk, Colors.green, '8,000걸음'),
            _buildCategoryCard('달리기', Icons.directions_run, Colors.orange, '5km'),
            _buildCategoryCard('자전거', Icons.directions_bike, Colors.blue, '20km'),
            _buildCategoryCard('수영', Icons.pool, Colors.cyan, '1km'),
            _buildCategoryCard('요가', Icons.self_improvement, Colors.purple, '30분'),
            _buildCategoryCard('헬스', Icons.fitness_center, Colors.red, '45분'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color, String goal) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            goal,
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularWorkouts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '인기 운동',
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildWorkoutCard('빠른 걷기', '30분', '150kcal', Icons.directions_walk, Colors.green),
        const SizedBox(height: 12),
        _buildWorkoutCard('조깅', '45분', '300kcal', Icons.directions_run, Colors.orange),
        const SizedBox(height: 12),
        _buildWorkoutCard('자전거 타기', '60분', '400kcal', Icons.directions_bike, Colors.blue),
      ],
    );
  }

  Widget _buildWorkoutCard(String title, String duration, String calories, IconData icon, Color color) {
    return Container(
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
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      duration,
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.local_fire_department, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      calories,
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentWorkouts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최근 운동',
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildRecentWorkoutCard('걷기', '오늘 08:30', '7,234걸음', '45분', Icons.directions_walk, Colors.green),
        const SizedBox(height: 12),
        _buildRecentWorkoutCard('조깅', '어제 18:15', '5.2km', '32분', Icons.directions_run, Colors.orange),
      ],
    );
  }

  Widget _buildRecentWorkoutCard(String title, String time, String distance, String duration, IconData icon, Color color) {
    return Container(
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
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: GoogleFonts.notoSans(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      distance,
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      duration,
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildWorkoutGoals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '이번 주 목표',
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Container(
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '운동 시간',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '3/5일',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearPercentIndicator(
                width: double.infinity,
                lineHeight: 8,
                percent: 0.6,
                backgroundColor: Colors.grey[300],
                progressColor: Colors.green,
                barRadius: const Radius.circular(4),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '총 운동 시간',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '2시간 15분',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearPercentIndicator(
                width: double.infinity,
                lineHeight: 8,
                percent: 0.45,
                backgroundColor: Colors.grey[300],
                progressColor: Colors.blue,
                barRadius: const Radius.circular(4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EnergyScoreDetailPage extends StatefulWidget {
  const EnergyScoreDetailPage({super.key});

  @override
  State<EnergyScoreDetailPage> createState() => _EnergyScoreDetailPageState();
}

class _EnergyScoreDetailPageState extends State<EnergyScoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '에너지 점수',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.signal_cellular_alt, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateSelector(),
            const SizedBox(height: 24),
            _buildMainEnergyScore(),
            const SizedBox(height: 24),
            _buildVibrantLifeSecret(),
            const SizedBox(height: 16),
            _buildFeedbackSection(),
            const SizedBox(height: 24),
            _buildEnergyFactors(),
            const SizedBox(height: 24),
            _buildSleepDetails(),
            const SizedBox(height: 24),
            _buildAchievementSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
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
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      final dates = ['17', '18', '19', '20', '21', '22', '23', '8/24'];
                      final isSelected = index == 7;
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Column(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blue : Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dates[index],
                              style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: isSelected ? Colors.blue : Colors.grey[600],
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                '100',
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainEnergyScore() {
    return Container(
      padding: const EdgeInsets.all(24),
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
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 100,
                                 child: CircularPercentIndicator(
                   radius: 100,
                   lineWidth: 12,
                   percent: 0.86,
                   center: const SizedBox(),
                   progressColor: Colors.blue,
                   backgroundColor: Colors.grey[200]!,
                   circularStrokeCap: CircularStrokeCap.round,
                   startAngle: 180,
                   arcType: ArcType.HALF,
                 ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '86',
                        style: GoogleFonts.notoSans(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Row(
                        children: [
                          Icon(Icons.trending_up, color: Colors.green, size: 16),
                          Text(
                            '21',
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
                  Text(
                    '매우 좋음',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: Colors.blue[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.info_outline, color: Colors.grey[400], size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVibrantLifeSecret() {
    return Container(
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
                '활기찬 생활의 비결',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Icon(Icons.info_outline, color: Colors.grey[400], size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '수면 심박수가 평소 수준으로 안정적으로 유지되고 있어 건강이 회복되고 있습니다. 에너지 점수도 매우 좋음입니다. 현재 상태를 유지하면서 활동 시간을 꾸준히 관리하세요. 스트레스 수치가 낮아 긍정적입니다. 계속해서 더 나은 건강한 삶을 위해 노력하세요!',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackSection() {
    return Container(
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
          Text(
            '이 정보가 유용했나요?',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.thumb_up_outlined, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.thumb_down_outlined, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildEnergyFactors() {
    return Container(
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
          Text(
            '에너지 점수에 영향을 주는 요인',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildFactorItem('수면 시간 평균', 0.7, '좋음', Colors.grey!),
          const SizedBox(height: 12),
          _buildFactorItem('수면 시간 규칙성', 0.95, '매우 좋음', Colors.blue),
          const SizedBox(height: 12),
          _buildFactorItem('수면 패턴 규칙성', 0.95, '매우 좋음', Colors.blue),
          const SizedBox(height: 12),
          _buildFactorItem('입면 시간', 0.95, '매우 좋음', Colors.blue),
          const SizedBox(height: 12),
          _buildFactorItem('전날 활동', 0.7, '좋음', Colors.grey!),
          const SizedBox(height: 12),
          _buildFactorItem('활동 규칙성', 0.7, '좋음', Colors.grey!),
          const SizedBox(height: 12),
          _buildFactorItem('수면 심박수', 0.95, '매우 좋음', Colors.blue),
          const SizedBox(height: 12),
          _buildFactorItem('수면 심박변이도', 0.95, '매우 좋음', Colors.blue),
        ],
      ),
    );
  }

  Widget _buildFactorItem(String title, double percent, String status, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Text(
              status,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
                 LinearPercentIndicator(
           width: double.infinity,
           lineHeight: 6,
           percent: percent,
           backgroundColor: Colors.grey[200]!,
           progressColor: color,
           barRadius: const Radius.circular(3),
         ),
      ],
    );
  }

  Widget _buildSleepDetails() {
    return Container(
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
          Text(
            '지난밤 수면에 대해 더 알아보기',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildSleepMetric('수면 중 심박수', '평균: 58bpm', '90bpm'),
          const SizedBox(height: 16),
          _buildSleepMetric('수면 중 심박변이도', '평균: 47ms', '127ms'),
          const SizedBox(height: 16),
          _buildSleepMetric('수면 중 피부 온도', '최근 평균 대비 -0.7에서 +1.1 °C', ''),
          const SizedBox(height: 16),
          _buildSleepMetric('수면 중 호흡수', '평균: 9.6회/분', ''),
        ],
      ),
    );
  }

  Widget _buildSleepMetric(String title, String value, String maxValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            if (maxValue.isNotEmpty)
              Text(
                maxValue,
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            const SizedBox(width: 8),
            Icon(Icons.info_outline, color: Colors.grey[400], size: 16),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '그래프 영역',
              style: GoogleFonts.notoSans(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementSection() {
    return Container(
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
        children: [
          Text(
            '성취도',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.amber[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_fire_department,
              size: 40,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '에너지 점수 매우 좋음',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class SleepCoachingStartPage extends StatefulWidget {
  const SleepCoachingStartPage({super.key});

  @override
  State<SleepCoachingStartPage> createState() => _SleepCoachingStartPageState();
}

class _SleepCoachingStartPageState extends State<SleepCoachingStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnimalTypesCard(),
            const SizedBox(height: 24),
            _buildInformationSection(),
            const SizedBox(height: 32),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalTypesCard() {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAnimalIcon('🦔', '고슴도치'),
          _buildAnimalIcon('🐧', '펭귄'),
          _buildAnimalIcon('🦁', '사자'),
        ],
      ),
    );
  }

  Widget _buildAnimalIcon(String emoji, String label) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey[300]!, width: 2),
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildInformationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '수면 코칭 프로그램 안내',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
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
              _buildInfoParagraph(
                '내 수면 유형을 확인하고 적절한 수면 코칭을 받아보세요. 최근 30일 중 7일 동안 수면을 기록해야 하며, 평일 전날 밤과 휴일 전날 밤을 각각 하루 이상 포함해야 합니다. 수면 데이터는 워치나 밴드 또는 링을 착용하고 잠을 자면 자동으로 기록됩니다.',
              ),
              const SizedBox(height: 16),
              _buildInfoParagraph(
                '수면을 개선할 필요가 있는 사람들에게 맞춤형 수면 코칭을 제공합니다. 수면 코칭은 3-4주 진행되며 수면의 질을 높이는 건강한 습관을 기를 수 있도록 도와줍니다.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoParagraph(String text) {
    return Text(
      text,
      style: GoogleFonts.notoSans(
        fontSize: 14,
        color: Colors.black87,
        height: 1.6,
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          // 다음 단계로 이동하는 로직
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '수면 코칭을 시작합니다!',
                style: GoogleFonts.notoSans(),
              ),
              backgroundColor: Colors.blue,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          '다음',
          style: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
