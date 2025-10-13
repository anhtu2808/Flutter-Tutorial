plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.to_do_app_flutter"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.to_do_app_flutter"
        minSdk = flutter.minSdkVersion
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        // ✅ Bật hỗ trợ desugar (cho các API Java mới)
        isCoreLibraryDesugaringEnabled = true

        // ✅ Cập nhật version Java lên 11 để tránh cảnh báo
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        // ✅ Đồng bộ JVM target với Java 11
        jvmTarget = "11"
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
    implementation(kotlin("stdlib"))
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}

flutter {
    source = "../.."
}
