import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // 사용자 정보
  final Map<String, dynamic> userInfo = {
    'name': '조안기',
    'level': 20,
    'levelTitle': '탐험가',
    'currentXP': 305,
    'maxXP': 1600,
    'friends': 667,
    'profileImage': 'profile_placeholder',
  };

  // 주별 분석 데이터
  final List<Map<String, dynamic>> weeklyAnalysis = [
    {
      'title': '평균 에너지 점수',
      'current': '75',
      'previous': '이전 주 76',
      'change': -1,
      'changeText': '▼1',
      'isPositive': false,
    },
    {
      'title': '평균 수면 시간',
      'current': '6시간 48분',
      'previous': '이전 주 5시간 56분',
      'change': 51,
      'changeText': '▲51분',
      'isPositive': true,
    },
    {
      'title': '총 운동 시간',
      'current': '04:47:36',
      'previous': '이전 주 01:35:23',
      'change': 11532, // 초 단위
      'changeText': '▲03:12:12',
      'isPositive': true,
    },
    {
      'title': '평균 일일 걸음 수',
      'current': '11,859',
      'previous': '이전 주 8,739',
      'change': 3120,
      'changeText': '▲3,120',
      'isPositive': true,
    },
  ];

  // 배지 데이터
  final List<Map<String, dynamic>> badges = [
    {
      'name': '에너지 점수 매우 좋음',
      'date': '오늘',
      'color': Colors.amber,
      'icon': Icons.local_fire_department,
    },
    {
      'name': '첫 래프팅 운동',
      'date': '8월 23일',
      'color': Colors.grey[800]!,
      'icon': Icons.water,
    },
  ];

  // 개인 최고기록
  final List<Map<String, dynamic>> personalBests = [
    {
      'title': '최장 거리',
      'value': '22.28 km',
      'icon': Icons.flag,
      'color': Colors.amber,
    },
    {
      'title': '하프 마라톤 최고 기록',
      'value': '2:24:03',
      'icon': Icons.track_changes,
      'color': Colors.amber,
    },
  ];

  // 도전 데이터
  final List<Map<String, dynamic>> challenges = [
    {
      'type': '개인',
      'wins': 0,
      'total': 1,
      'icon': Icons.person,
      'color': Colors.blue,
    },
    {
      'type': '팀',
      'wins': 1,
      'total': 3,
      'icon': Icons.group,
      'color': Colors.green,
    },
  ];

  // 글로벌 도전
  final List<Map<String, dynamic>> globalChallenges = [
    {
      'name': '정글',
      'theme': 'jungle',
      'stars': 5,
      'color': Colors.green,
    },
    {
      'name': '스노우',
      'theme': 'snow',
      'stars': 5,
      'color': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더
              _buildHeader(),
              
              const SizedBox(height: 24),
              
              // 사용자 프로필
              _buildUserProfile(),
              
              const SizedBox(height: 24),
              
              // 헬스 데이터 공유
              _buildHealthDataSharing(),
              
              const SizedBox(height: 24),
              
              // 주별 분석
              _buildWeeklyAnalysis(),
              
              const SizedBox(height: 24),
              
              // 배지
              _buildBadgesSection(),
              
              const SizedBox(height: 24),
              
              // 개인 최고기록
              _buildPersonalBests(),
              
              const SizedBox(height: 24),
              
              // 도전
              _buildChallengesSection(),
              
              const SizedBox(height: 24),
              
              // 글로벌 도전
              _buildGlobalChallenges(),
              
              const SizedBox(height: 80), // 하단 네비게이션 바 공간
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          '내 페이지',
          style: GoogleFonts.notoSans(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '편집',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('내 페이지 메뉴')),
            );
          },
          icon: const Icon(Icons.more_vert, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildUserProfile() {
    return Center(
      child: Column(
        children: [
          // 프로필 사진
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              // 인증 배지
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // 이름
          Text(
            userInfo['name'],
            style: GoogleFonts.notoSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // 레벨 정보
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${userInfo['levelTitle']} 레벨${userInfo['level']}',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${userInfo['currentXP']}/${userInfo['maxXP']} XP',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
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
          
          const SizedBox(height: 12),
          
          // XP 진행률
          Container(
            width: double.infinity,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: userInfo['currentXP'] / userInfo['maxXP'],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 버튼들
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileButton('친구 ${userInfo['friends']}명'),
              const SizedBox(width: 12),
              _buildProfileButton('내 QR 코드'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        text,
        style: GoogleFonts.notoSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildHealthDataSharing() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('헬스 데이터 공유')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
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
                  '헬스 데이터 공유',
                  style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              ],
            ),
            const SizedBox(height: 8),
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
    );
  }

  Widget _buildWeeklyAnalysis() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
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
            '주별 분석',
            style: GoogleFonts.notoSans(
              fontSize: 18,
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: weeklyAnalysis.length,
            itemBuilder: (context, index) {
              final analysis = weeklyAnalysis[index];
              return _buildAnalysisCard(analysis);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisCard(Map<String, dynamic> analysis) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            analysis['title'],
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            analysis['previous'],
            style: GoogleFonts.notoSans(
              fontSize: 10,
              color: Colors.grey[500],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                analysis['current'],
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: analysis['isPositive'] ? Colors.green[100] : Colors.red[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  analysis['changeText'],
                  style: GoogleFonts.notoSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: analysis['isPositive'] ? Colors.green[700] : Colors.red[700],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('배지 더보기')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
                  boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
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
                  '배지',
                  style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: badges.map((badge) => Expanded(
                child: _buildBadgeCard(badge),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeCard(Map<String, dynamic> badge) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: badge['color'],
              shape: BoxShape.circle,
            ),
            child: Icon(
              badge['icon'],
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            badge['name'],
            style: GoogleFonts.notoSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            badge['date'],
            style: GoogleFonts.notoSans(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalBests() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('개인 최고기록 더보기')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
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
                  '개인 최고기록',
                  style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: personalBests.map((record) => Expanded(
                child: _buildPersonalBestCard(record),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalBestCard(Map<String, dynamic> record) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: record['color'],
              shape: BoxShape.circle,
            ),
            child: Icon(
              record['icon'],
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            record['value'],
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            record['title'],
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildChallengesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
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
            '도전',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: challenges.map((challenge) => Expanded(
              child: _buildChallengeCard(challenge),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(Map<String, dynamic> challenge) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: challenge['color'],
              shape: BoxShape.circle,
            ),
            child: Icon(
              challenge['icon'],
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${challenge['wins']}승리',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '도전 ${challenge['total']}개',
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalChallenges() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('글로벌 도전 더보기')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
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
                  '글로벌 도전',
                  style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: globalChallenges.map((challenge) => Expanded(
                child: _buildGlobalChallengeCard(challenge),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlobalChallengeCard(Map<String, dynamic> challenge) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: challenge['color'],
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    challenge['theme'] == 'jungle' ? Icons.forest : Icons.ac_unit,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      challenge['stars'],
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            challenge['name'],
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
