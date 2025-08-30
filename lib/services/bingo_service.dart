import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../data/motivational_quotes.dart';

class BingoData {
  final List<int> bingoNumbers;
  final List<bool> bingoSelected;
  final List<int> selectedQuoteNumbers;
  final bool isBingoCompleted;

  BingoData({
    required this.bingoNumbers,
    required this.bingoSelected,
    required this.selectedQuoteNumbers,
    required this.isBingoCompleted,
  });
}

class BingoResult {
  final bool isNumberFound;
  final bool isBingoCompleted;

  BingoResult({
    required this.isNumberFound,
    required this.isBingoCompleted,
  });
}

class BingoService {
  List<int> _bingoNumbers = [];
  List<bool> _bingoSelected = [];
  List<int> _selectedQuoteNumbers = [];
  bool _isBingoCompleted = false;
  bool _isDataLoaded = false;
  
  // 빙고판 데이터 로드
  Future<void> loadBingoData() async {
    if (_isDataLoaded) return; // 이미 로드된 경우 중복 로드 방지
    
    final prefs = await SharedPreferences.getInstance();
    final bingoNumbersString = prefs.getStringList('bingo_numbers') ?? [];
    final bingoSelectedString = prefs.getStringList('bingo_selected') ?? [];
    final selectedQuoteNumbersString = prefs.getStringList('selected_quote_numbers') ?? [];
    final isBingoCompleted = prefs.getBool('is_bingo_completed') ?? false;
    
    print('🔍 BingoService - 로드된 데이터:');
    print('   빙고 번호: $bingoNumbersString');
    print('   선택된 상태: $bingoSelectedString');
    print('   선택된 명언: $selectedQuoteNumbersString');
    print('   빙고 완성: $isBingoCompleted');
    
    if (bingoNumbersString.isEmpty) {
      // 처음 실행시 빙고판 생성
      print('🆕 BingoService - 새로운 빙고판 생성');
      generateNewBingoBoard();
    } else {
      // 저장된 데이터 로드
      _bingoNumbers = bingoNumbersString.map((e) => int.parse(e)).toList();
      _bingoSelected = bingoSelectedString.map((e) => e == 'true').toList();
      _selectedQuoteNumbers = selectedQuoteNumbersString.map((e) => int.parse(e)).toList();
      _isBingoCompleted = isBingoCompleted;
      print('📥 BingoService - 저장된 데이터 로드 완료');
      print('   선택된 개수: ${_bingoSelected.where((selected) => selected).length}');
    }
    
    _isDataLoaded = true;
  }
  
  // 빙고판 데이터 저장
  Future<void> _saveBingoData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bingo_numbers', _bingoNumbers.map((e) => e.toString()).toList());
    await prefs.setStringList('bingo_selected', _bingoSelected.map((e) => e.toString()).toList());
    await prefs.setStringList('selected_quote_numbers', _selectedQuoteNumbers.map((e) => e.toString()).toList());
    await prefs.setBool('is_bingo_completed', _isBingoCompleted);
    
