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
  
  // 빙고판 데이터 로드
  Future<void> loadBingoData() async {
    final prefs = await SharedPreferences.getInstance();
    final bingoNumbersString = prefs.getStringList('bingo_numbers') ?? [];
    final bingoSelectedString = prefs.getStringList('bingo_selected') ?? [];
    final selectedQuoteNumbersString = prefs.getStringList('selected_quote_numbers') ?? [];
    final isBingoCompleted = prefs.getBool('is_bingo_completed') ?? false;
    
    if (bingoNumbersString.isEmpty) {
      // 처음 실행시 빙고판 생성
      generateNewBingoBoard();
    } else {
      // 저장된 데이터 로드
      _bingoNumbers = bingoNumbersString.map((e) => int.parse(e)).toList();
      _bingoSelected = bingoSelectedString.map((e) => e == 'true').toList();
      _selectedQuoteNumbers = selectedQuoteNumbersString.map((e) => int.parse(e)).toList();
      _isBingoCompleted = isBingoCompleted;
    }
  }
  
  // 빙고판 데이터 저장
  Future<void> _saveBingoData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bingo_numbers', _bingoNumbers.map((e) => e.toString()).toList());
    await prefs.setStringList('bingo_selected', _bingoSelected.map((e) => e.toString()).toList());
    await prefs.setStringList('selected_quote_numbers', _selectedQuoteNumbers.map((e) => e.toString()).toList());
    await prefs.setBool('is_bingo_completed', _isBingoCompleted);
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
      if (rowComplete) return true;
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
      if (colComplete) return true;
    }
    
    // 대각선 체크 (좌상단-우하단)
    bool diagonal1Complete = true;
    for (int i = 0; i < 5; i++) {
      if (!_bingoSelected[i * 5 + i]) {
        diagonal1Complete = false;
        break;
      }
    }
    if (diagonal1Complete) return true;
    
    // 대각선 체크 (우상단-좌하단)
    bool diagonal2Complete = true;
    for (int i = 0; i < 5; i++) {
      if (!_bingoSelected[i * 5 + (4 - i)]) {
        diagonal2Complete = false;
        break;
      }
    }
    return diagonal2Complete;
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
    // 선택된 명언 번호 저장
    if (!_selectedQuoteNumbers.contains(quoteNumber)) {
      _selectedQuoteNumbers.add(quoteNumber);
      _saveBingoData();
    }
    
    // 빙고판에서 해당 번호 찾기
    final bingoIndex = _bingoNumbers.indexOf(quoteNumber);
    if (bingoIndex != -1) {
      // 빙고판에 번호가 있는 경우
      _bingoSelected[bingoIndex] = true;
      _saveBingoData();
      
      // 빙고 완성 체크
      final isBingoCompleted = _checkBingoCompletion();
      if (isBingoCompleted) {
        _isBingoCompleted = true;
        _saveBingoData();
      }
      
      return BingoResult(
        isNumberFound: true,
        isBingoCompleted: isBingoCompleted,
      );
    } else {
      // 빙고판에 번호가 없는 경우
      return BingoResult(
        isNumberFound: false,
        isBingoCompleted: false,
      );
    }
  }
  
  // 빙고판이 존재하는지 확인하고 없으면 생성
  Future<void> ensureBingoBoardExists() async {
    if (_bingoNumbers.isEmpty) {
      generateNewBingoBoard();
    }
  }
  
  // 빙고 데이터 가져오기
  BingoData getBingoData() {
    return BingoData(
      bingoNumbers: _bingoNumbers,
      bingoSelected: _bingoSelected,
      selectedQuoteNumbers: _selectedQuoteNumbers,
      isBingoCompleted: _isBingoCompleted,
    );
  }
}
