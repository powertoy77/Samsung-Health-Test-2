# Samsung Health Clone

삼성 헬스 앱의 UI를 Flutter로 구현한 클론 프로젝트입니다.

## 📱 프로젝트 개요

이 프로젝트는 삼성 헬스 앱의 메인 화면을 Flutter로 구현한 것입니다. 실제 삼성 헬스 앱과 동일한 디자인과 레이아웃을 제공하며, **Daily Activity Detail Page** 기능이 포함되어 있습니다.

## 🚀 바로 시작하기

### 📲 APK 다운로드
**Android 기기에서 바로 설치하세요!**

[📥 Samsung Health Clone APK 다운로드](samsung-health-clone.apk)

> **설치 방법:**
> 1. 위 링크를 클릭하여 APK 파일을 다운로드
> 2. Android 기기에서 "알 수 없는 소스" 설치 허용
> 3. 다운로드된 APK 파일을 탭하여 설치
> 4. 앱 실행 및 사용

## ✨ 주요 기능

### 🏠 메인 화면 구성
- **헤더 섹션**: Samsung Health 로고 및 연결 상태 표시
- **활동 요약 카드**: 걸음 수, 활동 시간, 소모 칼로리 표시 ⭐ **탭 가능**
- **수면 점수 카드**: 수면 점수 및 수면 시간 정보
- **활동 바로가기**: 걷기, 수영, 달리기, 더보기 버튼
- **에너지 점수 카드**: 에너지 점수 및 구름 캐릭터
- **수면 코칭 카드**: 수면 동물 유형 확인 안내
- **주간 운동 기록**: 운동 시작 유도 메시지
- **걸음 목표 진행률**: 목표 대비 현재 진행률 표시
- **하단 네비게이션**: 홈, 투게더, Discover, 피트니스, 내 페이지

### 🎯 Daily Activity Detail Page (신규 기능)
**메인 화면의 활동 요약 카드를 탭하면 이동하는 상세 화면**

#### 📊 주요 구성 요소:
1. **날짜 선택기**: 좌우 화살표 또는 캘린더로 날짜 변경
2. **원형 진행률 표시기**: 3겹의 동심원으로 활동 목표 진행률 시각화
   - 가장 바깥쪽: 걸음 수 (967/6,000) - 초록색
   - 중간: 활동 시간 (10/90분) - 파란색
   - 가장 안쪽: 활동 칼로리 (38/500kcal) - 분홍색
3. **활동 지표**: 아이콘과 함께 현재 값/목표 값 표시
4. **요약 정보**: 총 칼로리 소모량 (976 kcal), 이동 거리 (0.76 km)
5. **활동 상세**: 각 항목별 진행률 바
6. **주간 기록**: 일주일간 걸음 수 막대 그래프

#### 🎨 디자인 특징:
- **Material Design 3** 적용
- **원형 진행률 표시기** (percent_indicator 패키지)
- **색상 코딩**: 걸음 수(초록), 시간(파란), 칼로리(분홍)
- **그림자 효과**와 **둥근 모서리**
- **반응형 레이아웃**

### 🎨 디자인 특징
- Material Design 3 적용
- Google Fonts (Noto Sans) 사용
- 그림자 효과로 카드 디자인
- 초록색 기반 색상 테마
- 반응형 레이아웃

## 🛠 기술 스택

- **Framework**: Flutter 3.9.0+
- **Language**: Dart
- **UI**: Material Design 3
- **Fonts**: Google Fonts (Noto Sans)
- **Charts**: fl_chart (향후 확장용)
- **Progress Indicators**: percent_indicator

## 📦 설치 및 실행

### 필수 요구사항
- Flutter SDK 3.9.0 이상
- Dart SDK
- Android Studio / VS Code

### 설치 방법

1. 저장소 클론
```bash
git clone https://github.com/powertoy77/Samsung-Health-Test-2.git
cd Samsung-Health-Test-2
```

2. 의존성 설치
```bash
flutter pub get
```

3. 앱 실행
```bash
flutter run
```

### APK 빌드
```bash
flutter build apk --release
```

## 📁 프로젝트 구조

```
samsung_health_clone/
├── lib/
│   └── main.dart              # 메인 앱 파일 (Daily Activity Detail Page 포함)
├── android/                   # Android 플랫폼 설정
├── ios/                      # iOS 플랫폼 설정
├── web/                      # Web 플랫폼 설정
├── pubspec.yaml              # 프로젝트 의존성
├── samsung-health-clone.apk  # Android APK 파일 (최신 버전)
└── README.md                 # 프로젝트 문서
```

## 🎯 구현된 화면

### 메인 화면 구성 요소
1. **헤더**: Samsung Health 로고와 연결 상태
2. **활동 요약**: 713 걸음, 7분, 27 kcal ⭐ **탭하여 상세 화면 이동**
3. **수면 점수**: 78점 (좋음), 7시간 33분 수면
4. **활동 바로가기**: 4개 활동 버튼
5. **에너지 점수**: 86점, 구름 캐릭터
6. **수면 코칭**: 동물 캐릭터와 안내 메시지
7. **주간 운동**: 운동 시작 유도
8. **걸음 목표**: 713/6,000 (11% 진행률)
9. **하단 네비게이션**: 5개 탭

### Daily Activity Detail Page (신규)
- **날짜 선택**: 8월 24일 기준
- **원형 진행률**: 3겹 동심원 시각화
- **활동 데이터**: 967 걸음, 10분, 38 kcal
- **상세 정보**: 976 kcal 총 소모, 0.76 km 이동
- **주간 기록**: 월~일요일 걸음 수 그래프

## 🔧 개발 환경 설정

### Flutter 설치
```bash
# Flutter SDK 다운로드 및 설치
flutter doctor
```

### IDE 설정
- Android Studio 또는 VS Code 설치
- Flutter 및 Dart 플러그인 설치

## 📱 지원 플랫폼

- ✅ Android (APK 제공)
- ✅ iOS
- ✅ Web
- ✅ Windows (예정)
- ✅ macOS (예정)
- ✅ Linux (예정)

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

## 🙏 감사의 말

- 삼성전자 - 원본 Samsung Health 앱 디자인 참고
- Flutter 팀 - 훌륭한 프레임워크 제공
- Google Fonts - Noto Sans 폰트 제공

## 📞 연락처

프로젝트에 대한 문의사항이 있으시면 이슈를 생성해 주세요.

---

**참고**: 이 프로젝트는 교육 및 학습 목적으로 제작되었으며, 상업적 용도로 사용하지 마세요.
