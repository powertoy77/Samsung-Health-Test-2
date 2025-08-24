package com.example.samsung_health_clone

import android.app.Activity
import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.Settings
import android.util.Log
import android.widget.Toast

/**
 * Samsung Health 권한 관리 헬퍼 클래스
 * 걸음읽기, 수면읽기, 체중쓰기 권한을 관리합니다.
 */
class HealthPermissionHelper private constructor(private val context: Context) {
    
    companion object {
        private const val TAG = "HealthPermissionHelper"
        
        @Volatile
        private var INSTANCE: HealthPermissionHelper? = null
        
        fun getInstance(context: Context): HealthPermissionHelper {
            return INSTANCE ?: synchronized(this) {
                INSTANCE ?: HealthPermissionHelper(context.applicationContext).also { INSTANCE = it }
            }
        }
        
        // Samsung Health 권한 상수
        const val PERMISSION_STEP_COUNT = "com.samsung.shealth.step_count"
        const val PERMISSION_SLEEP = "com.samsung.shealth.sleep"
        const val PERMISSION_WEIGHT = "com.samsung.shealth.weight"
        
        // 권한 요청 코드
        const val REQUEST_CODE_STEP_COUNT = 1001
        const val REQUEST_CODE_SLEEP = 1002
        const val REQUEST_CODE_WEIGHT = 1003
        const val REQUEST_CODE_ALL_PERMISSIONS = 1004
    }
    
    // 권한 상태 저장
    private val permissionStatus = mutableMapOf<String, Boolean>()
    
    /**
     * 모든 필요한 권한을 요청합니다.
     */
    fun requestAllPermissions(activity: Activity, callback: PermissionCallback) {
        Log.d(TAG, "모든 권한 요청 시작")
        
        val permissions = listOf(
            PERMISSION_STEP_COUNT,
            PERMISSION_SLEEP,
            PERMISSION_WEIGHT
        )
        
        requestPermissions(activity, permissions, callback)
    }
    
    /**
     * 특정 권한을 요청합니다.
     */
    fun requestPermission(activity: Activity, permission: String, callback: PermissionCallback) {
        Log.d(TAG, "권한 요청: $permission")
        
        requestPermissions(activity, listOf(permission), callback)
    }
    
    /**
     * 권한 요청 처리
     */
    private fun requestPermissions(activity: Activity, permissions: List<String>, callback: PermissionCallback) {
        try {
            // Samsung Health 권한 요청 다이얼로그 표시
            showPermissionRequestDialog(activity, permissions) { granted ->
                if (granted) {
                    // 권한이 승인된 경우
                    permissions.forEach { permission ->
                        permissionStatus[permission] = true
                    }
                    Log.d(TAG, "권한 승인됨: $permissions")
                    Toast.makeText(context, "권한이 승인되었습니다.", Toast.LENGTH_SHORT).show()
                    callback.onPermissionGranted(permissions)
                } else {
                    // 권한이 거부된 경우
                    Log.d(TAG, "권한 거부됨: $permissions")
                    showPermissionDeniedDialog(activity, permissions, callback)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "권한 요청 실패: ${e.message}")
            callback.onPermissionError(e.message ?: "권한 요청 실패")
        }
    }
    
    /**
     * 권한 요청 다이얼로그 표시
     */
    private fun showPermissionRequestDialog(
        activity: Activity,
        permissions: List<String>,
        onResult: (Boolean) -> Unit
    ) {
        val permissionNames = permissions.map { getPermissionDisplayName(it) }
        val message = "다음 권한이 필요합니다:\n\n${permissionNames.joinToString("\n")}\n\n계속하시겠습니까?"
        
        AlertDialog.Builder(activity)
            .setTitle("권한 요청")
            .setMessage(message)
            .setPositiveButton("허용") { _, _ ->
                onResult(true)
            }
            .setNegativeButton("거부") { _, _ ->
                onResult(false)
            }
            .setCancelable(false)
            .show()
    }
    
    /**
     * 권한 거부 시 가이드 다이얼로그 표시
     */
    private fun showPermissionDeniedDialog(
        activity: Activity,
        permissions: List<String>,
        callback: PermissionCallback
    ) {
        val permissionNames = permissions.map { getPermissionDisplayName(it) }
        val message = "다음 권한이 거부되었습니다:\n\n${permissionNames.joinToString("\n")}\n\n" +
                "이 기능을 사용하려면 권한이 필요합니다. 설정에서 권한을 허용해주세요."
        
        AlertDialog.Builder(activity)
            .setTitle("권한 필요")
            .setMessage(message)
            .setPositiveButton("설정으로 이동") { _, _ ->
                openAppSettings(activity)
                callback.onPermissionDenied(permissions)
            }
            .setNegativeButton("재시도") { _, _ ->
                // 재시도 로직
                requestPermissions(activity, permissions, callback)
            }
            .setNeutralButton("취소") { _, _ ->
                callback.onPermissionDenied(permissions)
            }
            .setCancelable(false)
            .show()
    }
    
    /**
     * 앱 설정 화면으로 이동
     */
    private fun openAppSettings(activity: Activity) {
        try {
            val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
                data = Uri.fromParts("package", activity.packageName, null)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            activity.startActivity(intent)
            Toast.makeText(context, "설정에서 권한을 허용해주세요.", Toast.LENGTH_LONG).show()
        } catch (e: Exception) {
            Log.e(TAG, "설정 화면 이동 실패: ${e.message}")
            Toast.makeText(context, "설정 화면을 열 수 없습니다.", Toast.LENGTH_SHORT).show()
        }
    }
    
    /**
     * 권한 상태 확인
     */
    fun hasPermission(permission: String): Boolean {
        return permissionStatus[permission] ?: false
    }
    
    /**
     * 모든 권한 상태 확인
     */
    fun hasAllPermissions(): Boolean {
        val requiredPermissions = listOf(PERMISSION_STEP_COUNT, PERMISSION_SLEEP, PERMISSION_WEIGHT)
        return requiredPermissions.all { hasPermission(it) }
    }
    
    /**
     * 권한 표시 이름 반환
     */
    private fun getPermissionDisplayName(permission: String): String {
        return when (permission) {
            PERMISSION_STEP_COUNT -> "• 걸음수 읽기 권한"
            PERMISSION_SLEEP -> "• 수면 데이터 읽기 권한"
            PERMISSION_WEIGHT -> "• 체중 데이터 쓰기 권한"
            else -> "• $permission"
        }
    }
    
    /**
     * 권한 콜백 인터페이스
     */
    interface PermissionCallback {
        fun onPermissionGranted(permissions: List<String>)
        fun onPermissionDenied(permissions: List<String>)
        fun onPermissionError(error: String)
    }
}
