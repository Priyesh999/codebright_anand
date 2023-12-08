import 'package:digigyan/cbtsrc/cbt_api/network_request.dart';
import 'package:digigyan/cbtsrc/cbt_model/img_pickholder.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/widgets/cbt_toast/toast.dart';
import 'package:image_picker/image_picker.dart';

class CameraUtils {
  Future<String?> getImage(
      {ImageSource source = ImageSource.camera,
      required CameraDevice cameraDevice}) async {
    return _captureImagePlatformWise(source, cameraDevice);
  }

  Future<String?> _captureImagePlatformWise(
      ImageSource source, CameraDevice cameraDevice) async {
    String? img;
    try {
      /*if (Platform.isAndroid) {
        final camImage = await UtilsNative().openNativeCamera(
            isGallery: source == ImageSource.gallery,
            isFront: cameraDevice == CameraDevice.front);
        img = camImage.resObject?.path;
      } else if (Platform.isIOS) {
        img = await _captureImageFromPlugin(source, cameraDevice);
      }*/

      img = await _captureImageFromPlugin(source, cameraDevice);
    } on Exception catch (e) {
      CboToast.showText(text: "No Camera found");
    }
    return img;
  }

  Future<String?> _captureImageFromPlugin(
      ImageSource source, CameraDevice cameraDevice) async {
    final _picker = ImagePicker();
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        preferredCameraDevice: cameraDevice,
      );
      return pickedFile?.path;
    } catch (e) {
      CboToast.showText(text: "ERROR Capturing Image $e");
      return null;
    }
  }

// ---------------------Upload image to server--------------------------
  Future<ImageUploadResponse?> uploadImage2Server(
    String destinationUrl,
    String localPath,
  ) async {
    NRequest networkRequest = NRequest();
    final imgResp = await networkRequest.uploadFile(
      destinationUrl,
      localPath,
    );
    if (imgResp['STATUS'] == 'SUCCESS') {
      return ImageUploadResponse(
          filename: imgResp['DATA']['PR_FILE'],
          url: ApiUrls.baseUrlImage(imgResp['DATA']['PR_FILE']));
    } else {
      return null;
    }
  }
}
