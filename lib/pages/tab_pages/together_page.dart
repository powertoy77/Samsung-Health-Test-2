import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TogetherPage extends StatefulWidget {
  const TogetherPage({super.key});

  @override
  State<TogetherPage> createState() => _TogetherPageState();
}

class _TogetherPageState extends State<TogetherPage> {
  // 사용자 데이터
  final Map<String, dynamic> userData = {
    'name': '탐험가',
    'level': 20,
    'friends': 669,
    'profileImage': 'assets/images/profile.jpg',
  };

  // 걸음 순위 데이터
  final List<Map<String, dynamic>> stepRanking = [
    {
      'rank': 1,
      'name': '나',
      'profileImage': 'assets/images/profile.jpg',
      'steps': 12500,
      'isMe': true,
    },
    {
      'rank': 2,
      'name': '하진옥',
      'profileImage': 'assets/images/friend1.jpg',
      'steps': 9800,
      'isMe': false,
    },
    {
      'rank': 3,
      'name': 'seungwok.han.in',
      'profileImage': 'assets/images/friend2.jpg',
      'steps': 7500,
      'isMe': false,
    },
  ];

  // 챌린지 데이터
  final List<Map<String, dynamic>> challenges = [
    {
      'title': '달리기 9그룹 텀블러 가즈아',
      'status': '7월 20일에 종료됨',
      'result': '우리 팀 승리!',
      'badge': Icons.emoji_events,
      'badgeColor': Colors.amber,
      'isCompleted': true,
      'hasResult': true,
    },
    {
      'title': '삼성 헬스 X 펫박스 걷기 챌린지',
      'totalSteps': '110,932',
      'myRank': '51,834',
      'badge': Icons.pets,
      'badgeColor': Colors.blue,
      'isCompleted': false,
      'hasResult': false,
    },
    {
      'title': '2025 올림픽 데이 챌린지',
      'status': '도전 결과를 기다리는 중...',
      'totalSteps': '345,401',
      'progress': 0.75,
      'badge': Icons.sports_soccer,
      'badgeColor': Colors.green,
      'isCompleted': false,
      'hasResult': false,
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
              // 헤더 섹션
              _buildHeaderSection(),
              const SizedBox(height: 24),
              
              // 걸음 순위판
              _buildStepLeaderboard(),
              const SizedBox(height: 24),
              
              // 챌린지 카드들
              ...challenges.map((challenge) => _buildChallengeCard(challenge)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      children: [
        // 제목
        Text(
          '투게더',
          style: GoogleFonts.notoSans(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        
        // 사용자 프로필
        Row(
          children: [
            // 프로필 사진
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
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            
            // 사용자 정보
            Expanded(
              child: Row(
                children: [
                  // 왼쪽 컬럼
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData['name'],
                          style: GoogleFonts.notoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Lv. ${userData['level']}',
                          style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // 오른쪽 컬럼
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '친구',
                          style: GoogleFonts.notoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '${userData['friends']}',
                          style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // 도전 만들기 버튼
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('도전 만들기 기능')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              '도전 만들기',
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepLeaderboard() {
    return Container(
      width: double.infinity,
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
            '걸음 순위판',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // 순위 표시
          Row(
            children: stepRanking.map((user) {
              final maxSteps = 15000;
              final height = (user['steps'] / maxSteps) * 120;
              
              return Expanded(
                child: Column(
                  children: [
                    // 순위 번호
                    Text(
                      '${user['rank']}',
                      style: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // 걸음 수 막대
                    Container(
                      width: 40,
                      height: height,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // 프로필 사진
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: user['isMe'] ? Colors.blue[100] : Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        color: user['isMe'] ? Colors.blue : Colors.grey[600],
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    // 이름
                    Text(
                      user['name'],
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(Map<String, dynamic> challenge) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Row(
        children: [
          // 왼쪽 콘텐츠
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제목
                Text(
                  challenge['title'],
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                
                // 상태 또는 통계
                if (challenge['isCompleted'] && challenge['hasResult'])
                  Text(
                    challenge['status'],
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  )
                else if (challenge['totalSteps'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '총 걸음 수 ${challenge['totalSteps']}',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '내 순위 : ${challenge['myRank']}',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challenge['status'],
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '총 걸음 수 ${challenge['totalSteps']}',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                
                // 결과 또는 진행률
                if (challenge['hasResult'])
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      challenge['result'],
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  )
                else if (challenge['progress'] != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: challenge['progress'],
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(challenge['badgeColor']),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.emoji_events, color: Colors.amber, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          
          const SizedBox(width: 16),
          
          // 오른쪽 배지
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: challenge['badgeColor'].withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  challenge['badge'],
                  color: challenge['badgeColor'],
                  size: 30,
                ),
              ),
              
              // X 버튼
              Positioned(
                top: -8,
                right: -8,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              
              // 오렌지 점 (첫 번째 카드에만)
              if (challenge == challenges[0])
                Positioned(
                  top: -4,
                  right: 20,
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
        ],
      ),
    );
  }
}
