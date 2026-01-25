package com.example.flutter_app_wearhouse

import android.content.ContentValues
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.io.OutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.flutter_app_wearhouse/pdf_service"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "savePdfToDownloads" -> {
                    val fileName = call.argument<String>("fileName")
                    val bytes = call.argument<ByteArray>("bytes")
                    
                    if (fileName == null || bytes == null) {
                        result.error("INVALID_ARGUMENT", "FileName and bytes are required", null)
                        return@setMethodCallHandler
                    }
                    
                    try {
                        val uri = savePdfToDownloads(fileName, bytes)
                        if (uri != null) {
                            result.success(uri.toString())
                        } else {
                            result.error("SAVE_FAILED", "Failed to save PDF to Downloads", null)
                        }
                    } catch (e: Exception) {
                        result.error("EXCEPTION", e.message, null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun savePdfToDownloads(fileName: String, bytes: ByteArray): android.net.Uri? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            // Android 10+ (API 29+) - Use MediaStore
            savePdfUsingMediaStore(fileName, bytes)
        } else {
            // Android 9 and below - Use direct file system access
            savePdfUsingFileSystem(fileName, bytes)
        }
    }

    @Suppress("DEPRECATION")
    private fun savePdfUsingFileSystem(fileName: String, bytes: ByteArray): android.net.Uri? {
        try {
            val downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
            if (!downloadsDir.exists()) {
                downloadsDir.mkdirs()
            }
            
            val file = File(downloadsDir, fileName)
            FileOutputStream(file).use { fos ->
                fos.write(bytes)
            }
            
            return android.net.Uri.fromFile(file)
        } catch (e: Exception) {
            e.printStackTrace()
            return null
        }
    }

    private fun savePdfUsingMediaStore(fileName: String, bytes: ByteArray): android.net.Uri? {
        val contentValues = ContentValues().apply {
            put(MediaStore.Downloads.DISPLAY_NAME, fileName)
            put(MediaStore.Downloads.MIME_TYPE, "application/pdf")
            put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
        }

        val resolver = contentResolver
        val uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, contentValues)
        
        uri?.let {
            try {
                resolver.openOutputStream(it)?.use { outputStream: OutputStream ->
                    outputStream.write(bytes)
                }
                return it
            } catch (e: Exception) {
                e.printStackTrace()
                // Delete the entry if writing failed
                resolver.delete(it, null, null)
                return null
            }
        }
        
        return null
    }
}
