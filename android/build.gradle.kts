group = "com.example.notification_cleaner"
version = "2.0.0"

plugins {
    id("com.android.library")
    kotlin("android")
}

android {
    namespace = "com.example.notification_cleaner"
    compileSdk = 36

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
    }

    kotlinOptions {
        jvmTarget = "21"
    }

    defaultConfig {
        minSdk = 21
    }

    lint {
        disable += "InvalidPackage"
    }
}

dependencies {
    implementation("androidx.annotation:annotation:1.9.1")
}
