# Samsung Health Clone

삼성 헬스 앱의 UI와 기능을 복제한 Flutter 애플리케이션입니다.

## 📱 프로젝트 개요

이 프로젝트는 삼성 헬스 앱의 핵심 기능들을 Flutter로 구현한 클론 앱입니다. 실제 삼성 헬스 앱의 디자인과 사용자 경험을 최대한 재현하여, 건강 관리 앱 개발에 대한 이해와 Flutter 개발 역량을 향상시키는 것을 목표로 합니다.

## 📥 다운로드

### 최신 버전
- **v0.2.7** (2024-12-29): [samsung-health-clone-v0.2.7.apk](samsung-health-clone-v0.2.7.apk)
  - 운동 섹션 상세 페이지 기능 추가
  - 각 운동 섹션별 전체 운동 리스트 그리드 뷰
  - 운동 시간별 필터링 기능 (All, 5-15 min, 15-30 min, 30+ min)
  - 2열 그리드 레이아웃으로 최적화된 운동 카드 표시
  - 운동 상세 정보 (제목, 제공자, 설명, 시간) 표시

### 이전 버전
- **v0.2.6** (2024-12-29): [samsung-health-clone-v0.2.6.apk](samsung-health-clone-v0.2.6.apk)
  - 피트니스 탭 유튜브 기능 추가
  - 실제 홈 트레이닝 유튜브 컨텐츠 150개
  - 앱 내 유튜브 플레이어 구현
- **v0.2.5** (2024-12-29): [samsung-health-clone-v0.2.5.apk](samsung-health-clone-v0.2.5.apk)
  - 모든 info 레벨 메시지 수정 및 코드 품질 개선
  - deprecated 메서드 사용 제거
  - 린트 규칙 준수
- **v0.2.4** (2024-12-29): [samsung-health-clone-v0.2.4.apk](samsung-health-clone-v0.2.4.apk)
  - 명언 표시 조건 개선 (걸음 수 6000보 이상일 때 1번만 발생)
- **v0.2.3**: [samsung-health-clone-v0.2.3.apk](samsung-health-clone-v0.2.3.apk)
- **v0.2.2**: [samsung-health-clone-v0.2.2.apk](samsung-health-clone-v0.2.2.apk)
- **v0.2.1**: [samsung-health-clone-v0.2.1.apk](samsung-health-clone-v0.2.1.apk)
- **v0.1.0**: [samsung-health-clone.apk](samsung-health-clone.apk)

## ✨ 주요 기능

### 🏠 홈 화면 (Home Tab)
- **7개 메인 카드**:
  1. **일일 활동**: 시간 기반 동적 활동 데이터 (걸음수, 활동시간, 칼로리) + 명언 빙고 게임
  2. **수면**: 수면 데이터 및 상세 페이지
  3. **내 운동**: 운동 목록, 즐겨찾기, 운동 시작 페이지
  4. **에너지 점수**: 에너지 점수 상세 분석 페이지
  5. **수면 코칭**: 수면 코칭 2 Depth 페이지
  6. **운동 기록**: 운동 기록 상세 페이지
  7. **걸음 수**: 걸음 수 상세 분석 페이지 (10,000보 목표)

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

### 💪 피트니스 (Fitness Tab) - NEW! 🆕
- **15개 운동 섹션** (각 섹션당 10개씩 총 150개 운동):
  - iFIT Workouts, Aruba Pilates, What's new, Popular
  - Quick Workouts, By Provider, Cardio, Strength
  - Yoga & Stretching, Dance, Mind & Body
  - Beginner Friendly, Advanced, Seasonal
- **실제 유튜브 홈 트레이닝 컨텐츠**: 각 운동에 실제 유튜브 비디오 ID 연결
- **앱 내 유튜브 플레이어**: 운동 카드 클릭 시 앱에서 직접 유튜브 영상 재생
- **운동 정보**: 제목, 시간, 제공자, 상세 설명 표시
- **운동 팁**: 각 운동에 대한 유용한 팁 제공
- **관련 운동 추천**: 비슷한 운동 추천 기능
- **전체화면 모드**: 유튜브 플레이어 전체화면 지원

