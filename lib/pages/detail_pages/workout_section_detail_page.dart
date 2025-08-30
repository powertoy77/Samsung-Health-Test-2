import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'youtube_player_page.dart';

class WorkoutSectionDetailPage extends StatefulWidget {
  final String sectionTitle;
  final List<Map<String, dynamic>> workouts;
  final bool isProviderSection;
  final List<Map<String, dynamic>>? providers;

  const WorkoutSectionDetailPage({
    super.key,
    required this.sectionTitle,
    required this.workouts,
    this.isProviderSection = false,
    this.providers,
  });

  @override
  State<WorkoutSectionDetailPage> createState() => _WorkoutSectionDetailPageState();
}

class _WorkoutSectionDetailPageState extends State<WorkoutSectionDetailPage> {
  String selectedFilter = 'All';
  final List<String> filterOptions = ['All', '5-15 min', '15-30 min', '30+ min'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // 헤더
            _buildHeader(),
            
            // 필터 (운동 섹션인 경우에만)
            if (!widget.isProviderSection) _buildFilterBar(),
            
            // 콘텐츠
            Expanded(
              child: widget.isProviderSection
                  ? _buildProviderGrid()
                  : _buildWorkoutGrid(),
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
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
          ),
          Expanded(
            child: Text(
              widget.sectionTitle,
              style: GoogleFonts.notoSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${widget.sectionTitle} 검색')),
              );
            },
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${widget.sectionTitle} 메뉴')),
              );
            },
            icon: const Icon(Icons.more_vert, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filterOptions.length,
        itemBuilder: (context, index) {
          final filter = filterOptions[index];
          final isSelected = selectedFilter == filter;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey[300]!,
                ),
              ),
              child: Center(
                child: Text(
                  filter,
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWorkoutGrid() {
    final filteredWorkouts = _getFilteredWorkouts();
    
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: filteredWorkouts.length,
      itemBuilder: (context, index) {
        final workout = filteredWorkouts[index];
        return _buildWorkoutCard(workout);
      },
    );
  }

  Widget _buildProviderGrid() {
    if (widget.providers == null) return const SizedBox.shrink();
    
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: widget.providers!.length,
      itemBuilder: (context, index) {
        final provider = widget.providers![index];
        return _buildProviderCard(provider);
      },
    );
  }

  Widget _buildWorkoutCard(Map<String, dynamic> workout) {
    return GestureDetector(
      onTap: () {
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
            // 이미지 영역
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _getRandomColor(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
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
            
            // 텍스트 영역
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Text(
                      workout['name'],
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
                    
                    const SizedBox(height: 4),
                    
                    // 설명 (짧은 버전)
                    Text(
                      workout['description'],
                      style: GoogleFonts.notoSans(
                        fontSize: 11,
                        color: Colors.grey[500],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: provider['color'].withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                _getProviderIcon(provider['icon']),
                color: provider['color'],
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              provider['name'],
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredWorkouts() {
    if (selectedFilter == 'All') {
      return widget.workouts;
    }
    
    return widget.workouts.where((workout) {
      final duration = workout['duration'];
      final minutes = _extractMinutes(duration);
      
      switch (selectedFilter) {
        case '5-15 min':
          return minutes >= 5 && minutes <= 15;
        case '15-30 min':
          return minutes > 15 && minutes <= 30;
        case '30+ min':
          return minutes > 30;
        default:
          return true;
      }
    }).toList();
  }

  int _extractMinutes(String duration) {
    // "25 min" -> 25
    final match = RegExp(r'(\d+)').firstMatch(duration);
    return match != null ? int.parse(match.group(1)!) : 0;
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
