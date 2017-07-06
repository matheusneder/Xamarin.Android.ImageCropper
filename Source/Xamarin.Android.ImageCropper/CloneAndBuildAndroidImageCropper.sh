#!/bin/bash
set -e
cd `dirname $0`
echo "**************************************************"
echo "Clonning Android-Image-Cropper source from GitHub."
echo "**************************************************"
rm -Rf Android-Image-Cropper
if ! git clone https://github.com/matheusneder/Android-Image-Cropper.git; then
	echo "*************************************************"
	echo "Error clonning Android-Image-Cropper from GitHub."
	echo "*************************************************"
	exit 1
fi
cd Android-Image-Cropper 
echo "*******************************"
echo "Building Android-Image-Cropper."
echo "*******************************"
./gradlew build
mkdir ../Jars
if ! cp -f cropper/build/outputs/aar/cropper-release.aar ../Jars/cropper.aar; then
	echo "*******************************************************************************"
	echo "Error copying output to Jars directory, sounds like 'gradlew build' has failed."
	echo "*******************************************************************************"
	exit 2
fi
echo "Done!"