#### 🆕 운동 섹션 상세 페이지 (NEW!)
- **더보기(>) 버튼**: 각 운동 섹션의 더보기 버튼 클릭 시 상세 페이지로 이동
- **2열 그리드 레이아웃**: 최적화된 운동 카드 표시
- **시간별 필터링**: All, 5-15 min, 15-30 min, 30+ min 필터 옵션
- **운동 상세 정보**: 제목, 제공자, 설명, 시간 표시
- **YouTube 플레이어 연동**: 각 운동 카드 클릭 시 유튜브 영상 재생
- **반응형 디자인**: 다양한 화면 크기에 대응
- **직관적 네비게이션**: 명확한 뒤로가기 및 검색/메뉴 버튼

### 👤 내 페이지 (My Page Tab)
- **사용자 프로필**: 원형 사진, 인증 배지, 이름, 레벨, XP 진행률
- **헬스 데이터 공유**: 데이터 공유 기능
- **주별 분석**: 4개 메트릭 (에너지 점수, 수면 시간, 운동 시간, 걸음 수)
- **배지 시스템**: 다양한 배지와 업적
- **개인 최고기록**: 최장 거리, 하프 마라톤 기록
- **도전 섹션**: 개인/팀 도전 요약
- **글로벌 도전**: 정글, 스노우 테마 도전

### 🎮 운동 명언 빙고 게임
- **50개 명언**: 운동과 노력에 대한 동기부여 명언
- **5x5 빙고판**: 1-50번 랜덤 숫자로 구성
- **실시간 업데이트**: 1분마다 자동으로 활동 데이터 증가
- **시간 기반 활동**: 하루 24시간을 기준으로 자연스러운 활동 패턴
- **지속성**: SharedPreferences를 통한 게임 상태 저장
- **애니메이션**: 폭죽 효과 및 도장 찍기 애니메이션

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
- **YouTube Player**: youtube_player_flutter
- **Samsung Health Data API**: samsung-health-data-api-1.0.0.aar (시뮬레이션 모드)

## 📦 주요 패키지

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  fl_chart: ^0.66.0
  percent_indicator: ^4.2.3
  shared_preferences: ^2.2.2
  youtube_player_flutter: ^9.1.2
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
- **YouTubePlayerPage**: 유튜브 플레이어
- **WorkoutSectionDetailPage**: 운동 섹션 상세 페이지 (NEW!)

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
- **일일 활동 카드**: 시간 기반 동적 활동 데이터 + 명언 빙고 게임 연결
- **수면 카드**: 수면 데이터 표시 및 상세 페이지 연결
- **내 운동 카드**: 운동 목록, 즐겨찾기 기능
- **에너지 점수 카드**: 에너지 점수 표시 및 상세 분석
- **수면 코칭 카드**: 수면 코칭 기능 연결
- **운동 기록 카드**: 운동 기록 표시 및 상세 페이지
- **걸음 수 카드**: 10,000보 목표 기반 실시간 진행률 표시

### 운동 관리 시스템
- **운동 목록**: 다양한 운동 카테고리별 분류
- **즐겨찾기**: 사용자별 즐겨찾기 운동 관리
- **운동 시작**: 타이머 기능이 포함된 운동 시작 페이지
- **운동 기록**: 과거 운동 기록 조회
- **운동 섹션 상세**: 각 섹션별 전체 운동 리스트 및 필터링

### 데이터 시각화
- **차트**: fl_chart를 활용한 다양한 차트 구현
- **진행률 바**: percent_indicator를 활용한 진행률 표시
- **게이지**: 원형/선형 진행률 표시
- **통계**: 주별 분석, 개인 최고기록 등

