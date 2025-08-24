# Samsung Health Clone

삼성 헬스 앱의 UI와 기능을 복제한 Flutter 애플리케이션입니다.

## 📱 프로젝트 개요

이 프로젝트는 삼성 헬스 앱의 핵심 기능들을 Flutter로 구현한 클론 앱입니다. 실제 삼성 헬스 앱의 디자인과 사용자 경험을 최대한 재현하여, 건강 관리 앱 개발에 대한 이해와 Flutter 개발 역량을 향상시키는 것을 목표로 합니다.

## ✨ 주요 기능

### 🏠 홈 화면 (Home Tab)
- **7개 메인 카드**:
  1. **일일 활동**: 일일 활동 요약 및 상세 페이지
  2. **수면**: 수면 데이터 및 상세 페이지
  3. **내 운동**: 운동 목록, 즐겨찾기, 운동 시작 페이지
  4. **에너지 점수**: 에너지 점수 상세 분석 페이지
  5. **수면 코칭**: 수면 코칭 2 Depth 페이지
  6. **운동 기록**: 운동 기록 상세 페이지
  7. **걸음 수**: 걸음 수 상세 분석 페이지

### 👥 투게더 (Together Tab)
- **사용자 프로필**: 사용자 정보 및 스텝 리더보드
- **도전 카드**: 개인/팀 도전 현황
- **친구 관리**: 667명 친구 목록
- **도전 만들기**: 새로운 도전 생성 기능

### 🔍 Discover Tab
- **Health Hub 온보딩**: 그라데이션 배경의 메인 카드
- **복잡한 배경 요소**: CustomPainter로 구현된 배경 아이콘들
- **사람 실루엣**: 다양한 사람과 디바이스 실루엣
- **모던 UI**: 최신 디자인 트렌드 반영

### 💪 피트니스 (Fitness Tab)
- **15개 운동 섹션**:
  - iFIT Workouts, Aruba Pilates, What's new, Popular
  - Quick Workouts, By Provider, Cardio, Strength
  - Yoga & Stretching, Dance, Mind & Body
  - Beginner Friendly, Advanced, Seasonal
- **운동 카드**: 이미지, 시간, 제공자, YouTube 플레이 아이콘
- **제공자 섹션**: iFIT, Zumba, FitOn, Pocket Gym
- **수평 스크롤**: 각 섹션별 수평 스크롤 가능한 카드 목록

### 👤 내 페이지 (My Page Tab)
- **사용자 프로필**: 원형 사진, 인증 배지, 이름, 레벨, XP 진행률
- **헬스 데이터 공유**: 데이터 공유 기능
- **주별 분석**: 4개 메트릭 (에너지 점수, 수면 시간, 운동 시간, 걸음 수)
- **배지 시스템**: 다양한 배지와 업적
- **개인 최고기록**: 최장 거리, 하프 마라톤 기록
- **도전 섹션**: 개인/팀 도전 요약
- **글로벌 도전**: 정글, 스노우 테마 도전

## 🛠 기술 스택

- **Framework**: Flutter 3.x
- **Language**: Dart
- **UI Framework**: Material Design 3
- **Charts**: fl_chart
- **Progress Indicators**: percent_indicator
- **Fonts**: Google Fonts (Noto Sans)
- **Local Storage**: shared_preferences
- **State Management**: StatefulWidget, setState
- **Navigation**: Navigator, MaterialPageRoute

## 📦 주요 패키지

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  fl_chart: ^0.66.0
  percent_indicator: ^4.2.3
  shared_preferences: ^2.2.2
