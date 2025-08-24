# Samsung Health Clone

삼성 헬스 앱의 UI를 Flutter로 구현한 클론 프로젝트입니다.

## 📱 프로젝트 개요

이 프로젝트는 삼성 헬스 앱의 메인 화면을 Flutter로 구현한 것입니다. 실제 삼성 헬스 앱과 동일한 디자인과 레이아웃을 제공합니다.

## ✨ 주요 기능

### 🏠 메인 화면 구성
- **헤더 섹션**: Samsung Health 로고 및 연결 상태 표시
- **활동 요약 카드**: 걸음 수, 활동 시간, 소모 칼로리 표시
- **수면 점수 카드**: 수면 점수 및 수면 시간 정보
- **활동 바로가기**: 걷기, 수영, 달리기, 더보기 버튼
- **에너지 점수 카드**: 에너지 점수 및 구름 캐릭터
- **수면 코칭 카드**: 수면 동물 유형 확인 안내
- **주간 운동 기록**: 운동 시작 유도 메시지
- **걸음 목표 진행률**: 목표 대비 현재 진행률 표시
- **하단 네비게이션**: 홈, 투게더, Discover, 피트니스, 내 페이지

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
git clone https://github.com/your-username/samsung-health-clone.git
cd samsung-health-clone
```

2. 의존성 설치
```bash
flutter pub get
```

3. 앱 실행
```bash
flutter run
```

## 📁 프로젝트 구조

```
samsung_health_clone/
├── lib/
│   └── main.dart              # 메인 앱 파일
├── android/                   # Android 플랫폼 설정
├── ios/                      # iOS 플랫폼 설정
├── web/                      # Web 플랫폼 설정
├── pubspec.yaml              # 프로젝트 의존성
└── README.md                 # 프로젝트 문서
```

## 🎯 구현된 화면

### 메인 화면 구성 요소
1. **헤더**: Samsung Health 로고와 연결 상태
2. **활동 요약**: 713 걸음, 7분, 27 kcal
3. **수면 점수**: 78점 (좋음), 7시간 33분 수면
4. **활동 바로가기**: 4개 활동 버튼
5. **에너지 점수**: 86점, 구름 캐릭터
6. **수면 코칭**: 동물 캐릭터와 안내 메시지
7. **주간 운동**: 운동 시작 유도
8. **걸음 목표**: 713/6,000 (11% 진행률)
9. **하단 네비게이션**: 5개 탭

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

- ✅ Android
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
