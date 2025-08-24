import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EnergyScoreDetailPage extends StatefulWidget {
  const EnergyScoreDetailPage({super.key});

  @override
  State<EnergyScoreDetailPage> createState() => _EnergyScoreDetailPageState();
}

class _EnergyScoreDetailPageState extends State<EnergyScoreDetailPage> {
  int selectedDayIndex = 7; // 8/24 선택

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.purple),
          onPressed: () => Navigator.of(context).pop(),
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
            icon: const Icon(Icons.share, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.signal_cellular_4_bar, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWeeklyTrendChart(),
            _buildMainEnergyScore(),
            _buildEnergeticLifeSection(),
            _buildEnergyFactorsSection(),
            _buildLastNightSleepSection(),
            _buildHeartRateSection(),
            _buildHeartRateVariabilitySection(),
            _buildSkinTemperatureSection(),
            _buildRespirationSection(),
            _buildAchievementSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyTrendChart() {
    return Container(
      margin: const EdgeInsets.all(16),
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
            '주간 에너지 점수 트렌드',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['17', '18', '19', '20', '21', '22', '23', '24'];
                        if (value.toInt() >= 0 && value.toInt() < days.length) {
                          return Container(
                            padding: const EdgeInsets.all(4),
                            decoration: value.toInt() == 7
                                ? BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  )
                                : null,
                            child: Text(
                              days[value.toInt()],
                              style: GoogleFonts.notoSans(
                                fontSize: 10,
                                color: value.toInt() == 7 ? Colors.white : Colors.grey[600],
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
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 75),
                      const FlSpot(1, 78),
                      const FlSpot(2, 82),
                      const FlSpot(3, 79),
                      const FlSpot(4, 85),
                      const FlSpot(5, 83),
                      const FlSpot(6, 87),
                      const FlSpot(7, 86),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: index == 7 ? 6 : 4,
                          color: index == 7 ? Colors.blue : Colors.blue,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainEnergyScore() {
    return Container(
      margin: const EdgeInsets.all(16),
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
      child: Column(
        children: [
          // 반원형 게이지
          SizedBox(
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 반원형 진행률 표시기
                SizedBox(
                  height: 120,
                  child: CircularPercentIndicator(
                    radius: 60,
                    lineWidth: 12,
                    percent: 0.86,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '86',
                              style: GoogleFonts.notoSans(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.trending_up,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '21',
                                    style: GoogleFonts.notoSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '매우 좋음',
                          style: GoogleFonts.notoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    progressColor: Colors.blue,
                    backgroundColor: Colors.grey[200]!,
                    circularStrokeCap: CircularStrokeCap.round,
                    startAngle: 180,
                    arcType: ArcType.HALF,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnergeticLifeSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '활기찬 생활의 비결',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.info_outline, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '수면 심박수가 평소 수준으로 안정적으로 유지되고 있어 건강이 회복되고 있습니다. 에너지 점수도 매우 좋음입니다. 현재 상태를 유지하면서 활동 시간을 꾸준히 관리하세요. 스트레스 수치가 낮아 긍정적입니다. 계속해서 더 나은 건강한 삶을 위해 노력하세요!',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                '이 정보가 유용했나요?',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_outlined, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_down_outlined, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEnergyFactorsSection() {
    return Container(
      margin: const EdgeInsets.all(16),
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
            ),
          ),
          const SizedBox(height: 16),
          _buildFactorItem('수면 시간 평균', 0.75, '좋음', Colors.grey),
          _buildFactorItem('수면 시간 규칙성', 0.90, '매우 좋음', Colors.blue),
          _buildFactorItem('수면 패턴 규칙성', 0.85, '매우 좋음', Colors.blue),
          _buildFactorItem('입면 시간', 0.95, '매우 좋음', Colors.blue),
          _buildFactorItem('전날 활동', 0.70, '좋음', Colors.grey),
          _buildFactorItem('활동 규칙성', 0.65, '좋음', Colors.grey),
          _buildFactorItem('수면 심박수', 0.88, '매우 좋음', Colors.blue),
          _buildFactorItem('수면 심박변이도', 0.92, '매우 좋음', Colors.blue),
        ],
      ),
    );
  }

  Widget _buildFactorItem(String title, double progress, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: LinearPercentIndicator(
              width: 80,
              lineHeight: 6,
              percent: progress,
              backgroundColor: Colors.grey[200],
              progressColor: color,
              barRadius: const Radius.circular(3),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            status,
            style: GoogleFonts.notoSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastNightSleepSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRateSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '수면 중 심박수',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.info_outline, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '평균: 58bpm',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 90,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const times = ['1:40', '3:00', '4:20', '5:40', '7:00', '8:20', '9:20'];
                        if (value.toInt() >= 0 && value.toInt() < times.length) {
                          return Text(
                            times[value.toInt()],
                            style: GoogleFonts.notoSans(
                              fontSize: 10,
                              color: Colors.grey[600],
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
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 55, color: Colors.red[300])]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 52, color: Colors.red[300])]),
                  BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 58, color: Colors.red[300])]),
                  BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 54, color: Colors.red[300])]),
                  BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 60, color: Colors.red[300])]),
                  BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 62, color: Colors.red[300])]),
                  BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 65, color: Colors.red[300])]),
                ],
                gridData: FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRateVariabilitySection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '수면 중 심박변이도',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.info_outline, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '평균: 47ms',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 127,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const times = ['1:40', '3:00', '4:20', '5:40', '7:00', '8:20', '9:20'];
                        if (value.toInt() >= 0 && value.toInt() < times.length) {
                          return Text(
                            times[value.toInt()],
                            style: GoogleFonts.notoSans(
                              fontSize: 10,
                              color: Colors.grey[600],
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
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 45, color: Colors.blue[300])]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 50, color: Colors.blue[300])]),
                  BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 42, color: Colors.blue[300])]),
                  BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 55, color: Colors.blue[300])]),
                  BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 48, color: Colors.blue[300])]),
                  BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 52, color: Colors.blue[300])]),
                  BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 47, color: Colors.blue[300])]),
                ],
                gridData: FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkinTemperatureSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '수면 중 피부 온도',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.info_outline, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '-0.7에서 +1.1 °C',
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            '최근 평균 대비 변화',
            style: GoogleFonts.notoSans(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const times = ['1:40', '3:00', '4:20', '5:40', '7:00', '8:20', '9:20'];
                        if (value.toInt() >= 0 && value.toInt() < times.length) {
                          return Text(
                            times[value.toInt()],
                            style: GoogleFonts.notoSans(
                              fontSize: 10,
                              color: Colors.grey[600],
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
                          '${value.toInt()}°C',
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
                lineBarsData: [
                  // 최근 평균 (점선)
                  LineChartBarData(
                    spots: List.generate(7, (index) => FlSpot(index.toDouble(), 0)),
                    isCurved: false,
                    color: Colors.grey[400],
                    barWidth: 1,
                    dotData: FlDotData(show: false),
                    dashArray: [5, 5],
                  ),
                  // 실제 온도 변화
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 0.5),
                      const FlSpot(1, -0.2),
                      const FlSpot(2, 0.8),
                      const FlSpot(3, 0.1),
                      const FlSpot(4, -0.5),
                      const FlSpot(5, 0.3),
                      const FlSpot(6, 0.7),
                    ],
                    isCurved: true,
                    color: Colors.orange,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 12,
                height: 2,
                color: Colors.grey[400],
              ),
              const SizedBox(width: 4),
              Text(
                '최근 평균',
                style: GoogleFonts.notoSans(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 12,
                height: 2,
                color: Colors.orange,
              ),
              const SizedBox(width: 4),
              Text(
                '최근 범위',
                style: GoogleFonts.notoSans(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRespirationSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '수면 중 호흡수',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                '평균: 9.6회/분',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.info_outline, color: Colors.grey, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementSection() {
    return Container(
      margin: const EdgeInsets.all(16),
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
            '성취도',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.local_fire_department,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '에너지 점수 매우 좋음',
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
