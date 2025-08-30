import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FitnessPage extends StatefulWidget {
  const FitnessPage({super.key});

  @override
  State<FitnessPage> createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  // 피트니스 섹션 데이터
  final List<Map<String, dynamic>> fitnessSections = [
    {
      'title': 'iFIT Workouts',
      'workouts': [
        {'name': 'HIIT Cardio', 'duration': '25 min', 'image': 'hiit_cardio', 'provider': 'iFIT'},
        {'name': 'Strength Training', 'duration': '30 min', 'image': 'strength', 'provider': 'iFIT'},
        {'name': 'Yoga Flow', 'duration': '20 min', 'image': 'yoga', 'provider': 'iFIT'},
        {'name': 'Running', 'duration': '45 min', 'image': 'running', 'provider': 'iFIT'},
      ],
    },
    {
      'title': 'Aruba Pilates Sculpting Series',
      'workouts': [
        {'name': 'Core Sculpting', 'duration': '15 min', 'image': 'pilates_core', 'provider': 'Aruba'},
        {'name': 'Leg Toning', 'duration': '20 min', 'image': 'pilates_legs', 'provider': 'Aruba'},
        {'name': 'Full Body', 'duration': '30 min', 'image': 'pilates_full', 'provider': 'Aruba'},
      ],
    },
    {
      'title': "What's new",
      'workouts': [
        {'name': 'Morning Energy', 'duration': '10 min', 'image': 'morning', 'provider': 'FitOn'},
        {'name': 'Quick Burn', 'duration': '15 min', 'image': 'quick_burn', 'provider': 'Zumba'},
        {'name': 'Mindful Movement', 'duration': '25 min', 'image': 'mindful', 'provider': 'Pocket Gym'},
      ],
    },
    {
      'title': 'Popular',
      'workouts': [
        {'name': 'Full Body HIIT', 'duration': '35 min', 'image': 'full_hiit', 'provider': 'iFIT'},
        {'name': 'Core Power', 'duration': '20 min', 'image': 'core_power', 'provider': 'FitOn'},
        {'name': 'Dance Cardio', 'duration': '30 min', 'image': 'dance', 'provider': 'Zumba'},
        {'name': 'Strength & Tone', 'duration': '40 min', 'image': 'strength_tone', 'provider': 'Pocket Gym'},
      ],
    },
    {
      'title': 'Quick Workouts',
      'workouts': [
        {'name': '5-Min Core', 'duration': '5 min', 'image': 'quick_core', 'provider': 'FitOn'},
        {'name': '10-Min Cardio', 'duration': '10 min', 'image': 'quick_cardio', 'provider': 'iFIT'},
        {'name': '15-Min Yoga', 'duration': '15 min', 'image': 'quick_yoga', 'provider': 'Aruba'},
      ],
    },
    {
      'title': 'By Provider',
      'isProviderSection': true,
      'providers': [
        {'name': 'iFIT', 'icon': Icons.fitness_center, 'color': Colors.blue},
        {'name': 'Zumba', 'icon': Icons.music_note, 'color': Colors.orange},
        {'name': 'FitOn', 'icon': Icons.phone_android, 'color': Colors.purple},
        {'name': 'Pocket Gym', 'icon': Icons.sports_gymnastics, 'color': Colors.green},
      ],
    },
    {
      'title': 'Cardio',
      'workouts': [
        {'name': 'Running Intervals', 'duration': '45 min', 'image': 'running_intervals', 'provider': 'iFIT'},
        {'name': 'Cycling', 'duration': '30 min', 'image': 'cycling', 'provider': 'iFIT'},
        {'name': 'Jump Rope', 'duration': '20 min', 'image': 'jump_rope', 'provider': 'FitOn'},
      ],
    },
    {
      'title': 'Strength',
      'workouts': [
        {'name': 'Upper Body', 'duration': '25 min', 'image': 'upper_body', 'provider': 'Pocket Gym'},
        {'name': 'Lower Body', 'duration': '30 min', 'image': 'lower_body', 'provider': 'Pocket Gym'},
        {'name': 'Total Body', 'duration': '40 min', 'image': 'total_body', 'provider': 'iFIT'},
      ],
    },
    {
      'title': 'Yoga & Stretching',
      'workouts': [
        {'name': 'Morning Flow', 'duration': '20 min', 'image': 'morning_yoga', 'provider': 'Aruba'},
        {'name': 'Evening Stretch', 'duration': '15 min', 'image': 'evening_stretch', 'provider': 'FitOn'},
        {'name': 'Power Yoga', 'duration': '35 min', 'image': 'power_yoga', 'provider': 'Aruba'},
      ],
    },
    {
      'title': 'Dance',
      'workouts': [
        {'name': 'Latin Dance', 'duration': '30 min', 'image': 'latin_dance', 'provider': 'Zumba'},
        {'name': 'Hip Hop', 'duration': '25 min', 'image': 'hip_hop', 'provider': 'Zumba'},
        {'name': 'Ballet Fitness', 'duration': '35 min', 'image': 'ballet', 'provider': 'FitOn'},
      ],
    },
    {
      'title': 'Mind & Body',
      'workouts': [
        {'name': 'Meditation', 'duration': '10 min', 'image': 'meditation', 'provider': 'FitOn'},
        {'name': 'Breathing', 'duration': '5 min', 'image': 'breathing', 'provider': 'Aruba'},
        {'name': 'Mindful Movement', 'duration': '20 min', 'image': 'mindful_movement', 'provider': 'FitOn'},
      ],
    },
    {
      'title': 'Beginner Friendly',
      'workouts': [
        {'name': 'First Steps', 'duration': '15 min', 'image': 'first_steps', 'provider': 'iFIT'},
        {'name': 'Gentle Yoga', 'duration': '20 min', 'image': 'gentle_yoga', 'provider': 'Aruba'},
        {'name': 'Easy Cardio', 'duration': '25 min', 'image': 'easy_cardio', 'provider': 'FitOn'},
      ],
    },
    {
      'title': 'Advanced',
      'workouts': [
        {'name': 'Extreme HIIT', 'duration': '45 min', 'image': 'extreme_hiit', 'provider': 'iFIT'},
        {'name': 'Power Lifting', 'duration': '50 min', 'image': 'power_lifting', 'provider': 'Pocket Gym'},
        {'name': 'Advanced Yoga', 'duration': '60 min', 'image': 'advanced_yoga', 'provider': 'Aruba'},
      ],
    },
    {
      'title': 'Seasonal',
      'workouts': [
        {'name': 'Summer Body', 'duration': '30 min', 'image': 'summer_body', 'provider': 'FitOn'},
        {'name': 'Winter Warmup', 'duration': '20 min', 'image': 'winter_warmup', 'provider': 'iFIT'},
        {'name': 'Spring Energy', 'duration': '25 min', 'image': 'spring_energy', 'provider': 'Zumba'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // 헤더
            _buildHeader(),
            
            // 콘텐츠
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: fitnessSections.length,
                itemBuilder: (context, index) {
                  final section = fitnessSections[index];
                  return _buildSection(section);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            '피트니스',
            style: GoogleFonts.notoSans(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('피트니스 검색')),
              );
            },
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('피트니스 메뉴')),
              );
            },
            icon: const Icon(Icons.more_vert, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(Map<String, dynamic> section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 섹션 헤더
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Text(
                section['title'],
                style: GoogleFonts.notoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${section['title']} 더보기')),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            ],
          ),
        ),
        
        // 섹션 콘텐츠
        if (section['isProviderSection'] == true)
          _buildProviderSection(section)
        else
          _buildWorkoutSection(section),
        
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildWorkoutSection(Map<String, dynamic> section) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: section['workouts'].length,
        itemBuilder: (context, index) {
          final workout = section['workouts'][index];
          return _buildWorkoutCard(workout);
        },
      ),
    );
  }

  Widget _buildWorkoutCard(Map<String, dynamic> workout) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지 영역
          Expanded(
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${workout['name']} 시작')),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _getRandomColor(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // 플레이스홀더 이미지
                    Center(
                      child: Icon(
                        _getWorkoutIcon(workout['name']),
                        size: 40,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    
                    // YouTube 플레이 아이콘
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    
                    // 시간 표시
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          workout['duration'],
                          style: GoogleFonts.notoSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 8),
          
          // 제목
          Text(
            workout['name'],
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 4),
          
          // 제공자
          Text(
            workout['provider'],
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProviderSection(Map<String, dynamic> section) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: section['providers'].length,
        itemBuilder: (context, index) {
          final provider = section['providers'][index];
          return _buildProviderCard(provider);
        },
      ),
    );
  }

  Widget _buildProviderCard(Map<String, dynamic> provider) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${provider['name']} 콘텐츠')),
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: provider['color'].withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                provider['icon'],
                color: provider['color'],
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              provider['name'],
              style: GoogleFonts.notoSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Color _getRandomColor() {
    final colors = [
      Colors.blue[300]!,
      Colors.green[300]!,
      Colors.orange[300]!,
      Colors.purple[300]!,
      Colors.red[300]!,
      Colors.teal[300]!,
      Colors.indigo[300]!,
      Colors.pink[300]!,
    ];
    return colors[DateTime.now().millisecond % colors.length];
  }

  IconData _getWorkoutIcon(String workoutName) {
    if (workoutName.toLowerCase().contains('cardio') || workoutName.toLowerCase().contains('running')) {
      return Icons.directions_run;
    } else if (workoutName.toLowerCase().contains('yoga')) {
      return Icons.self_improvement;
    } else if (workoutName.toLowerCase().contains('strength') || workoutName.toLowerCase().contains('lifting')) {
      return Icons.fitness_center;
    } else if (workoutName.toLowerCase().contains('dance')) {
      return Icons.music_note;
    } else if (workoutName.toLowerCase().contains('pilates')) {
      return Icons.accessibility_new;
    } else if (workoutName.toLowerCase().contains('meditation') || workoutName.toLowerCase().contains('mindful')) {
      return Icons.psychology;
    } else if (workoutName.toLowerCase().contains('cycling')) {
      return Icons.directions_bike;
    } else {
      return Icons.sports_gymnastics;
    }
  }
}
