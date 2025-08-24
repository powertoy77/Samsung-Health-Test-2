package com.example.samsung_health_clone

import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log
import android.app.Activity

class MainActivity : FlutterActivity() {

    companion object {
        private const val SAMSUNG_HEALTH_PACKAGE = "com.sec.android.app.health"
        private const val MIN_SAMSUNG_HEALTH_VERSION = 6.25f
        private const val CHANNEL = "samsung_health_check"
        private const val TAG = "MainActivity"
    }

    private lateinit var healthStoreManager: HealthStoreManager

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkSamsungHealth" -> {
                    try {
                        checkSamsungHealthAvailability()
                        result.success("Samsung Health 확인 완료")
                    } catch (e: Exception) {
                        result.error("SAMSUNG_HEALTH_ERROR", e.message, null)
                    }
                }
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

        checkSamsungHealthAvailability()
    }

    private fun checkSamsungHealthAvailability() {
        try {
            val packageInfo = packageManager.getPackageInfo(SAMSUNG_HEALTH_PACKAGE, 0)
            val versionName = packageInfo.versionName ?: ""

            val versionNumber = extractVersionNumber(versionName)

            if (versionNumber < MIN_SAMSUNG_HEALTH_VERSION) {
                showSamsungHealthUpdateDialog()
            } else {
                println("Samsung Health 확인 완료: 버전 $versionName")

                // Samsung Health SDK 연결 시도
                try {
                    healthStoreManager.connect(this)
                } catch (e: Exception) {
                    Log.e(TAG, "Samsung Health SDK 연결 실패: ${e.message}")
                }
            }

        } catch (e: PackageManager.NameNotFoundException) {
            showSamsungHealthInstallDialog()
        } catch (e: Exception) {
            val errorMessage = "Samsung Health 확인 중 오류 발생: ${e.message}"
            println(errorMessage)
            Toast.makeText(this, errorMessage, Toast.LENGTH_LONG).show()
        }
    }

    private fun extractVersionNumber(versionName: String): Float {
        return try {
            val versionParts = versionName.split(".")
            if (versionParts.size >= 2) {
                "${versionParts[0]}.${versionParts[1]}".toFloat()
            } else {
                versionName.toFloat()
            }
        } catch (e: NumberFormatException) {
            0.0f
        }
    }

    private fun showSamsungHealthInstallDialog() {
        try {
            val intent = Intent(Intent.ACTION_VIEW).apply {
                data = Uri.parse("market://details?id=$SAMSUNG_HEALTH_PACKAGE")
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }

            if (intent.resolveActivity(packageManager) != null) {
                startActivity(intent)
            } else {
                val webIntent = Intent(Intent.ACTION_VIEW).apply {
                    data = Uri.parse("https://play.google.com/store/apps/details?id=$SAMSUNG_HEALTH_PACKAGE")
                    addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                }
                startActivity(webIntent)
            }

        } catch (e: Exception) {
            val errorMessage = "Samsung Health 설치 페이지 이동 실패: ${e.message}"
            println(errorMessage)
            Toast.makeText(this, errorMessage, Toast.LENGTH_LONG).show()
        }
    }

    private fun showSamsungHealthUpdateDialog() {
        try {
            val intent = Intent(Intent.ACTION_VIEW).apply {
                data = Uri.parse("market://details?id=$SAMSUNG_HEALTH_PACKAGE")
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }

            if (intent.resolveActivity(packageManager) != null) {
                startActivity(intent)
            } else {
                val webIntent = Intent(Intent.ACTION_VIEW).apply {
                    data = Uri.parse("https://play.google.com/store/apps/details?id=$SAMSUNG_HEALTH_PACKAGE")
                    addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                }
                startActivity(webIntent)
            }

        } catch (e: Exception) {
            val errorMessage = "Samsung Health 업데이트 페이지 이동 실패: ${e.message}"
            println(errorMessage)
            Toast.makeText(this, errorMessage, Toast.LENGTH_LONG).show()
        }
    }
}
