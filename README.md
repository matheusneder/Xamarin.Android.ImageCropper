# Xamarin.Android.ImageCropper

[Android-Image-Cropper](https://github.com/ArthurHub/Android-Image-Cropper) bindings for Xamarin.Android.

### Contribute

#### Build

First step is to build Android-Image-Cropper: Assuming you already have development tools for Android + Xamarin development installed, just run `CloneAndBuildAndroidImageCropper[.bat|.sh]`. It will clone Android-Image-Cropper from github (more specifically from this fork: https://github.com/matheusneder/Android-Image-Cropper) and invoke project's `grandlew build` in order to build the library.

Second step is to build the solution on Visual Studio. I built from VS 15.2 (2017).

To create a NuGet package: build the solution in Release mode and then, at project's directory, execute: `NuGet pack Xamarin.Android.ImageCropper.csproj -Prop Configuration=Release`.