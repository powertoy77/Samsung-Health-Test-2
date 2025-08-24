import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StepsDetailPage extends StatefulWidget {
  const StepsDetailPage({super.key});

  @override
  State<StepsDetailPage> createState() => _StepsDetailPageState();
}

class _StepsDetailPageState extends State<StepsDetailPage> {
  // 걸음 수 데이터
  final int currentSteps = 2073;
  final int goalSteps = 6000;
  final double progress = 2073 / 6000;
  
  // 일별 걸음 수 데이터
  final List<Map<String, dynamic>> dailySteps = [
    {'date': '18', 'steps': 8500, 'isCurrent': false},
    {'date': '19', 'steps': 7200, 'isCurrent': false},
    {'date': '20', 'steps': 9100, 'isCurrent': false},
    {'date': '21', 'steps': 6800, 'isCurrent': false},
    {'date': '22', 'steps': 9500, 'isCurrent': false},
    {'date': '23', 'steps': 7800, 'isCurrent': false},
    {'date': '24', 'steps': 2073, 'isCurrent': true},
  ];
  
  // 시간별 걸음 수 데이터
  final List<Map<String, dynamic>> hourlySteps = [
    {'hour': '오전 12', 'steps': 1200},
    {'hour': '오전 6', 'steps': 800},
    {'hour': '오후 12', 'steps': 1500},
    {'hour': '오후 6', 'steps': 900},
  ];
  
  // 걸음 수 비교 데이터
  final List<Map<String, dynamic>> comparisonData = [
    {'label': '나', 'steps': 10833, 'color': Colors.green},
    {'label': '40-49', 'steps': 8500, 'color': Colors.grey},
    {'label': '전체', 'steps': 7200, 'color': Colors.grey},
  ];
  
  // 연관 콘텐츠 데이터
  final List<Map<String, dynamic>> relatedContent = [
    {
      'title': 'Prelude',
      'subtitle': 'CALM',
      'image': 'assets/images/mountain.jpg',
      'color': Colors.blue[100]!,
    },
    {
      'title': 'Veering',
      'subtitle': 'CALM',
      'image': 'assets/images/coastline.jpg',
      'color': Colors.green[100]!,
    },
    {
      'title': '군살을 빼자. 라인을 살리...',
      'subtitle': 'Skimble',
      'image': 'assets/images/running.jpg',
      'color': Colors.orange[100]!,
    },
    {
      'title': '초보기',
      'subtitle': '스트리BLES!',
      'image': 'assets/images/yoga.jpg',
      'color': Colors.purple[100]!,
    },
  ];

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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('걸음 수 공유')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.signal_cellular_4_bar, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('연결 상태')),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 일별 걸음 수 차트
            _buildDailyStepsChart(),
            const SizedBox(height: 24),
            
            // 현재 걸음 수 요약
            _buildCurrentStepsSummary(),
            const SizedBox(height: 24),
            
            // 시간별 걸음 수 차트
            _buildHourlyStepsChart(),
            const SizedBox(height: 24),
            
            // 걸음 수 비교
            _buildStepsComparison(),
            const SizedBox(height: 24),
            
            // 배지 현황
            _buildBadgeStatus(),
            const SizedBox(height: 24),
            
            // 연관 콘텐츠
            _buildRelatedContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyStepsChart() {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '일별 걸음 수',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: Row(
              children: dailySteps.map((data) {
                final isCurrent = data['isCurrent'];
                final steps = data['steps'];
                final maxSteps = 10000;
                final height = (steps / maxSteps) * 80;
                
                return Expanded(
                  child: Column(
                    children: [
                      const Spacer(),
                      Container(
                        width: 20,
                        height: height,
                        decoration: BoxDecoration(
                          color: isCurrent ? Colors.grey[300] : Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: isCurrent
                            ? Center(
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data['date'],
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      if (isCurrent) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '6,000',
                            style: GoogleFonts.notoSans(
                              fontSize: 10,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStepsSummary() {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$currentSteps 걸음',
            style: GoogleFonts.notoSans(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // 진행률 바
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * progress * 0.8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0',
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '목표: $goalSteps',
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // 통계 정보
          Row(
            children: [
              Expanded(
                child: _buildStatItem('1.63 km', '거리'),
              ),
              Container(
                width: 1,
                height: 20,
                color: Colors.grey[300],
              ),
              Expanded(
                child: _buildStatItem('83 kcal', '칼로리'),
              ),
              Container(
                width: 1,
                height: 20,
                color: Colors.grey[300],
              ),
              Expanded(
                child: _buildStatItem('0 층', '층수'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '시간별 걸음 수',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 2000,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < hourlySteps.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              hourlySteps[value.toInt()]['hour'],
                              style: GoogleFonts.notoSans(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: GoogleFonts.notoSans(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: hourlySteps.asMap().entries.map((entry) {
                  final index = entry.key;
                  final data = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: data['steps'].toDouble(),
                        color: Colors.green,
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }).toList(),
                gridData: FlGridData(show: false),
              ),
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

  Widget _buildStepsComparison() {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '걸음 수 비교',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Text(
                '평균 10,833',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '상위 8%',
                  style: GoogleFonts.notoSans(
                    fontSize: 10,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...comparisonData.map((data) {
            final maxSteps = 12000;
            final width = (data['steps'] / maxSteps);
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text(
                      data['label'],
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: data['color'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: width,
                        child: Container(
                          decoration: BoxDecoration(
                            color: data['color'],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${data['steps']}',
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildBadgeStatus() {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '배지 현황',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '7일째 목표를 달성했어요. 잘하고 있어요!',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // 배지 원형들
              ...List.generate(10, (index) {
                final isAchieved = index < 7;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isAchieved ? Colors.amber : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: isAchieved
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 16,
                          )
                        : Center(
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.notoSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                  ),
                );
              }),
              const Spacer(),
              // 걸음 아이콘
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.directions_walk,
                  color: Colors.grey[400],
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: relatedContent.length,
            itemBuilder: (context, index) {
              final content = relatedContent[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: content['color'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[400],
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content['title'],
                            style: GoogleFonts.notoSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            content['subtitle'],
                            style: GoogleFonts.notoSans(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
