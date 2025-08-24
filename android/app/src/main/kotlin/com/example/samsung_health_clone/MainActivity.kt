package com.example.samsung_health_clone


import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log
import android.app.Activity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "samsung_health_check"
        private const val TAG = "MainActivity"
    }

    private lateinit var healthStoreManager: HealthStoreManager
    private lateinit var permissionHelper: HealthPermissionHelper

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {

                "connectHealthStore" -> {
                    try {
                        healthStoreManager.connect(this)
                        result.success("HealthStore 연결 시도")
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "disconnectHealthStore" -> {
                    try {
                        healthStoreManager.disconnect()
                        result.success("HealthStore 연결 해제")
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "isHealthStoreConnected" -> {
                    result.success(healthStoreManager.isConnected())
                }
                "requestStepCountPermission" -> {
                    try {
                        healthStoreManager.requestPermission(this, PermissionType.STEP_COUNT)
                        result.success("걸음수 권한 요청 완료")
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "requestSleepPermission" -> {
                    try {
                        healthStoreManager.requestPermission(this, PermissionType.SLEEP)
                        result.success("수면 권한 요청 완료")
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "requestHeartRatePermission" -> {
                    try {
                        healthStoreManager.requestPermission(this, PermissionType.HEART_RATE)
                        result.success("심박수 권한 요청 완료")
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "requestWeightPermission" -> {
                    try {
                        healthStoreManager.requestPermission(this, PermissionType.WEIGHT)
                        result.success("체중 권한 요청 완료")
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "hasStepCountPermission" -> {
                    result.success(healthStoreManager.hasPermission(PermissionType.STEP_COUNT))
                }
                "hasSleepPermission" -> {
                    result.success(healthStoreManager.hasPermission(PermissionType.SLEEP))
                }
                "hasHeartRatePermission" -> {
                    result.success(healthStoreManager.hasPermission(PermissionType.HEART_RATE))
                }
                "hasWeightPermission" -> {
                    result.success(healthStoreManager.hasPermission(PermissionType.WEIGHT))
                }
                "readStepCount" -> {
                    try {
                        val startTime = call.argument<Long>("startTime") ?: 0L
                        val endTime = call.argument<Long>("endTime") ?: System.currentTimeMillis()
                        val stepData = healthStoreManager.readStepCount(startTime, endTime)
                        result.success(stepData.map { 
                            mapOf(
                                "startTime" to it.startTime,
                                "endTime" to it.endTime,
                                "stepCount" to it.stepCount
                            )
                        })
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "readSleepData" -> {
                    try {
                        val startTime = call.argument<Long>("startTime") ?: 0L
                        val endTime = call.argument<Long>("endTime") ?: System.currentTimeMillis()
                        val sleepData = healthStoreManager.readSleepData(startTime, endTime)
                        result.success(sleepData.map { 
                            mapOf(
                                "startTime" to it.startTime,
                                "endTime" to it.endTime,
                                "sleepType" to it.sleepType.name,
                                "duration" to it.duration
                            )
                        })
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "readHeartRate" -> {
                    try {
                        val startTime = call.argument<Long>("startTime") ?: 0L
                        val endTime = call.argument<Long>("endTime") ?: System.currentTimeMillis()
                        val heartRateData = healthStoreManager.readHeartRate(startTime, endTime)
                        result.success(heartRateData.map { 
                            mapOf(
                                "timestamp" to it.timestamp,
                                "heartRate" to it.heartRate
                            )
                        })
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                "writeWeight" -> {
                    try {
                        val weight = call.argument<Float>("weight") ?: 0f
                        val timestamp = call.argument<Long>("timestamp") ?: System.currentTimeMillis()
                        healthStoreManager.writeWeight(weight, timestamp)
                        result.success("체중 데이터 쓰기 완료")
                    } catch (e: Exception) {
                        result.error("HEALTH_STORE_ERROR", e.message, null)
                    }
                }
                // 새로운 권한 관리 메서드들
                "requestAllPermissions" -> {
                    try {
                        permissionHelper.requestAllPermissions(this, object : HealthPermissionHelper.PermissionCallback {
                            override fun onPermissionGranted(permissions: List<String>) {
                                result.success("모든 권한이 승인되었습니다")
                            }
                            override fun onPermissionDenied(permissions: List<String>) {
                                result.error("PERMISSION_DENIED", "권한이 거부되었습니다", null)
                            }
                            override fun onPermissionError(error: String) {
                                result.error("PERMISSION_ERROR", error, null)
                            }
                        })
                    } catch (e: Exception) {
                        result.error("PERMISSION_ERROR", e.message, null)
                    }
                }
                "requestStepCountPermission" -> {
                    try {
                        permissionHelper.requestPermission(this, HealthPermissionHelper.PERMISSION_STEP_COUNT, object : HealthPermissionHelper.PermissionCallback {
                            override fun onPermissionGranted(permissions: List<String>) {
                                result.success("걸음수 권한이 승인되었습니다")
                            }
                            override fun onPermissionDenied(permissions: List<String>) {
                                result.error("PERMISSION_DENIED", "걸음수 권한이 거부되었습니다", null)
                            }
                            override fun onPermissionError(error: String) {
                                result.error("PERMISSION_ERROR", error, null)
                            }
                        })
                    } catch (e: Exception) {
                        result.error("PERMISSION_ERROR", e.message, null)
                    }
                }
                "requestSleepPermission" -> {
                    try {
                        permissionHelper.requestPermission(this, HealthPermissionHelper.PERMISSION_SLEEP, object : HealthPermissionHelper.PermissionCallback {
                            override fun onPermissionGranted(permissions: List<String>) {
                                result.success("수면 권한이 승인되었습니다")
                            }
                            override fun onPermissionDenied(permissions: List<String>) {
                                result.error("PERMISSION_DENIED", "수면 권한이 거부되었습니다", null)
                            }
                            override fun onPermissionError(error: String) {
                                result.error("PERMISSION_ERROR", error, null)
                            }
                        })
                    } catch (e: Exception) {
                        result.error("PERMISSION_ERROR", e.message, null)
                    }
                }
                "requestWeightPermission" -> {
                    try {
                        permissionHelper.requestPermission(this, HealthPermissionHelper.PERMISSION_WEIGHT, object : HealthPermissionHelper.PermissionCallback {
                            override fun onPermissionGranted(permissions: List<String>) {
                                result.success("체중 권한이 승인되었습니다")
                            }
                            override fun onPermissionDenied(permissions: List<String>) {
                                result.error("PERMISSION_DENIED", "체중 권한이 거부되었습니다", null)
                            }
                            override fun onPermissionError(error: String) {
                                result.error("PERMISSION_ERROR", error, null)
                            }
                        })
                    } catch (e: Exception) {
                        result.error("PERMISSION_ERROR", e.message, null)
                    }
                }
                "hasAllPermissions" -> {
                    result.success(permissionHelper.hasAllPermissions())
                }
                "hasStepCountPermission" -> {
                    result.success(permissionHelper.hasPermission(HealthPermissionHelper.PERMISSION_STEP_COUNT))
                }
                "hasSleepPermission" -> {
                    result.success(permissionHelper.hasPermission(HealthPermissionHelper.PERMISSION_SLEEP))
                }
                "hasWeightPermission" -> {
                    result.success(permissionHelper.hasPermission(HealthPermissionHelper.PERMISSION_WEIGHT))
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // HealthStoreManager 초기화
        healthStoreManager = HealthStoreManager.getInstance(this)
        
        // PermissionHelper 초기화
        permissionHelper = HealthPermissionHelper.getInstance(this)

        // 연결 콜백 설정
        healthStoreManager.setConnectionCallback(object : HealthStoreManager.ConnectionCallback {
            override fun onConnected() {
                Log.d(TAG, "HealthStoreManager 연결 성공")
                Toast.makeText(this@MainActivity, "HealthStoreManager 연결 성공", Toast.LENGTH_SHORT).show()
            }

            override fun onDisconnected() {
                Log.d(TAG, "HealthStoreManager 연결 해제")
                Toast.makeText(this@MainActivity, "HealthStoreManager 연결 해제", Toast.LENGTH_SHORT).show()
            }

            override fun onError(error: String) {
                Log.e(TAG, "HealthStoreManager 오류: $error")
                Toast.makeText(this@MainActivity, "HealthStoreManager 오류: $error", Toast.LENGTH_LONG).show()
            }
        })
    }


}