    print('💾 BingoService - 데이터 저장 완료');
    print('   선택된 개수: ${_bingoSelected.where((selected) => selected).length}');
  }
  
  // 새로운 빙고판 생성
  void generateNewBingoBoard() {
    final random = Random();
    final numbers = List<int>.generate(50, (index) => index + 1);
    numbers.shuffle(random);
    _bingoNumbers = numbers.take(25).toList();
    _bingoSelected = List<bool>.filled(25, false);
    _selectedQuoteNumbers.clear();
    _isBingoCompleted = false;
    _saveBingoData();
    
    print('🎲 BingoService - 새로운 빙고판 생성 완료');
    print('   빙고 번호: $_bingoNumbers');
  }
  
  // 빙고 완성 후 새로운 빙고판 생성 (명언 풀도 초기화)
  void generateNewBingoBoardAfterBingo() {
    final random = Random();
    final numbers = List<int>.generate(50, (index) => index + 1);
    numbers.shuffle(random);
    _bingoNumbers = numbers.take(25).toList();
    _bingoSelected = List<bool>.filled(25, false);
    _selectedQuoteNumbers.clear(); // 명언 풀 초기화
    _isBingoCompleted = false;
    _saveBingoData();
    
    print('🔄 BingoService - 빙고 완성 후 새로운 빙고판 생성');
  }
  
  // 빙고 완성 체크
  bool _checkBingoCompletion() {
    // 가로 체크
    for (int i = 0; i < 5; i++) {
      bool rowComplete = true;
      for (int j = 0; j < 5; j++) {
        if (!_bingoSelected[i * 5 + j]) {
          rowComplete = false;
          break;
        }
      }
      if (rowComplete) {
        print('🎯 BingoService - 가로 ${i+1}줄 빙고 완성!');
        return true;
      }
    }
    
    // 세로 체크
    for (int j = 0; j < 5; j++) {
      bool colComplete = true;
      for (int i = 0; i < 5; i++) {
        if (!_bingoSelected[i * 5 + j]) {
          colComplete = false;
          break;
        }
      }
      if (colComplete) {
        print('🎯 BingoService - 세로 ${j+1}줄 빙고 완성!');
        return true;
      }
    }
    
    // 대각선 체크 (좌상단-우하단)
    bool diagonal1Complete = true;
    for (int i = 0; i < 5; i++) {
      if (!_bingoSelected[i * 5 + i]) {
        diagonal1Complete = false;
        break;
      }
    }
    if (diagonal1Complete) {
      print('🎯 BingoService - 대각선(좌상단-우하단) 빙고 완성!');
      return true;
    }
    
    // 대각선 체크 (우상단-좌하단)
    bool diagonal2Complete = true;
    for (int i = 0; i < 5; i++) {
      if (!_bingoSelected[i * 5 + (4 - i)]) {
        diagonal2Complete = false;
        break;
      }
    }
    if (diagonal2Complete) {
      print('🎯 BingoService - 대각선(우상단-좌하단) 빙고 완성!');
      return true;
    }
    
    return false;
  }
  
  // 랜덤 명언을 가져오는 메서드 (선택되지 않은 명언만)
  Map<String, String> getRandomQuote() {
    if (_isBingoCompleted) {
      // 빙고가 완성되면 모든 명언에서 선택
      final random = Random();
      return motivationalQuotes[random.nextInt(motivationalQuotes.length)];
    } else {
      // 빙고가 완성되지 않았으면 선택되지 않은 명언만
      final availableQuotes = <Map<String, String>>[];
      for (int i = 0; i < motivationalQuotes.length; i++) {
        final quoteNumber = i + 1;
        if (!_selectedQuoteNumbers.contains(quoteNumber)) {
          availableQuotes.add(motivationalQuotes[i]);
        }
      }
      
      if (availableQuotes.isEmpty) {
        // 모든 명언이 선택되었다면 빙고 완성 처리
        _isBingoCompleted = true;
        _saveBingoData();
        return motivationalQuotes[0]; // 기본값 반환
      }
      
      final random = Random();
      return availableQuotes[random.nextInt(availableQuotes.length)];
    }
  }
  
  // 빙고 확인 및 네비게이션
  BingoResult checkBingoAndNavigate(int quoteNumber) {
    print('🎲 BingoService - 명언 번호 $quoteNumber 확인 중...');
    
    // 선택된 명언 번호 저장
    if (!_selectedQuoteNumbers.contains(quoteNumber)) {
      _selectedQuoteNumbers.add(quoteNumber);
      print('📝 BingoService - 명언 번호 $quoteNumber 추가됨');
      _saveBingoData();
    }
    
    // 빙고판에서 해당 번호 찾기
    final bingoIndex = _bingoNumbers.indexOf(quoteNumber);
    if (bingoIndex != -1) {
      // 빙고판에 번호가 있는 경우
      _bingoSelected[bingoIndex] = true;
      print('✅ BingoService - 빙고판에서 번호 $quoteNumber 발견! (인덱스: $bingoIndex)');
      _saveBingoData();
      
      // 빙고 완성 체크
      final isBingoCompleted = _checkBingoCompletion();
      if (isBingoCompleted) {
        _isBingoCompleted = true;
        _saveBingoData();
        print('🎉 BingoService - BINGO 완성!');
      }
      
      return BingoResult(
        isNumberFound: true,
        isBingoCompleted: isBingoCompleted,
      );
    } else {
      // 빙고판에 번호가 없는 경우
      print('❌ BingoService - 빙고판에 번호 $quoteNumber 없음');
      return BingoResult(
        isNumberFound: false,
        isBingoCompleted: false,
      );
    }
  }
  
  // 빙고판이 존재하는지 확인하고 없으면 생성
  Future<void> ensureBingoBoardExists() async {
    if (!_isDataLoaded) {
      await loadBingoData();
    }
    
    if (_bingoNumbers.isEmpty) {
      print('⚠️ BingoService - 빙고판이 없어서 자동 생성');
      generateNewBingoBoard();
    }
  }
  
  // 빙고 데이터 가져오기
  BingoData getBingoData() {
    print('📊 BingoService - 현재 빙고 데이터 반환');
    print('   선택된 개수: ${_bingoSelected.where((selected) => selected).length}');
    return BingoData(
      bingoNumbers: _bingoNumbers,
      bingoSelected: _bingoSelected,
      selectedQuoteNumbers: _selectedQuoteNumbers,
      isBingoCompleted: _isBingoCompleted,
    );
  }
  
  // 걸음 수 조건을 체크하고 명언 표시 여부를 결정하는 메서드
  Future<bool> shouldShowQuoteForSteps(int currentSteps) async {
    final prefs = await SharedPreferences.getInstance();
    final lastQuoteShownDate = prefs.getString('last_quote_shown_date');
    final lastQuoteShownSteps = prefs.getInt('last_quote_shown_steps') ?? 0;
    
    final today = DateTime.now().toIso8601String().split('T')[0]; // YYYY-MM-DD 형식
    
    // 오늘 이미 명언을 보여줬는지 확인
    if (lastQuoteShownDate == today) {
      print('📅 BingoService - 오늘 이미 명언을 보여줌 (날짜: $lastQuoteShownDate)');
      return false;
    }
    
    // 걸음 수가 6000보 이상인지 확인
    if (currentSteps >= 6000) {
      print('✅ BingoService - 걸음 수 조건 충족 (현재: $currentSteps, 목표: 6000)');
      
      // 오늘 날짜와 걸음 수 저장
      await prefs.setString('last_quote_shown_date', today);
      await prefs.setInt('last_quote_shown_steps', currentSteps);
      
      print('💾 BingoService - 명언 표시 기록 저장 (날짜: $today, 걸음수: $currentSteps)');
      return true;
    } else {
      print('❌ BingoService - 걸음 수 조건 미충족 (현재: $currentSteps, 목표: 6000)');
      return false;
    }
  }
}
