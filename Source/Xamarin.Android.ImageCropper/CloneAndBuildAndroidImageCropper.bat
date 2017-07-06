@set currentdir=%cd%
@for %%F in (%0) do set dirname=%%~dpF
@cd %dirname%
@echo **************************************************
@echo Clonning Android-Image-Cropper source from GitHub.
@echo **************************************************
rmdir Android-Image-Cropper /s /q
git clone https://github.com/matheusneder/Android-Image-Cropper.git || goto :giterror
cd Android-Image-Cropper 
@echo *******************************
@echo Building Android-Image-Cropper.
@echo *******************************
cmd /c "gradlew build"
md ..\Jars\
copy cropper\build\outputs\aar\cropper-release.aar ..\Jars\cropper.aar /b /v /y || goto :copyerror
cd ..
@echo Done!
@cd %currentdir%
@exit /b 0

:giterror
@echo ************************************************************************
@echo Error clonning Android-Image-Cropper from GitHub. 
@echo If you're re-running this script, and it has failed removing 
@echo Android-Image-Cropper directory, try terminate Java process then re-run.
@echo ************************************************************************
@cd %currentdir%
@exit /b 1

:copyerror
@echo *******************************************************************************
@echo Error copying output to Jars directory, sounds like "gradlew build" has failed.
@echo *******************************************************************************
@cd %currentdir%
@exit /b 2