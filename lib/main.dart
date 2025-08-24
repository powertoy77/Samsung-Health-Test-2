import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  
  // MethodChannel for Samsung Health check
  static const MethodChannel _channel = MethodChannel('samsung_health_check');
  
  @override
  void initState() {
    super.initState();
  }
  

  
                Future<void> _connectHealthStore() async {
                try {
                  await _channel.invokeMethod('connectHealthStore');
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('HealthStore 연결 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              }

              Future<void> _disconnectHealthStore() async {
                try {
                  await _channel.invokeMethod('disconnectHealthStore');
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('HealthStore 연결 해제 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              }

              Future<bool> _isHealthStoreConnected() async {
                try {
                  final result = await _channel.invokeMethod('isHealthStoreConnected');
                  return result as bool;
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('HealthStore 상태 확인 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return false;
                }
              }

              // 권한 요청 메서드들
              Future<void> _requestStepCountPermission() async {
                try {
                  await _channel.invokeMethod('requestStepCountPermission');
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('걸음수 권한 요청 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              }

              Future<void> _requestSleepPermission() async {
                try {
                  await _channel.invokeMethod('requestSleepPermission');
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('수면 권한 요청 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              }

              Future<void> _requestHeartRatePermission() async {
                try {
                  await _channel.invokeMethod('requestHeartRatePermission');
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('심박수 권한 요청 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              }

              Future<void> _requestWeightPermission() async {
                try {
                  await _channel.invokeMethod('requestWeightPermission');
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('체중 권한 요청 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              }

              // 새로운 권한 관리 메서드들
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

              Future<bool> _hasAllPermissions() async {
                try {
                  final result = await _channel.invokeMethod('hasAllPermissions');
                  return result as bool;
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('권한 상태 확인 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return false;
                }
              }

              Future<bool> _hasStepCountPermission() async {
                try {
                  final result = await _channel.invokeMethod('hasStepCountPermission');
                  return result as bool;
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('걸음수 권한 상태 확인 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return false;
                }
              }

              Future<bool> _hasSleepPermission() async {
                try {
                  final result = await _channel.invokeMethod('hasSleepPermission');
                  return result as bool;
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('수면 권한 상태 확인 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return false;
                }
              }

              Future<bool> _hasWeightPermission() async {
                try {
                  final result = await _channel.invokeMethod('hasWeightPermission');
                  return result as bool;
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('체중 권한 상태 확인 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return false;
                }
              }



              // 데이터 읽기 메서드들
              Future<List<Map<String, dynamic>>> _readStepCount(DateTime startTime, DateTime endTime) async {
                try {
                  final result = await _channel.invokeMethod('readStepCount', {
                    'startTime': startTime.millisecondsSinceEpoch,
                    'endTime': endTime.millisecondsSinceEpoch,
                  });
                  return List<Map<String, dynamic>>.from(result);
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('걸음수 데이터 읽기 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return [];
                }
              }

              Future<List<Map<String, dynamic>>> _readSleepData(DateTime startTime, DateTime endTime) async {
                try {
                  final result = await _channel.invokeMethod('readSleepData', {
                    'startTime': startTime.millisecondsSinceEpoch,
                    'endTime': endTime.millisecondsSinceEpoch,
                  });
                  return List<Map<String, dynamic>>.from(result);
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('수면 데이터 읽기 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return [];
                }
              }

              Future<List<Map<String, dynamic>>> _readHeartRate(DateTime startTime, DateTime endTime) async {
                try {
                  final result = await _channel.invokeMethod('readHeartRate', {
                    'startTime': startTime.millisecondsSinceEpoch,
                    'endTime': endTime.millisecondsSinceEpoch,
                  });
                  return List<Map<String, dynamic>>.from(result);
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('심박수 데이터 읽기 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return [];
                }
              }

              // 데이터 쓰기 메서드들
              Future<void> _writeWeight(double weight) async {
                try {
                  await _channel.invokeMethod('writeWeight', {
                    'weight': weight,
                    'timestamp': DateTime.now().millisecondsSinceEpoch,
                  });
                } on PlatformException catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('체중 데이터 쓰기 중 오류: ${e.message}'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
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
        return _buildTogetherPage();
      case 2:
        return _buildDiscoverPage();
      case 3:
        return _buildFitnessPage();
      case 4:
        return _buildMyPage();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildTogetherPage() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더 섹션
              _buildTogetherHeader(),
              const SizedBox(height: 24),
              
              // 걸음 순위판 섹션
              _buildStepLeaderboard(),
              const SizedBox(height: 24),
              
              // 챌린지 카드들
              _buildChallengeCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTogetherHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '투게더',
          style: GoogleFonts.notoSans(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        
        // 사용자 프로필 섹션
        Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '탐험가',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Lv. 20',
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '친구',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '669',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // 도전 만들기 버튼
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              '도전 만들기',
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepLeaderboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '걸음 순위판',
          style: GoogleFonts.notoSans(
            fontSize: 18,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLeaderboardItem(
                rank: 1,
                name: '나',
                profileColor: Colors.blue[100]!,
                barHeight: 120,
                isMe: true,
              ),
              _buildLeaderboardItem(
                rank: 2,
                name: '하진옥',
                profileColor: Colors.pink[100]!,
                barHeight: 80,
                isMe: false,
              ),
              _buildLeaderboardItem(
                rank: 3,
                name: 'seungwok.han.in',
                profileColor: Colors.amber[100]!,
                barHeight: 60,
                isMe: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardItem({
    required int rank,
    required String name,
    required Color profileColor,
    required double barHeight,
    required bool isMe,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: barHeight,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: profileColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person,
            color: profileColor.withOpacity(0.7),
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          '$rank',
          style: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildChallengeCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildChallengeCard(
          title: '달리기 9그룹 텀블러 가즈아',
          status: '7월 20일에 종료됨',
          result: '우리 팀 승리!',
          icon: Icons.emoji_events,
          iconColor: Colors.amber,
          canDismiss: true,
        ),
        const SizedBox(height: 12),
        _buildChallengeCard(
          title: '삼성 헬스 X 펫박스 걷기 챌린지',
          status: '총 걸음 수: 110,932',
          result: '내 순위: 51,834',
          icon: Icons.pets,
          iconColor: Colors.brown,
          canDismiss: true,
        ),
        const SizedBox(height: 12),
        _buildChallengeCard(
          title: '2025 올림픽 데이 챌린지',
          status: '도전 결과를 기다리는 중...',
          result: '총 걸음 수: 345,401',
          icon: Icons.sports_soccer,
          iconColor: Colors.blue,
          canDismiss: false,
          showProgress: true,
        ),
      ],
    );
  }

  Widget _buildChallengeCard({
    required String title,
    required String status,
    required String result,
    required IconData icon,
    required Color iconColor,
    required bool canDismiss,
    bool showProgress = false,
  }) {
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
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      status,
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              if (canDismiss)
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            result,
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
          ),
          if (showProgress) ...[
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDiscoverPage() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더 섹션
              _buildDiscoverHeader(),
              const SizedBox(height: 24),
              
              // Health Hub 온보딩 카드
              _buildHealthHubOnboardingCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiscoverHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHealthHubOnboardingCard() {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.teal[300]!,
            Colors.blue[400]!,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 연결선들
          _buildConnectionLines(),
          
          // 아이콘들과 라벨들
          _buildHealthHubIcons(),
          
          // 메인 텍스트
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Health Hub onboarding',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Health Hub 서비스와 연동해보세요.',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionLines() {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: ConnectionLinesPainter(),
    );
  }

  Widget _buildHealthHubIcons() {
    return Stack(
      children: [
        // 상단 왼쪽 - Health Hub Platform
        Positioned(
          top: 40,
          left: 20,
          child: _buildIconWithLabel(
            Icons.favorite,
            'Health Hub Platform',
            'Health Hub 제공',
            Colors.red,
          ),
        ),
        
        // 상단 중앙 - Sleep
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Center(
            child: _buildIconWithLabel(
              Icons.bedtime,
              'Sleep',
              '',
              Colors.white,
            ),
          ),
        ),
        
        // 상단 오른쪽 - Health Record
        Positioned(
          top: 40,
          right: 20,
          child: _buildIconWithLabel(
            Icons.medical_services,
            'Health Record',
            '',
            Colors.white,
          ),
        ),
        
        // 하단 왼쪽 - Data
        Positioned(
          bottom: 120,
          left: 20,
          child: _buildIconWithLabel(
            Icons.people,
            'Data',
            '',
            Colors.white,
          ),
        ),
        
        // 하단 중앙 - HEALTH HUB 스마트폰
        Positioned(
          bottom: 120,
          left: 0,
          right: 0,
          child: Center(
            child: _buildSmartphoneIcon(),
          ),
        ),
        
        // 하단 오른쪽 - 의료진
        Positioned(
          bottom: 120,
          right: 20,
          child: _buildIconWithLabel(
            Icons.medical_services,
            '',
            '',
            Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithLabel(IconData icon, String title, String subtitle, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        if (title.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.notoSans(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
        if (subtitle.isNotEmpty) ...[
          Text(
            subtitle,
            style: GoogleFonts.notoSans(
              fontSize: 8,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Widget _buildSmartphoneIcon() {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          'HEALTH\nHUB',
          style: GoogleFonts.notoSans(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
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

class AllWorkoutsPage extends StatefulWidget {
  const AllWorkoutsPage({super.key});

  @override
  State<AllWorkoutsPage> createState() => _AllWorkoutsPageState();
}

class _AllWorkoutsPageState extends State<AllWorkoutsPage> {
  String selectedDate = '8/24';

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
          '모든 운동',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.show_chart, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildDateSelector(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildCurrentWeekSection(),
                  const SizedBox(height: 16),
                  _buildWeekSection('8월 17일 ~ 23일', '4:47:26', '1,244 kcal', true),
                  const SizedBox(height: 16),
                  _buildWeekSection('8월 10일 ~ 16일', '1:35:21', '684 kcal', true),
                  const SizedBox(height: 16),
                  _buildWeekSection('8월 3일 ~ 9일', '1:42:37', '599 kcal', true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildDateItem('일', '21', false),
            _buildDateItem('월', '22', false),
            _buildDateItem('화', '23', false),
            _buildDateItem('수', '24', true), // selected
            _buildDateItem('목', '19', false),
            _buildDateItem('금', '20', false),
            _buildDateItem('토', '21', false),
          ],
        ),
      ),
    );
  }

  Widget _buildDateItem(String day, String date, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Text(
            day,
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: isSelected ? Colors.blue : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                date,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentWeekSection() {
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
                '이번 주',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(8월 24일)',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '00:00',
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '더 이상 기록되는 운동이 없습니다',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekSection(String weekTitle, String totalTime, String totalCalories, bool showTrend) {
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
                weekTitle,
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Text(
                totalTime,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                totalCalories,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              if (showTrend) ...[
                const SizedBox(width: 4),
                const Icon(Icons.trending_up, size: 16, color: Colors.green),
              ],
            ],
          ),
          const SizedBox(height: 16),
          ..._buildWeekActivities(weekTitle),
        ],
      ),
    );
  }

  List<Widget> _buildWeekActivities(String weekTitle) {
    if (weekTitle == '8월 17일 ~ 23일') {
      return [
        _buildDaySection('8월 23일 (금)', '1:29:22', '545 kcal', [
          _buildActivityItem('걷기(자동)', '10:47', '0.48 km', '오후 5:55', Icons.directions_walk),
          _buildActivityItem('리프팅', '1:18:35', '', '오전 10:11', Icons.fitness_center),
        ]),
        _buildDaySection('8월 22일 (목)', '18:02', '115 kcal', [
          _buildActivityItem('기타 운동(자동)', '18:02', '', '오전 7:45', Icons.sports_gymnastics),
        ]),
        _buildDaySection('8월 21일 (수)', '24:17', '167 kcal', [
          _buildActivityItem('걷기(자동)', '11:10', '0.81 km', '오후 7:14', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '13:07', '0.96 km', '오전 9:54', Icons.directions_walk),
        ]),
        _buildDaySection('8월 20일 (화)', '47:06', '285 kcal', [
          _buildActivityItem('걷기(자동)', '12:14', '0.71 km', '오후 10:21', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '10:49', '0.73 km', '오후 8:19', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '11:59', '0.70 km', '오후 1:02', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '11:36', '0.70 km', '오전 11:46', Icons.directions_walk),
          _buildActivityItem('Arashi Beach Pilates Basics', '00:28', '', '오전 11:31', Icons.sports_gymnastics),
        ]),
        _buildDaySection('8월 19일 (월)', '49:23', '253 kcal', [
          _buildActivityItem('본 수영', '37:43', '425 m', '오전 11:01', Icons.pool),
          _buildActivityItem('걷기(자동)', '11:40', '0.60 km', '오전 11:58', Icons.directions_walk),
        ]),
        _buildDaySection('8월 18일 (일)', '27:39', '123 kcal', [
          _buildActivityItem('걷기(자동)', '10:55', '0.94 km', '오후 12:49', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '16:46', '1.18 km', '오전 11:47', Icons.directions_walk),
        ]),
        _buildDaySection('8월 17일 (토)', '31:37', '205 kcal', [
          _buildActivityItem('걷기(자동)', '17:35', '0.69 km', '오후 2:35', Icons.directions_walk),
          _buildActivityItem('실외 자전거(자동)', '09:38', '', '오전 8:17', Icons.directions_bike),
          _buildActivityItem('걷기(자동)', '10:26', '0.58 km', '오전 8:01', Icons.directions_walk),
        ]),
      ];
    } else if (weekTitle == '8월 10일 ~ 16일') {
      return [
        _buildDaySection('8월 15일 (금)', '24:06', '263 kcal', [
          _buildActivityItem('본 수영(자동)', '15:46', '', '오후 5:26', Icons.pool),
          _buildActivityItem('본 수영(자동)', '08:20', '', '오전 11:59', Icons.pool),
        ]),
        _buildDaySection('8월 12일 (화)', '22:06', '129 kcal', [
          _buildActivityItem('걷기(자동)', '10:16', '0.65 km', '오후 6:20', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '11:50', '0.62 km', '오후 12:10', Icons.directions_walk),
        ]),
        _buildDaySection('8월 11일 (월)', '24:34', '143 kcal', [
          _buildActivityItem('걷기(자동)', '20:51', '1.65 km', '오후 12:10', Icons.directions_walk),
        ]),
        _buildDaySection('8월 10일 (일)', '24:35', '144 kcal', [
          _buildActivityItem('걷기(자동)', '12:08', '0.75 km', '오후 6:11', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '12:27', '0.74 km', '오후 5:35', Icons.directions_walk),
        ]),
      ];
    } else if (weekTitle == '8월 3일 ~ 9일') {
      return [
        _buildDaySection('8월 9일 (토)', '2:06:25', '273 kcal', [
          _buildActivityItem('걷기(자동)', '11:28', '0.67 km', '오후 5:16', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '15:51', '0.77 km', '오후 1:48', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '21:26', '1.29 km', '오전 11:49', Icons.directions_walk),
        ]),
        _buildDaySection('8월 8일 (금)', '13:32', '74 kcal', [
          _buildActivityItem('걷기(자동)', '13:32', '0.78 km', '오후 12:37', Icons.directions_walk),
        ]),
        _buildDaySection('8월 6일 (수)', '31:49', '150 kcal', [
          _buildActivityItem('걷기(자동)', '10:40', '0.59 km', '오후 7:38', Icons.directions_walk),
          _buildActivityItem('걷기(자동)', '21:09', '1.37 km', '오후 12:16', Icons.directions_walk),
        ]),
        _buildDaySection('8월 4일 (월)', '10:31', '72 kcal', [
          _buildActivityItem('걷기(자동)', '10:31', '0.70 km', '오후 6:57', Icons.directions_walk),
        ]),
      ];
    }
    return [];
  }

  Widget _buildDaySection(String date, String totalTime, String totalCalories, List<Widget> activities) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                date,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Text(
                totalTime,
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                totalCalories,
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...activities,
        ],
      ),
    );
  }

  Widget _buildActivityItem(String activityName, String duration, String distance, String time, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: Colors.blue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activityName,
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                if (distance.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    distance,
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                duration,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                time,
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
}

class StepsDetailPage extends StatefulWidget {
  const StepsDetailPage({super.key});

  @override
  State<StepsDetailPage> createState() => _StepsDetailPageState();
}

class _StepsDetailPageState extends State<StepsDetailPage> {
  String selectedDate = '8/24';

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
          '걸음 수',
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
            icon: const Icon(Icons.signal_cellular_4_bar, color: Colors.black),
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
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildMainStepsCard(),
            const SizedBox(height: 16),
            _buildHourlyStepsChart(),
            const SizedBox(height: 16),
            _buildStepsComparisonCard(),
            const SizedBox(height: 16),
            _buildBadgesCard(),
            const SizedBox(height: 16),
            _buildRelatedContent(),
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
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildDateItem('18', false),
                  _buildDateItem('19', false),
                  _buildDateItem('20', false),
                  _buildDateItem('21', false),
                  _buildDateItem('22', false),
                  _buildDateItem('23', false),
                  _buildDateItem('8/24', true), // selected
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '6,000',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(String date, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
              border: isSelected ? Border.all(color: Colors.grey[300]!, width: 1) : null,
            ),
            child: Column(
              children: [
                Text(
                  date,
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.grey[600],
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(height: 2),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainStepsCard() {
    return Container(
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
          Row(
            children: [
              Text(
                '2,073',
                style: GoogleFonts.notoSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '걸음',
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearPercentIndicator(
            width: double.infinity,
            lineHeight: 12,
            percent: 2073 / 6000,
            backgroundColor: Colors.grey[300]!,
            progressColor: Colors.green,
            barRadius: const Radius.circular(6),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '목표: 6,000',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricItem('1.63 km', '거리'),
              _buildMetricItem('83 kcal', '칼로리'),
              _buildMetricItem('0층', '층수'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
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

  Widget _buildHourlyStepsChart() {
    return Container(
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
          Text(
            '시간별 걸음 수',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildHourlyBar(20, '오전 12'),
                _buildHourlyBar(10, '오전 6'),
                _buildHourlyBar(80, '오후 12'),
                _buildHourlyBar(40, '오후 6'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              '(시)',
              style: GoogleFonts.notoSans(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyBar(double height, String time) {
    return Column(
      children: [
        Container(
          width: 30,
          height: height,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          time,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildStepsComparisonCard() {
    return Container(
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
          Text(
            '걸음 수 비교',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '평균 10,833',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '상위 8%',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          _buildComparisonBar('나', 0.35, Colors.green),
          const SizedBox(height: 12),
          _buildComparisonBar('40-49', 0.25, Colors.grey[400]!),
          const SizedBox(height: 12),
          _buildComparisonBar('전체', 0.20, Colors.grey[400]!),
        ],
      ),
    );
  }

  Widget _buildComparisonBar(String label, double percent, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: LinearPercentIndicator(
            width: double.infinity,
            lineHeight: 8,
            percent: percent,
            backgroundColor: Colors.grey[200]!,
            progressColor: color,
            barRadius: const Radius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildBadgesCard() {
    return Container(
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
          Text(
            '배지 현황',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '7일째 목표를 달성했어요. 잘하고 있어요!',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(10, (index) {
                    bool isAchieved = index < 7;
                    return Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isAchieved ? Colors.yellow : Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isAchieved
                            ? const Icon(Icons.check, color: Colors.white, size: 16)
                            : Text(
                                '${index + 1}',
                                style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.directions_walk,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '연관 콘텐츠',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildContentCard('Prelude', 'CALM', 'assets/mountain.jpg'),
              _buildContentCard('Veering', 'CALM', 'assets/coastline.jpg'),
              _buildContentCard('군살을 빼자. 라인을 살리...', 'Skimble', 'assets/running.jpg'),
              _buildContentCard('초보기', '스트리', 'assets/yoga.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(String title, String subtitle, String imagePath) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
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
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.image,
                size: 40,
                color: Colors.grey[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
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
    );
  }
}

  Widget _buildFitnessPage() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // 헤더
            _buildFitnessHeader(),
            // 메인 콘텐츠
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // IFIT Workouts 섹션
                    _buildWorkoutSection(
                      'IFIT Workouts',
                      [
                        _buildWorkoutCard('Yoga', 'iFIT>', 'assets/yoga.jpg', Colors.orange),
                        _buildWorkoutCard('Pilates', 'iFIT>', 'assets/pilates.jpg', Colors.purple),
                        _buildWorkoutCard('HIIT', 'iFIT>', 'assets/hiit.jpg', Colors.red),
                      ],
                    ),
                    
                    // Aruba Pilates Sculpting Series 섹션
                    _buildWorkoutSection(
                      'Aruba Pilates Sculpting Series',
                      [
                        _buildWorkoutCard('Arashi Beach Pilates Basics', '35:41 iFIT', 'assets/arashi.jpg', Colors.blue),
                        _buildWorkoutCard('Mangel H', '35:41 iFIT', 'assets/mangel.jpg', Colors.green),
                      ],
                    ),
                    
                    // Worldwide Wellness Workouts 섹션
                    _buildWorkoutSection(
                      'Worldwide Wellness Workouts',
                      [
                        _buildWorkoutCard('HIIT Yoga Flow: Oahu', '34:33 iFIT', 'assets/oahu.jpg', Colors.teal),
                        _buildWorkoutCard('Controlle', '20:56 iFIT', 'assets/controlle.jpg', Colors.indigo),
                      ],
                    ),
                    
                    // What's new 섹션
                    _buildWorkoutSection(
                      'What\'s new',
                      [
                        _buildWorkoutCard('Crossfit\'s Best Muscle Strength', '13:29 LILLIUS', 'assets/crossfit.jpg', Colors.pink, hasPlayButton: true),
                        _buildWorkoutCard('Ballet Burn for Full-Bod...', '11:41 QUAT', 'assets/ballet.jpg', Colors.amber, hasPlayButton: true),
                        _buildWorkoutCard('Making A Pretty Up', '13:26 LILLIUS', 'assets/upper_body.jpg', Colors.lightGreen, hasPlayButton: true),
                      ],
                    ),
                    
                    // Essential Training Tips 섹션
                    _buildWorkoutSection(
                      'Essential Training Tips for healthy running',
                      [
                        _buildWorkoutCard('Pre-Run Stretching', '09:16 Samsung Health', 'assets/stretching.jpg', Colors.blue, hasPlayButton: true),
                        _buildWorkoutCard('Post-Run Stretching', '09:16 Samsung Health', 'assets/post_stretching.jpg', Colors.blue, hasPlayButton: true),
                        _buildWorkoutCard('Core Strength Workout', '09:25 Samsung He', 'assets/core.jpg', Colors.blue, hasPlayButton: true),
                      ],
                    ),
                    
                    // Lose weight 섹션
                    _buildWorkoutSection(
                      'Lose weight the fun way, and start moving!',
                      [
                        _buildWorkoutCard('Shake the Day Off Mini-Class', '31:49 Zumba', 'assets/zumba.jpg', Colors.orange, hasPlayButton: true),
                        _buildWorkoutCard('Get Hype', '30:48 Zumba', 'assets/get_hype.jpg', Colors.orange, hasPlayButton: true),
                      ],
                    ),
                    
                    // Core strength 섹션
                    _buildWorkoutSection(
                      'Workout to boost your core strength!',
                      [
                        _buildWorkoutCard('Perfect core workout', '08:22 Pocket Gym', 'assets/perfect_core.jpg', Colors.green, hasPlayButton: true),
                        _buildWorkoutCard('Core wor', '08:28 Pocket', 'assets/core_work.jpg', Colors.green, hasPlayButton: true),
                      ],
                    ),
                    
                    // Sports Stars 섹션
                    _buildWorkoutSection(
                      'Workout Know-hows from Sports Stars',
                      [
                        _buildWorkoutCard('Crossfit\'s Best Muscle Stren...', '13:29 LILLIUS', 'assets/crossfit_stars.jpg', Colors.pink, hasPlayButton: true),
                        _buildWorkoutCard('Making A', '15:26 LILLIUS', 'assets/making_a.jpg', Colors.lightGreen, hasPlayButton: true),
                      ],
                    ),
                    
                    // Home Gym 섹션
                    _buildWorkoutSection(
                      'Your Home, Your Gym – Train Like a Pro',
                      [
                        _buildWorkoutCard('Ballet Burn for Full-Body Bal...', '11:41 QUAT', 'assets/ballet_burn.jpg', Colors.amber, hasPlayButton: true),
                        _buildWorkoutCard('Baroboar', '15:58 QUAT', 'assets/baroboar.jpg', Colors.amber, hasPlayButton: true),
                      ],
                    ),
                    
                    // At-home workouts 섹션
                    _buildWorkoutSection(
                      'The perfect at-home workouts',
                      [
                        _buildWorkoutCard('6 SQUAT VARIATIONS', '10:24 Pocket Gym', 'assets/squat.jpg', Colors.green, hasPlayButton: true),
                        _buildWorkoutCard('10Min Fu', '10:26 Pocket', 'assets/10min_fu.jpg', Colors.green, hasPlayButton: true),
                      ],
                    ),
                    
                    // New fitness routine 섹션
                    _buildWorkoutSection(
                      'Start your new fitness routine today',
                      [
                        _buildWorkoutCard('Healthy Body Yoga', '14:10 FitOn', 'assets/healthy_yoga.jpg', Colors.purple, hasPlayButton: true),
                        _buildWorkoutCard('Athletic', '14:10 FitOn', 'assets/athletic.jpg', Colors.purple, hasPlayButton: true),
                      ],
                    ),
                    
                    // Home workouts fun 섹션
                    _buildWorkoutSection(
                      'Home workouts? Keep it fun and exciting!',
                      [
                        _buildWorkoutCard('300 Squats Challenge! You c...', '17:58 BLESSLIFE', 'assets/300_squats.jpg', Colors.red, hasPlayButton: true),
                        _buildWorkoutCard('12MIN "B', '12:17 BLESS', 'assets/12min_b.jpg', Colors.red, hasPlayButton: true),
                      ],
                    ),
                    
                    // Fitness Programs 섹션
                    _buildFitnessProgramsSection(),
                    
                    // Partner Services 섹션
                    _buildPartnerServicesSection(),
                    
                    // By Provider 섹션
                    _buildByProviderSection(),
                    
                    const SizedBox(height: 100), // 하단 네비게이션 바 공간
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFitnessHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '피트니스',
              style: GoogleFonts.notoSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.notoSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: cards[index],
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildWorkoutCard(String title, String subtitle, String imagePath, Color color, {bool hasPlayButton = false}) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.fitness_center,
                    size: 40,
                    color: color,
                  ),
                ),
              ),
              if (hasPlayButton)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
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
    );
  }

  Widget _buildFitnessProgramsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fitness Programs',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildProgramCard('Weight loss', Icons.monitor_weight, Colors.orange),
            _buildProgramCard('Build muscle', Icons.fitness_center, Colors.blue),
            _buildProgramCard('Endurance training', Icons.directions_run, Colors.green),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProgramCard(String title, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 40,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPartnerServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Partner Services',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildServiceCard('Refresh Your Body and Mi...', Icons.refresh, Colors.purple),
            _buildServiceCard('Get happy + Healthy with Z...', Icons.music_note, Colors.orange),
            _buildServiceCard('Healthy li hand, Poc', Icons.group, Colors.green),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildServiceCard(String title, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 40,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: GoogleFonts.notoSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildByProviderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'By Provider',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildProviderCard('iFIT>', Colors.blue),
            _buildProviderCard('ZUMBA', Colors.green),
            _buildProviderCard('FitOn', Colors.purple),
            _buildProviderCard('Pocket Gym', Colors.orange),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProviderCard(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              name,
              style: GoogleFonts.notoSans(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMyPage() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더
              _buildMyPageHeader(),
              const SizedBox(height: 24),
              
              // 프로필 섹션
              _buildProfileSection(),
              const SizedBox(height: 24),
              
              // 헬스 데이터 공유 섹션
              _buildHealthDataSharingCard(),
              const SizedBox(height: 16),
              
              // 주별 분석 섹션
              _buildWeeklyAnalysisCard(),
              const SizedBox(height: 16),
              
              // 배지 섹션
              _buildBadgesCard(),
              const SizedBox(height: 16),
              
              // 개인 최고기록 섹션
              _buildPersonalBestCard(),
              const SizedBox(height: 16),
              
              // 도전 섹션
              _buildChallengesCard(),
              const SizedBox(height: 16),
              
              // 글로벌 도전 섹션
              _buildGlobalChallengesCard(),
              
              const SizedBox(height: 100), // 하단 네비게이션 바 공간
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyPageHeader() {
    return Row(
      children: [
        Text(
          '내 페이지',
          style: GoogleFonts.notoSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.grey),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // 프로필 이미지
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              size: 40,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          
          // 사용자 이름과 편집 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '조안기',
                style: GoogleFonts.notoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  '편집',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // 레벨 정보
          Text(
            '탐험가 레벨20',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          
          // XP 진행률
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '305/1,600 XP',
                          style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: 305 / 1600,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // 친구와 QR 코드 버튼
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '친구 667명',
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '내 QR 코드',
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthDataSharingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '헬스 데이터 공유',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '저장된 헬스 데이터를 가족이나 친구와 안전하게 공유하세요.',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildWeeklyAnalysisCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '주별 분석',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '8월 17일 - 23일',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          
          // 메트릭들
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  '평균 에너지 점수',
                  '75',
                  '이전 주 76',
                  '▼1',
                  Colors.red,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricItem(
                  '평균 수면 시간',
                  '6시간 48분',
                  '이전 주 5시간 56분',
                  '▲51분',
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  '총 운동 시간',
                  '04:47:36',
                  '이전 주 01:35:23',
                  '▲03:12:12',
                  Colors.green,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricItem(
                  '평균 일일 걸음 수',
                  '11,859',
                  '이전 주 8,739',
                  '▲3,120',
                  Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String title, String current, String previous, String change, Color changeColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          current,
          style: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          previous,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          change,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: changeColor,
          ),
        ),
      ],
    );
  }

  Widget _buildBadgesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '배지',
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPersonalBestCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '개인 최고기록',
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildChallengesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '도전',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildChallengeType('0승리', '도전 1개', Icons.person),
              _buildChallengeType('1승리', '도전 3개', Icons.group),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeType(String wins, String challenges, IconData icon) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          wins,
          style: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          challenges,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildGlobalChallengesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '글로벌 도전',
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

class ConnectionLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // 상단 중앙에서 하단 중앙으로 연결
    canvas.drawLine(
      Offset(size.width / 2, 80),
      Offset(size.width / 2, size.height - 160),
      paint,
    );

    // 상단 왼쪽에서 하단 왼쪽으로 연결
    canvas.drawLine(
      Offset(40, 80),
      Offset(40, size.height - 160),
      paint,
    );

    // 상단 오른쪽에서 하단 오른쪽으로 연결
    canvas.drawLine(
      Offset(size.width - 40, 80),
      Offset(size.width - 40, size.height - 160),
      paint,
    );

    // 가로 연결선들
    canvas.drawLine(
      Offset(40, 80),
      Offset(size.width - 40, 80),
      paint,
    );

    canvas.drawLine(
      Offset(40, size.height - 160),
      Offset(size.width - 40, size.height - 160),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
