import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllWorkoutsPage extends StatefulWidget {
  const AllWorkoutsPage({super.key});

  @override
  State<AllWorkoutsPage> createState() => _AllWorkoutsPageState();
}

class _AllWorkoutsPageState extends State<AllWorkoutsPage> {
  final ScrollController _scrollController = ScrollController();
  Set<String> _favorites = {};
  bool _showScrollToTop = false;

  // 운동 데이터
  final List<Map<String, dynamic>> _workouts = [
    {'name': '걷기', 'icon': Icons.directions_walk, 'isFavorite': true},
    {'name': '풀 수영', 'icon': Icons.pool, 'isFavorite': true},
    {'name': '달리기', 'icon': Icons.directions_run, 'isFavorite': true},
    {'name': '래프팅', 'icon': Icons.rowing, 'isFavorite': false},
    {'name': '스테어 클라이머', 'icon': Icons.stairs, 'isFavorite': false},
    {'name': '내 루틴 1', 'icon': Icons.repeat, 'isFavorite': false},
    {'name': '플랭크', 'icon': Icons.accessibility_new, 'isFavorite': false},
    {'name': '실외 자전거', 'icon': Icons.directions_bike, 'isFavorite': false},
    {'name': '팔 굽혀 펴기', 'icon': Icons.fitness_center, 'isFavorite': false},
    {'name': '스쿼트', 'icon': Icons.accessibility, 'isFavorite': false},
    {'name': '테니스', 'icon': Icons.sports_tennis, 'isFavorite': false},
    {'name': '기타 운동', 'icon': Icons.sports_gymnastics, 'isFavorite': false},
    {'name': '서킷 트레이닝', 'icon': Icons.timer, 'isFavorite': false},
    {'name': '야외 수영', 'icon': Icons.beach_access, 'isFavorite': false},
    {'name': '하이킹', 'icon': Icons.forest, 'isFavorite': false},
    {'name': '기구 운동', 'icon': Icons.fitness_center, 'isFavorite': false},
    {'name': '실내 자전거', 'icon': Icons.pedal_bike, 'isFavorite': false},
    {'name': '로잉머신', 'icon': Icons.rowing, 'isFavorite': false},
    {'name': '러닝머신', 'icon': Icons.directions_run, 'isFavorite': false},
    {'name': '일립티컬', 'icon': Icons.trending_up, 'isFavorite': false},
  ];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
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

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('workout_favorites') ?? [];
    setState(() {
      _favorites = favorites.toSet();
    });
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('workout_favorites', _favorites.toList());
  }

  void _toggleFavorite(String workoutName) {
    setState(() {
      if (_favorites.contains(workoutName)) {
        _favorites.remove(workoutName);
      } else {
        _favorites.add(workoutName);
      }
    });
    _saveFavorites();
  }

  List<Map<String, dynamic>> get _favoriteWorkouts {
    return _workouts.where((workout) => _favorites.contains(workout['name'])).toList();
  }

  List<Map<String, dynamic>> get _otherWorkouts {
    return _workouts.where((workout) => !_favorites.contains(workout['name'])).toList();
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
        title: Text(
          '내 운동',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // 새로운 운동 추가 기능
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('새로운 운동 추가 기능')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // 메뉴 옵션
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
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 즐겨찾기 섹션
                  if (_favoriteWorkouts.isNotEmpty) ...[
                    Text(
                      '즐겨찾기',
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: _favoriteWorkouts.map((workout) => _buildWorkoutItem(workout)).toList(),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  
                  // 운동 더보기 섹션
                  Text(
                    '운동 더보기',
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: _otherWorkouts.map((workout) => _buildWorkoutItem(workout)).toList(),
                    ),
                  ),
                  const SizedBox(height: 80), // 스크롤 버튼을 위한 여백
                ],
              ),
            ),
          ),
          
          // 스크롤 to top 버튼
          if (_showScrollToTop)
            Positioned(
              bottom: 20,
              right: 20,
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
        ],
      ),
    );
  }

  Widget _buildWorkoutItem(Map<String, dynamic> workout) {
    final isFavorite = _favorites.contains(workout['name']);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              workout['name'],
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _toggleFavorite(workout['name']),
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : Colors.grey[400],
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