```

## 🎨 UI/UX 특징

### 디자인 시스템
- **Material Design 3**: 최신 Material Design 가이드라인 적용
- **일관된 색상 체계**: 브랜드 컬러와 기능별 색상 사용
- **카드 기반 레이아웃**: 모든 콘텐츠를 카드 형태로 구성
- **그림자 효과**: 깊이감 있는 디자인
- **반응형 디자인**: 다양한 화면 크기 지원

### 사용자 경험
- **직관적인 네비게이션**: 5개 탭 구조로 쉬운 이동
- **스크롤 지원**: 세로/가로 스크롤 모두 지원
- **상호작용 피드백**: SnackBar, 애니메이션 등
- **데이터 시각화**: 차트, 진행률 바, 게이지 등
- **개인화**: 즐겨찾기, 사용자 설정 등

## 📱 화면 구성

### 메인 탭 구조
1. **홈** (🏠): 메인 대시보드
2. **투게더** (👥): 소셜 기능
3. **Discover** (🔍): 콘텐츠 탐색
4. **피트니스** (💪): 운동 콘텐츠
5. **내 페이지** (👤): 사용자 프로필

### 상세 페이지들
- **EnergyScoreDetailPage**: 에너지 점수 상세 분석
- **AllWorkoutsPage**: 운동 목록 및 관리
- **WorkoutStartPage**: 운동 시작 및 타이머
- **SleepCoachingStartPage**: 수면 코칭
- **WorkoutHistoryPage**: 운동 기록
- **StepsDetailPage**: 걸음 수 상세 분석

## 🚀 설치 및 실행

### 필수 요구사항
- Flutter SDK 3.x 이상
- Dart SDK 3.x 이상
- Android Studio / VS Code
- Android SDK (Android 개발용)
- Xcode (iOS 개발용, macOS 필요)

### 설치 방법

1. **저장소 클론**
```bash
git clone https://github.com/powertoy77/Samsung-Health-Test-2.git
cd samsung_health_clone
```

2. **의존성 설치**
```bash
flutter pub get
```

3. **앱 실행**
```bash
flutter run
```

4. **APK 빌드**
```bash
flutter build apk --release
```

## 📊 주요 기능 상세

### 홈 화면 기능
- **일일 활동 카드**: 활동 요약 및 상세 페이지 연결
- **수면 카드**: 수면 데이터 표시 및 상세 페이지 연결
- **내 운동 카드**: 운동 목록, 즐겨찾기 기능
- **에너지 점수 카드**: 에너지 점수 표시 및 상세 분석
- **수면 코칭 카드**: 수면 코칭 기능 연결
- **운동 기록 카드**: 운동 기록 표시 및 상세 페이지
- **걸음 수 카드**: 걸음 수 요약 및 상세 분석

### 운동 관리 시스템
- **운동 목록**: 다양한 운동 카테고리별 분류
- **즐겨찾기**: 사용자별 즐겨찾기 운동 관리
- **운동 시작**: 타이머 기능이 포함된 운동 시작 페이지
- **운동 기록**: 과거 운동 기록 조회

### 데이터 시각화
- **차트**: fl_chart를 활용한 다양한 차트 구현
- **진행률 바**: percent_indicator를 활용한 진행률 표시
- **게이지**: 원형/선형 진행률 표시
- **통계**: 주별 분석, 개인 최고기록 등

### 소셜 기능
- **친구 관리**: 667명 친구 목록
- **도전**: 개인/팀 도전 시스템
- **글로벌 도전**: 정글, 스노우 테마 도전
- **리더보드**: 스텝 기반 순위 시스템

## 🔧 개발 환경

### 브랜치 구조
- **main**: 메인 브랜치
- **running_poc**: 개발 중인 기능 브랜치

### 코드 구조
```
lib/
├── main.dart                 # 앱 진입점
├── pages/
│   ├── home_page.dart        # 홈 화면
│   ├── tab_pages/           # 탭 페이지들
│   │   ├── together_page.dart
│   │   ├── discover_page.dart
│   │   ├── fitness_page.dart
│   │   └── my_page.dart
│   └── detail_pages/        # 상세 페이지들
│       ├── energy_score_detail_page.dart
│       ├── all_workouts_page.dart
│       ├── workout_start_page.dart
│       ├── sleep_coaching_start_page.dart
│       ├── workout_history_page.dart
│       └── steps_detail_page.dart
```

## 📈 성능 최적화

- **이미지 최적화**: 플레이스홀더 이미지 사용
- **메모리 관리**: 적절한 dispose 처리
- **빌드 최적화**: release 모드 빌드
- **코드 분할**: 모듈화된 코드 구조

## 🧪 테스트

### 현재 상태
- **기능 테스트**: 모든 주요 기능 구현 완료
- **UI 테스트**: 모든 화면 레이아웃 확인
- **네비게이션 테스트**: 탭 간 이동 및 상세 페이지 연결 확인

### 테스트 계획
- [ ] Unit 테스트 추가
- [ ] Widget 테스트 추가
- [ ] Integration 테스트 추가
- [ ] 성능 테스트 추가

## 📝 업데이트 로그

### 최신 업데이트 (2024년)
- ✅ **내 페이지 완전 구현**: 사용자 프로필, 주별 분석, 배지, 도전 등
- ✅ **피트니스 페이지 완전 구현**: 15개 운동 섹션, 제공자 시스템
- ✅ **Discover 페이지 구현**: Health Hub 온보딩, 복잡한 배경 요소
- ✅ **투게더 페이지 구현**: 사용자 프로필, 도전 시스템
- ✅ **모든 상세 페이지 구현**: 에너지 점수, 운동, 수면 코칭, 운동 기록, 걸음 수
- ✅ **홈 화면 완성**: 7개 메인 카드 및 상세 페이지 연결
- ✅ **하단 네비게이션**: 5개 탭 완전 구현

### 주요 구현 사항
- **895줄의 내 페이지 코드**: 완전한 사용자 프로필 시스템
- **444줄의 피트니스 페이지 코드**: 포괄적인 운동 콘텐츠 시스템
- **복잡한 UI 요소**: CustomPainter, Stack, GridView 등 활용
- **데이터 관리**: SharedPreferences를 활용한 로컬 저장소
- **상호작용**: 모든 버튼과 카드의 클릭 이벤트 구현

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 교육 및 학습 목적으로 제작되었습니다. 삼성 헬스 앱의 디자인과 기능을 참고하여 Flutter 개발 학습을 위해 구현되었습니다.

## 📞 연락처

프로젝트 관련 문의사항이 있으시면 GitHub Issues를 통해 연락해 주세요.

---

**Samsung Health Clone** - Flutter로 구현한 삼성 헬스 앱 클론 프로젝트 🚀