### 실시간 활동 데이터
- **시간 기반 증가**: 하루 24시간을 기준으로 자연스러운 활동 패턴
- **1분 타이머**: 실시간으로 활동 데이터 자동 업데이트
- **부드러운 전환**: 선형 보간을 통한 자연스러운 값 변화
- **WHO 권장 기준**: 10,000보 목표 (일일 권장 활동량)

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
│   ├── home_page.dart        # 홈 화면 (동적 활동 데이터)
│   ├── tab_pages/           # 탭 페이지들
│   │   ├── together_page.dart
│   │   ├── discover_page.dart
│   │   ├── fitness_page.dart
│   │   └── my_page.dart
│   └── detail_pages/        # 상세 페이지들
│       ├── daily_activity_detail_page.dart
│       ├── energy_score_detail_page.dart
│       ├── all_workouts_page.dart
│       ├── workout_start_page.dart
│       ├── sleep_coaching_start_page.dart
│       ├── workout_history_page.dart
│       ├── steps_detail_page.dart
│       ├── youtube_player_page.dart  # 유튜브 플레이어 페이지
│       └── workout_section_detail_page.dart  # 운동 섹션 상세 페이지 (NEW!)
├── services/
│   └── bingo_service.dart    # 빙고 게임 서비스
├── data/
│   ├── motivational_quotes.dart  # 50개 명언 데이터
│   └── youtube_workout_data.dart # 유튜브 운동 데이터 (150개)
└── widgets/
    ├── bingo_page.dart       # 빙고 게임 UI
    └── fireworks_animation.dart  # 폭죽 애니메이션
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
- ✅ **v0.2.7 (2024-12-29)**: 운동 섹션 상세 페이지 기능 추가 - 각 섹션별 전체 운동 리스트 그리드 뷰, 시간별 필터링, 2열 레이아웃 최적화
- ✅ **v0.2.6 (2024-12-29)**: 피트니스 탭 유튜브 기능 추가 - 실제 홈 트레이닝 유튜브 컨텐츠 150개 및 앱 내 플레이어 구현
- ✅ **v0.2.5 (2024-12-29)**: 모든 info 레벨 메시지 수정 및 코드 품질 개선
- ✅ **v0.2.4 (2024-12-29)**: 명언 표시 조건 개선 - 걸음 수 6000보 이상일 때 1번만 발생
- ✅ **동적 활동 데이터 시스템**: 시간 기반 자연스러운 활동 데이터 증가
- ✅ **운동 명언 빙고 게임**: 50개 명언, 5x5 빙고판, 지속성 있는 게임 시스템
- ✅ **10,000보 목표**: WHO 권장 일일 활동량 기준으로 업데이트
- ✅ **실시간 업데이트**: 1분 타이머로 자동 활동 데이터 갱신
- ✅ **내 페이지 완전 구현**: 사용자 프로필, 주별 분석, 배지, 도전 등
- ✅ **피트니스 페이지 완전 구현**: 15개 운동 섹션, 제공자 시스템
- ✅ **Discover 페이지 구현**: Health Hub 온보딩, 복잡한 배경 요소
- ✅ **투게더 페이지 구현**: 사용자 프로필, 도전 시스템
- ✅ **모든 상세 페이지 구현**: 에너지 점수, 운동, 수면 코칭, 운동 기록, 걸음 수
- ✅ **홈 화면 완성**: 7개 메인 카드 및 상세 페이지 연결
- ✅ **하단 네비게이션**: 5개 탭 완전 구현

### 주요 구현 사항
- **운동 섹션 상세 페이지**: 2열 그리드 레이아웃, 시간별 필터링, 최적화된 운동 카드 표시
- **동적 활동 시스템**: 시간 기반 자연스러운 활동 데이터 증가
- **빙고 게임 시스템**: 50개 명언, 지속성 있는 게임 상태 관리
- **실시간 타이머**: 1분마다 자동 업데이트되는 활동 데이터
- **895줄의 내 페이지 코드**: 완전한 사용자 프로필 시스템
- **444줄의 피트니스 페이지 코드**: 포괄적인 운동 콘텐츠 시스템 + 유튜브 플레이어 통합
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
