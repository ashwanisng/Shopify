import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopify/app/modules/profile/controllers/edit_profile.dart';

class MockEditProfileController extends Mock implements EditProfileController {}

void main() {
  test('', () async {
    var path = MockEditProfileController();

    when(await path.selectProfileImage(ImageSource.gallery))
        .thenAnswer((_) async => path.selectImagePath.value);

    verifyNever(() => path.selectProfileImage(ImageSource.gallery));

    // expect(path.selectProfileImage(ImageSource.gallery),
    //     isInstanceOf<Future<void>>());
  });
}
