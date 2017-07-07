# Xamarin.Android.ImageCropper

[Android-Image-Cropper](https://github.com/ArthurHub/Android-Image-Cropper) bindings for Xamarin.Android.

### Installation

Install [Xamarin.Android.ImageCropper](https://www.nuget.org/packages/Xamarin.Android.ImageCropper/) NuGet package.

Edit AndroidManifest:
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="Xamarin.Android.ImageCropper.App.Xamarin.Android.ImageCropper.App" android:versionCode="1" android:versionName="1.0" android:installLocation="auto">
  <!-- Add permissions -->
	<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
	<uses-permission android:name="android.permission.CAMERA" />
	<uses-sdk android:minSdkVersion="16" />
	<application android:label="ImageCropperApp" android:icon="@drawable/ic_launcher">
		<!-- Declare CropImageActivity theme -->
    <activity android:name="com.theartofdev.edmodo.cropper.CropImageActivity" android:theme="@style/Base.Theme.AppCompat" />
	</application>
</manifest>
```

### Contribute

#### Build

First step is to build Android-Image-Cropper: Assuming you already have development tools for Android + Xamarin development installed, just run `CloneAndBuildAndroidImageCropper[.bat|.sh]`. It will clone Android-Image-Cropper from github (more specifically from this fork: https://github.com/matheusneder/Android-Image-Cropper) and invoke project's `grandlew build` in order to build the library.

Second step is to build the solution on Visual Studio. I built from VS 15.2 (2017).

To create a NuGet package: build the solution in Release mode and then, at project's directory, execute: `NuGet pack Xamarin.Android.ImageCropper.csproj -Prop Configuration=Release`.
