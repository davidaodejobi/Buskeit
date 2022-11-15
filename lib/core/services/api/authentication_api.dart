import 'package:buskeit/core/core.dart';

import '../../../locator.dart';

class AuthenticationApiService {
  StorageService storageService = getIt<StorageService>();
  // UserService userService = getIt<UserService>();

  // Future signup({String credential}) async {
  //   Map credentialMap = jsonDecode(credential);
  //   credentialMap.removeWhere((key, value) => value == null);
  //   try {
  //     ResModel resModel = ResModel();
  //     await connect().post("/auth", data: credentialMap).then((value) async {
  //       storeToken(value);
  //       Response response = await connect().get("/user/me");
  //       if (response.statusCode == 200) {
  //         storeUserDetails(response);
  //       }
  //       resModel = resModelFromJson(value.data);
  //     });

  //     await futureAwait();
  //     return resModel;
  //   } on DioError catch (e) {
  //     return resModelFromJson(e.response.data);
  //   }
  // // }

  // Future login({required String email, required String password}) async {
  //   try {
  //     ResponseModel responseModel = ResponseModel();
  //     await connect().post("/auth/token", data: {
  //       "email": email,
  //       "password": password,
  //     }).then((value) async {
  //       storeToken(value);
  //       // Response response = await connect().get("/user/me");
  //       // if (response.statusCode == 200) {
  //       //   storeUserDetails(response);
  //       // }
  //     });

  //     // await futureAwait();
  //     print('responseModel: ${responseModel.message}');
  //     return responseModel;
  //   } on DioError catch (e) {
  //     return errorModelFromJson(e.response!.data);
  //   }
  // }

  // Future validatePassword({String email, int otp, String password}) async {
  //   try {
  //     Response response = await connect().post("/auth/password/forgot/validate",
  //         data: {"email": email, "otp": otp, "password": password});

  //     return resModelFromJson(response.data);
  //   } on DioError catch (e) {
  //     return resModelFromJson(e.response.data);
  //   }
  // }

  // Future changePassword({
  //   String currentPassword,
  //   String newPassword,
  //   String confirmPassword,
  // }) async {
  //   try {
  //     Response response = await connect().post("/auth/password/change", data: {
  //       "currentPassword": currentPassword,
  //       "newPassword": newPassword,
  //       "confirmPassword": confirmPassword,
  //     });

  //     return resModelFromJson(response.data);
  //   } on DioError catch (e) {
  //     return resModelFromJson(e.response.data);
  //   }
  // }

  // futureAwait() async {
  //   await Initializer().initialCalls();
  // }

  // storeToken(response) {
  //   ResponseModel res = responseModelFromJson(response.data);
  //   String token = 'access ${res.tokens!.access}';

  //   storageService.storeItem(key: token, value: token);
  // }

  // storeUserDetails(response) {
  //   ResponseModel res = responseModelFromJson(response.data);
  //   UserModel user = UserModel.fromJson(res.user);

  //   // userService.credentials = user;
  //   storageService.storeItem(
  //       key: individualDetails, value: userModelToJson(user));
  // }

  // void logout() {
  //   storageService.isLoggedIn = false;
  //   storageService.deleteItem(key: token);
  //   storageService.deleteItem(key: userDetails);
  // }
}
