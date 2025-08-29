# Samsung Health Data API 1.0.0 - 클래스 구조 및 사용법

## 📋 개요

이 문서는 `samsung-health-data-api-1.0.0.aar` 파일의 클래스 구조와 사용법을 설명합니다. Samsung Health Data API는 삼성 헬스 앱과 연동하여 건강 데이터를 읽고 쓸 수 있는 Android 라이브러리입니다.

## 📦 패키지 구조

```
com.samsung.android.sdk.health.data/
├── HealthDataStore.class          # 메인 데이터 스토어 클래스
├── HealthDataService.class        # 헬스 데이터 서비스
├── DeviceManager.class            # 디바이스 관리자
├── IHealthDataStore.class         # 헬스 데이터 스토어 인터페이스
├── IHealthDataStore$Stub.class    # AIDL 스텁 클래스
├── IHealthDataStore$Default.class # AIDL 기본 구현
├── BuildConfig.class              # 빌드 설정
├── DataBinderMapperImpl.class     # 데이터 바인더 매퍼
├── DeviceManager.class            # 디바이스 관리자
├── a.class                        # 내부 유틸리티 클래스
├── b.class                        # 내부 유틸리티 클래스
├── c.class                        # 내부 유틸리티 클래스
└── [하위 패키지들]
    ├── aidl/                      # AIDL 인터페이스
    ├── data/                      # 데이터 모델
    ├── device/                    # 디바이스 관련
    ├── error/                     # 에러 처리
    ├── helper/                    # 헬퍼 클래스
    ├── internal/                  # 내부 구현
    ├── permission/                # 권한 관리
    ├── request/                   # 요청 모델
    └── response/                  # 응답 모델
```

## 🔧 주요 클래스 상세

### 1. HealthDataStore

**패키지**: `com.samsung.android.sdk.health.data`

**설명**: Samsung Health Data API의 핵심 클래스로, 헬스 데이터 스토어와의 연결을 관리합니다.

**주요 메서드**:
```kotlin
class HealthDataStore {
    companion object {
        fun getInstance(context: Context): HealthDataStore
    }
    
    // 연결 관리
    fun connect(activity: Activity)
    fun disconnect()
    fun isConnected(): Boolean
    
    // 데이터 접근
    fun getDataReader(): HealthDataReader?
    fun getDataWriter(): HealthDataWriter?
    
    // 권한 관리
    fun getPermissionManager(): HealthPermissionManager?
}
```

### 2. HealthDataService

**패키지**: `com.samsung.android.sdk.health.data`

**설명**: 헬스 데이터 서비스를 제공하는 클래스입니다.

**주요 기능**:
- 헬스 데이터 읽기/쓰기 서비스
- 실시간 데이터 스트리밍
- 배치 데이터 처리

### 3. DeviceManager

**패키지**: `com.samsung.android.sdk.health.data`

**설명**: 연결된 헬스 디바이스들을 관리하는 클래스입니다.

**주요 기능**:
- 연결된 디바이스 목록 조회
- 디바이스 상태 모니터링
- 디바이스 등록/해제

## 📁 하위 패키지 구조

### aidl/ - AIDL 인터페이스

**목적**: Android Interface Definition Language를 사용한 프로세스 간 통신

**주요 파일들**:
```
aidl/
├── com/samsung/android/sdk/health/data/
│   ├── device/Device.aidl                    # 디바이스 인터페이스
│   ├── internal/
│   │   ├── CompletableCallback.aidl         # 완료 콜백
│   │   ├── ConnectionResponse.aidl          # 연결 응답
│   │   ├── ErrorStatus.aidl                 # 에러 상태
│   │   ├── SingleCallback.aidl              # 단일 콜백
│   │   └── SingleResult.aidl                # 단일 결과
│   ├── permission/Permission.aidl           # 권한 인터페이스
│   ├── request/
│   │   ├── AggregateRequest.aidl            # 집계 요청
│   │   ├── AssociatedReadRequest.aidl       # 연관 읽기 요청
│   │   ├── ChangedDataRequest.aidl          # 변경 데이터 요청
│   │   ├── DeleteDataRequest.aidl           # 삭제 요청
│   │   ├── DeviceRegistrationRequest.aidl   # 디바이스 등록 요청
│   │   ├── InsertDataRequest.aidl           # 삽입 요청
│   │   ├── ReadDataRequest.aidl             # 읽기 요청
│   │   └── UpdateDataRequest.aidl           # 업데이트 요청
│   └── response/
│       ├── DataResponse.aidl                # 데이터 응답
│       └── DeviceResponse.aidl              # 디바이스 응답
```

### data/ - 데이터 모델

**목적**: 헬스 데이터의 구조와 타입을 정의

**주요 데이터 타입들**:
- **StepCountData**: 걸음수 데이터
- **SleepData**: 수면 데이터
- **HeartRateData**: 심박수 데이터
- **WeightData**: 체중 데이터
- **BloodPressureData**: 혈압 데이터
- **BloodGlucoseData**: 혈당 데이터

### permission/ - 권한 관리

**목적**: Samsung Health 데이터 접근 권한을 관리

**주요 기능**:
- 권한 요청
- 권한 상태 확인
- 권한 해제

### request/ - 요청 모델

**목적**: Samsung Health에 데이터를 요청할 때 사용하는 모델들

