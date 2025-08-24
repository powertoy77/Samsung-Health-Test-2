import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyActivityDetailPage extends StatefulWidget {
  const DailyActivityDetailPage({super.key});

  @override
  State<DailyActivityDetailPage> createState() => _DailyActivityDetailPageState();
}

class _DailyActivityDetailPageState extends State<DailyActivityDetailPage> {
  int selectedDayIndex = 0;
  final List<String> weekDays = ['일', '월', '화', '수', '목', '금', '토'];
  final List<String> dates = ['24', '25', '26', '27', '28', '29', '30'];

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
          '일일 활동',
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
            icon: const Icon(Icons.calendar_today, color: Colors.grey),
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
            _buildDateSelector(),
            _buildActivitySummaryCard(),
            _buildActivityGraphs(),
            _buildMovementSummary(),
            _buildRelatedContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(7, (index) {
            bool isSelected = index == selectedDayIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDayIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Text(
                      weekDays[index],
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: Colors.purple, width: 2)
                            : null,
                      ),
                      child: Center(
                        child: isSelected
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.purple,
                                size: 20,
                              )
                            : Text(
                                dates[index],
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  color: Colors.grey[400],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildActivitySummaryCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Heart-shaped progress indicator
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer ring (steps)
                CircularProgressIndicator(
                  value: 967 / 6000,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                // Middle ring (activity time)
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 10 / 90,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                // Inner ring (calories)
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: 38 / 500,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                  ),
                ),
                // Center heart icon
                const Icon(
                  Icons.favorite,
                  color: Colors.purple,
                  size: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Main metrics
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetric('걸음 수', '967', '/6,000', Colors.green),
              _buildMetric('활동 시간', '10', '/90분', Colors.blue),
              _buildMetric('활동 칼로리', '38', '/500kcal', Colors.pink),
            ],
          ),
          const SizedBox(height: 20),
          // Additional metrics
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAdditionalMetric('총 칼로리 소모량', '976 kcal'),
              _buildAdditionalMetric('활동으로 이동한 거리', '0.76 km'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String label, String value, String goal, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          goal,
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

  Widget _buildAdditionalMetric(String label, String value) {
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

  Widget _buildActivityGraphs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildActivityGraph('걸음 수', Colors.green, [10, 0, 0, 0]),
          const SizedBox(height: 16),
          _buildActivityGraph('활동 시간', Colors.blue, [0, 0, 0, 0]),
          const SizedBox(height: 16),
          _buildActivityGraph('활동 칼로리', Colors.pink, [0, 0, 0, 0]),
        ],
      ),
    );
  }

  Widget _buildActivityGraph(String title, Color color, List<int> data) {
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
            title,
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Bar chart
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(4, (index) {
                          double height = data[index] > 0 ? data[index] / 10 : 0.1;
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: height * 80,
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          );
                        }),
                      ),
                      // Time labels
                      Positioned(
                        bottom: -20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('오전 12', style: GoogleFonts.notoSans(fontSize: 10)),
                            Text('오전 6', style: GoogleFonts.notoSans(fontSize: 10)),
                            Text('오후 12', style: GoogleFonts.notoSans(fontSize: 10)),
                            Text('오후 6', style: GoogleFonts.notoSans(fontSize: 10)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Highlight bubble
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '오전 11:00-오후 12:00\n${data[0]}${title == '걸음 수' ? '걸' : title == '활동 시간' ? '분' : 'kcal'}',
                    style: GoogleFonts.notoSans(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovementSummary() {
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
            '움직임',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMovementItem('오른 층 수', '0'),
              ),
              Expanded(
                child: _buildMovementItem('매시간 움직이기', '5'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '시간',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMovementItem('운동 시간', '0분'),
              ),
              Expanded(
                child: _buildMovementItem('심박수 증가 활동 시간', '0분'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '칼로리',
            style: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildMovementItem('운동 칼로리', '0kcal'),
        ],
      ),
    );
  }

  Widget _buildMovementItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedContent() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '연관 콘텐츠',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildContentCard('Prelude', 'CALM', 'assets/images/prelude.jpg'),
                _buildContentCard('조각 몸매 운동', 'Skimble', 'assets/images/workout.jpg'),
                _buildContentCard('Centre Point', 'CALM', 'assets/images/centre_point.jpg'),
                _buildContentCard('몸선', 'BLES!', 'assets/images/body_line.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentCard(String title, String developer, String imagePath) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.image,
                color: Colors.grey[600],
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.notoSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            developer,
            style: GoogleFonts.notoSans(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
