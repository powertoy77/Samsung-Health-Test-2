import 'package:flutter/material.dart';

class BingoPage extends StatefulWidget {
  final List<int> bingoNumbers;
  final List<bool> bingoSelected;

  const BingoPage({
    super.key,
    required this.bingoNumbers,
    required this.bingoSelected,
  });

  @override
  State<BingoPage> createState() => _BingoPageState();
}

class _BingoPageState extends State<BingoPage> with TickerProviderStateMixin {
  late AnimationController _stampAnimationController;
  late Animation<double> _stampScaleAnimation;
  late Animation<double> _stampOpacityAnimation;
  int? _animatedIndex;

  @override
  void initState() {
    super.initState();
    _stampAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _stampScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stampAnimationController,
      curve: Curves.elasticOut,
    ));
    
    _stampOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _stampAnimationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    
    // 페이지 로드 시 선택된 번호들에 대해 애니메이션 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateSelectedNumbers();
    });
  }

  @override
  void dispose() {
    _stampAnimationController.dispose();
    super.dispose();
  }

  void _animateSelectedNumbers() async {
    for (int i = 0; i < widget.bingoSelected.length; i++) {
      if (widget.bingoSelected[i]) {
        setState(() {
          _animatedIndex = i;
        });
        _stampAnimationController.reset();
        _stampAnimationController.forward();
        await Future.delayed(const Duration(milliseconds: 200));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2D2D),
        foregroundColor: Colors.white,
        title: const Text(
          '운동 명언 빙고',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // 제목
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '운동 명언 빙고',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // 빙고판
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        final number = widget.bingoNumbers[index];
                        final isSelected = widget.bingoSelected[index];
                        final isAnimating = _animatedIndex == index;
                        
                        return Container(
                          decoration: BoxDecoration(
                            color: isSelected 
                              ? const Color(0xFF4CAF50) 
                              : const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected 
                                ? Colors.green 
                                : Colors.grey.shade300,
                              width: 2,
                            ),
                            boxShadow: isSelected ? [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ] : null,
                          ),
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  number.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected 
                                      ? Colors.white 
                                      : Colors.black87,
                                  ),
                                ),
                                if (isSelected)
                                  AnimatedBuilder(
                                    animation: _stampAnimationController,
                                    builder: (context, child) {
                                      return Opacity(
                                        opacity: isAnimating 
                                          ? _stampOpacityAnimation.value 
                                          : 1.0,
                                        child: Transform.scale(
                                          scale: isAnimating 
                                            ? _stampScaleAnimation.value 
                                            : 1.0,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // 닫기 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      '닫기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
