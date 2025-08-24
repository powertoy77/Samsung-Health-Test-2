import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutHistoryPage extends StatefulWidget {
  const WorkoutHistoryPage({super.key});

  @override
  State<WorkoutHistoryPage> createState() => _WorkoutHistoryPageState();
}

class _WorkoutHistoryPageState extends State<WorkoutHistoryPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;
  int selectedDateIndex = 0; // 8/24 선택

  // 운동 기록 데이터
  final List<Map<String, dynamic>> _workoutHistory = [
    {
      'week': '이번 주',
      'period': '8월 24일 ~ 30일',
      'totalDuration': '00:00',
      'totalCalories': '0',
      'hasTrend': false,
      'activities': [],
      'message': '더 이상 기록되는 운동이 없습니다',
    },
    {
      'week': '8월 17일 ~ 23일',
      'period': '8월 17일 ~ 23일',
      'totalDuration': '4:47:26',
      'totalCalories': '1,244',
      'hasTrend': false,
      'activities': [
        {
          'date': '8월 23일 (금)',
          'dayTotal': '129:22',
          'dayCalories': '545',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '10:47', 'distance': '0.48 km', 'time': '오후 5:55'},
            {'name': '래프팅', 'icon': Icons.rowing, 'duration': '1:18:35', 'distance': '', 'time': '오전 10:11'},
          ],
        },
        {
          'date': '8월 22일 (금)',
          'dayTotal': '18:02',
          'dayCalories': '115',
          'workouts': [
            {'name': '기타 운동(자동)', 'icon': Icons.fitness_center, 'duration': '18:02', 'distance': '', 'time': '오전 7:45'},
          ],
        },
        {
          'date': '8월 21일 (목)',
          'dayTotal': '24:17',
          'dayCalories': '167',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '11:10', 'distance': '0.81 km', 'time': '오전 7:14'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '13:07', 'distance': '0.96 km', 'time': '오전 9:54'},
          ],
        },
        {
          'date': '8월 20일 (수)',
          'dayTotal': '47:06',
          'dayCalories': '285',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '12:14', 'distance': '0.71 km', 'time': '오후 10:21'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '10:49', 'distance': '0.73 km', 'time': '오후 8:19'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '11:59', 'distance': '0.70 km', 'time': '오후 1:02'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '11:36', 'distance': '0.70 km', 'time': '오전 11:46'},
            {'name': '아라시 비치 필라테스 베이직', 'icon': Icons.accessibility_new, 'duration': '00:28', 'distance': '', 'time': '오전 11:31'},
          ],
        },
        {
          'date': '8월 19일 (월)',
          'dayTotal': '49:03',
          'dayCalories': '253',
          'workouts': [
            {'name': '풀 수영', 'icon': Icons.pool, 'duration': '37:43', 'distance': '425 m', 'time': '오전 11:01'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '11:40', 'distance': '0.60 km', 'time': '오전 11:58'},
          ],
        },
        {
          'date': '8월 18일 (일)',
          'dayTotal': '27:39',
          'dayCalories': '123',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '10:35', 'distance': '0.94 km', 'time': '오후 12:49'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '16:46', 'distance': '1.18 km', 'time': '오전 11:47'},
          ],
        },
        {
          'date': '8월 17일 (토)',
          'dayTotal': '31:37',
          'dayCalories': '205',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '12:35', 'distance': '0.69 km', 'time': '오후 9:35'},
            {'name': '실외 자전거(자동)', 'icon': Icons.directions_bike, 'duration': '09:38', 'distance': '', 'time': '오후 8:17'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '10:26', 'distance': '0.58 km', 'time': '오전 8:01'},
          ],
        },
      ],
    },
    {
      'week': '8월 10일 ~ 16일',
      'period': '8월 10일 ~ 16일',
      'totalDuration': '1:35:21',
      'totalCalories': '684',
      'hasTrend': true,
      'activities': [
        {
          'date': '8월 15일 (금)',
          'dayTotal': '24:00',
          'dayCalories': '263',
          'workouts': [
            {'name': '풀 수영(자동)', 'icon': Icons.pool, 'duration': '15:46', 'distance': '', 'time': '오후 5:26'},
            {'name': '풀 수영(자동)', 'icon': Icons.pool, 'duration': '08:20', 'distance': '', 'time': '오전 11:59'},
          ],
        },
        {
          'date': '8월 12일 (화)',
          'dayTotal': '22:06',
          'dayCalories': '129',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '10:16', 'distance': '0.65 km', 'time': '오후 6:20'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '11:50', 'distance': '0.62 km', 'time': '오후 12:10'},
          ],
        },
        {
          'date': '8월 11일 (월)',
          'dayTotal': '24:34',
          'dayCalories': '143',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '20:30', 'distance': '1.65 km', 'time': '오후 12:10'},
          ],
        },
        {
          'date': '8월 10일 (일)',
          'dayTotal': '24:35',
          'dayCalories': '144',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '12:08', 'distance': '0.75 km', 'time': '오후 6:11'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '12:27', 'distance': '0.74 km', 'time': '오후 3:35'},
          ],
        },
      ],
    },
    {
      'week': '8월 3일 ~ 9일',
      'period': '8월 3일 ~ 9일',
      'totalDuration': '1:42:37',
      'totalCalories': '599',
      'hasTrend': true,
      'activities': [
        {
          'date': '8월 9일 (토)',
          'dayTotal': '24:25',
          'dayCalories': '273',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '11:28', 'distance': '0.67 km', 'time': '오후 5:16'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '15:51', 'distance': '0.77 km', 'time': '오후 1:48'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '21:26', 'distance': '1.29 km', 'time': '오전 11:49'},
          ],
        },
        {
          'date': '8월 8일 (금)',
          'dayTotal': '13:32',
          'dayCalories': '74',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '13:32', 'distance': '0.78 km', 'time': '오후 12:37'},
          ],
        },
        {
          'date': '8월 6일 (수)',
          'dayTotal': '31:49',
          'dayCalories': '150',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '10:40', 'distance': '0.59 km', 'time': '오후 7:38'},
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '21:09', 'distance': '1.37 km', 'time': '오후 12:16'},
          ],
        },
        {
          'date': '8월 4일 (월)',
          'dayTotal': '10:31',
          'dayCalories': '72',
          'workouts': [
            {'name': '걷기(자동)', 'icon': Icons.directions_walk, 'duration': '10:31', 'distance': '0.70 km', 'time': '오후 6:57'},
          ],
        },
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 200 && !_showScrollToTop) {
      setState(() {
        _showScrollToTop = true;
      });
    } else if (_scrollController.offset <= 200 && _showScrollToTop) {
      setState(() {
        _showScrollToTop = false;
      });
    }
  }

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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '모든 운동',
              style: GoogleFonts.notoSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 16),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.show_chart, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('운동 통계 차트')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('캘린더 보기')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('메뉴 옵션')),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // 날짜 네비게이션
                _buildDateNavigation(),
                
                // 운동 기록 목록
                ..._workoutHistory.map((weekData) => _buildWeekSection(weekData)).toList(),
                
                const SizedBox(height: 80), // 스크롤 버튼을 위한 여백
              ],
            ),
          ),
          
          // 스크롤 to top 버튼
          if (_showScrollToTop)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.green,
                  onPressed: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDateNavigation() {
    const dates = ['24', '21', '20', '19', '18', '17', '16'];
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: dates.asMap().entries.map((entry) {
          final index = entry.key;
          final date = entry.value;
          final isSelected = index == selectedDateIndex;
          
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDateIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  date,
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWeekSection(Map<String, dynamic> weekData) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // 주간 요약 카드
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weekData['week'],
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            weekData['totalDuration'],
                            style: GoogleFonts.notoSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${weekData['totalCalories']} kcal',
                            style: GoogleFonts.notoSans(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          if (weekData['hasTrend']) ...[
                            const SizedBox(width: 4),
                            const Icon(Icons.trending_up, color: Colors.green, size: 16),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // 일별 운동 기록
          if (weekData['message'] != null)
            Container(
              width: double.infinity,
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
              child: Text(
                weekData['message'],
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            ...weekData['activities'].map<Widget>((dayData) => _buildDaySection(dayData)).toList(),
        ],
      ),
    );
  }

  Widget _buildDaySection(Map<String, dynamic> dayData) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
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
          // 일별 요약
          Row(
            children: [
              Text(
                dayData['date'],
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Text(
                dayData['dayTotal'],
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${dayData['dayCalories']} kcal',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // 운동 목록
          ...dayData['workouts'].map<Widget>((workout) => _buildWorkoutItem(workout)).toList(),
        ],
      ),
    );
  }

  Widget _buildWorkoutItem(Map<String, dynamic> workout) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              workout['icon'],
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout['name'],
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                if (workout['distance'].isNotEmpty)
                  Text(
                    workout['distance'],
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
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
                workout['duration'],
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                workout['time'],
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
