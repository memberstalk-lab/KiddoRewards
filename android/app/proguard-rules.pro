# --- PLAY CORE (SplitInstall, Dynamic Features) ---
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

# --- FLUTTER ---
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }
-dontwarn io.flutter.embedding.**

# --- ANDROIDX / LIFECYCLE ---
-keep class androidx.lifecycle.** { *; }
-dontwarn androidx.lifecycle.**

# --- FIREBASE (eğer varsa) ---
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# --- REVENUECAT (kullanıyorsan) ---
-keep class com.revenuecat.** { *; }
-dontwarn com.revenuecat.**

# --- KOTLIN ---
-dontwarn kotlin.**