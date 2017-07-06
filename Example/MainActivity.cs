using Android.App;
using Android.Widget;
using Android.OS;
using Android.Content;
using Android.Runtime;
using Xamarin.Android.ImageCropper;

namespace ImageCropperExample
{
    [Activity(
        Label = "ImageCropperExample",
        MainLauncher = true,
        Icon = "@drawable/ic_launcher",
        Theme = "@style/Base.Theme.AppCompat")]
    public class MainActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);
            var button = FindViewById<Button>(Resource.Id.btnSelectImage);

            button.Click += (sender, eventArgs) =>
            {
                CropImage.Activity()
                        .SetGuidelines(CropImageView.Guidelines.On)
                        .SetMultiTouchEnabled(true)
                        .Start(this);
            };
        }

        protected override void OnActivityResult(int requestCode, [GeneratedEnum] Result resultCode, Intent data)
        {

            // handle result of CropImageActivity
            if (requestCode == CropImage.CropImageActivityRequestCode)
            {
                CropImage.ActivityResult result = CropImage.GetActivityResult(data);
                if (resultCode == Result.Ok)
                {
                    ((ImageView)FindViewById(Resource.Id.quick_start_cropped_image)).SetImageURI(result.Uri);
                    Toast.MakeText(this, "Cropping successful, Sample: " + result.SampleSize, ToastLength.Long).Show();
                }
                else if (result != null)
                {
                    Toast.MakeText(this, "Cropping failed: " + result.Error, ToastLength.Long).Show();
                }
            }
        }
    }
}