**주요 요청 타입들**:
- **ReadDataRequest**: 데이터 읽기 요청
- **InsertDataRequest**: 데이터 삽입 요청
- **UpdateDataRequest**: 데이터 업데이트 요청
- **DeleteDataRequest**: 데이터 삭제 요청
- **AggregateRequest**: 데이터 집계 요청

### response/ - 응답 모델

**목적**: Samsung Health로부터 받는 응답 데이터의 구조

**주요 응답 타입들**:
- **DataResponse**: 일반 데이터 응답
- **DeviceResponse**: 디바이스 관련 응답

## 🔐 권한 시스템

### 필요한 권한들

```xml
<!-- AndroidManifest.xml -->
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="com.samsung.android.health.permission.read" />
<uses-permission android:name="com.samsung.android.health.permission.write" />
```

### 권한 요청 프로세스

1. **권한 확인**: `HealthPermissionManager.hasPermission()`
2. **권한 요청**: `HealthPermissionManager.requestPermission()`
3. **권한 결과 처리**: 콜백을 통한 결과 수신

## 📊 데이터 타입별 사용법

### 1. 걸음수 데이터

```kotlin
// 걸음수 데이터 읽기
val stepCountRequest = ReadDataRequest.Builder()
    .setDataType(HealthConstants.StepCount.DATA_TYPE)
    .setStartTime(startTime)
    .setEndTime(endTime)
    .build()

val stepCountData = healthDataStore.readData(stepCountRequest)
```

### 2. 수면 데이터

```kotlin
// 수면 데이터 읽기
val sleepRequest = ReadDataRequest.Builder()
    .setDataType(HealthConstants.Sleep.DATA_TYPE)
    .setStartTime(startTime)
    .setEndTime(endTime)
    .build()

val sleepData = healthDataStore.readData(sleepRequest)
```

### 3. 심박수 데이터

```kotlin
// 심박수 데이터 읽기
val heartRateRequest = ReadDataRequest.Builder()
    .setDataType(HealthConstants.HeartRate.DATA_TYPE)
    .setStartTime(startTime)
    .setEndTime(endTime)
    .build()

val heartRateData = healthDataStore.readData(heartRateRequest)
```

## 🔄 연결 및 인증

### 1. 초기화

```kotlin
// HealthDataStore 초기화
val healthDataStore = HealthDataStore.getInstance(context)

// 연결 리스너 설정
healthDataStore.setConnectionListener(object : ConnectionListener {
    override fun onConnected() {
        // 연결 성공
    }
    
    override fun onDisconnected() {
        // 연결 해제
    }
    
    override fun onError(error: String) {
        // 에러 발생
    }
})
```

### 2. 연결

```kotlin
// Samsung Health 연결
healthDataStore.connect(activity)
```

### 3. 연결 해제

```kotlin
// 연결 해제
healthDataStore.disconnect()
```

## ⚠️ 에러 처리

### 주요 에러 타입들

1. **연결 에러**: Samsung Health 앱이 설치되지 않았거나 연결할 수 없는 경우
2. **권한 에러**: 필요한 권한이 없는 경우
3. **데이터 에러**: 데이터 읽기/쓰기 중 발생하는 에러
4. **네트워크 에러**: 인터넷 연결 문제

### 에러 처리 예시

```kotlin
try {
    val data = healthDataStore.readData(request)
    // 데이터 처리
} catch (e: HealthDataException) {
    when (e.errorCode) {
        HealthDataException.PERMISSION_DENIED -> {
            // 권한 요청
        }
        HealthDataException.DATA_NOT_FOUND -> {
            // 데이터 없음 처리
        }
        else -> {
            // 기타 에러 처리
        }
    }
}
```

## 📱 AndroidManifest.xml 설정

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.samsung.android.sdk.health.data">

    <uses-sdk android:minSdkVersion="29" />

    <queries>
        <package android:name="com.sec.android.app.shealth" />
        <package android:name="com.samsung.android.wear.shealth" />
    </queries>

    <uses-permission android:name="android.permission.INTERNET" />

</manifest>
```

## 🔧 빌드 설정

### build.gradle.kts

```kotlin
dependencies {
    // Samsung Health Data AAR
    implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.aar"))))
    
    // Samsung Health SDK dependencies
    implementation("com.google.android.gms:play-services-auth:20.7.0")
    implementation("com.google.code.gson:gson:2.10.1")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
}
```

## 📋 사용 제한사항

### 지원 플랫폼
- **Android**: API 29 (Android 10) 이상
- **Samsung Health**: 최신 버전 필요
- **디바이스**: Samsung 디바이스 권장

### 라이선스
- Samsung Health Platform 라이선스 필요
- 개발자 등록 및 API 키 발급 필요

## 🚀 다음 단계

### 실제 구현을 위한 준비사항

1. **Samsung Health Platform 가입**
   - https://developer.samsung.com/health 에서 가입
   - 개발자 계정 생성

2. **API 키 발급**
   - 프로젝트 생성
   - API 키 및 시크릿 발급

3. **실제 API 연결**
   - 주석 처리된 import 해제
   - 실제 API 키 설정
   - 에러 처리 강화

4. **테스트**
   - 실제 Samsung 디바이스에서 테스트
   - 다양한 데이터 타입 테스트

## 📚 참고 자료

- [Samsung Health Platform](https://developer.samsung.com/health)
- [Samsung Health API 문서](https://developer.samsung.com/health/android)
- [Android AIDL 가이드](https://developer.android.com/guide/components/aidl)

---

**버전**: 1.0.0  
**최종 업데이트**: 2024년  
**작성자**: Samsung Health Clone Project
