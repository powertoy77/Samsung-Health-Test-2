import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../detail_pages/youtube_player_page.dart';
import '../../data/youtube_workout_data.dart';

class FitnessPage extends StatefulWidget {
  const FitnessPage({super.key});

  @override
  State<FitnessPage> createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  // 피트니스 섹션 데이터
  final List<Map<String, dynamic>> fitnessSections = YouTubeWorkoutData.fitnessSections;

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
                // 유튜브 플레이어 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YouTubePlayerPage(
                      videoId: workout['youtubeId'],
                      title: workout['name'],
                      duration: workout['duration'],
                      provider: workout['provider'],
                      description: workout['description'],
                    ),
                  ),
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
                _getProviderIcon(provider['icon']),
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

  IconData _getProviderIcon(String iconName) {
    switch (iconName) {
      case 'fitness_center':
        return Icons.fitness_center;
      case 'music_note':
        return Icons.music_note;
      case 'phone_android':
        return Icons.phone_android;
      case 'sports_gymnastics':
        return Icons.sports_gymnastics;
      default:
        return Icons.fitness_center;
    }
  }
}
