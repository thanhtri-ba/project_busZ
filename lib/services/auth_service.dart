import 'package:supabase_flutter/supabase_flutter.dart' hide AuthResponse;
import 'package:busz/models/response/auth_responses.dart';

class AuthService {
  static final _supabase = Supabase.instance.client;

  static Future<CheckEmailResponse> checkEmail(String email) async {
    // Supabase doesn't have a direct check-email endpoint for security reasons.
    // For now, we return exists = false to allow registration flow to continue.
    return CheckEmailResponse(exists: false, email: email);
  }

  static Future<BaseResponse> sendEmailOtp(String email) async {
    try {
      await _supabase.auth.signInWithOtp(email: email);
      return BaseResponse(success: true, message: 'OTP sent');
    } on AuthException catch (e) {
      return BaseResponse(success: false, message: e.message);
    } catch (e) {
      return BaseResponse(success: false, message: e.toString());
    }
  }

  static Future<BaseResponse> verifyEmailOtp(String email, String otp) async {
    try {
      await _supabase.auth.verifyOTP(
        email: email,
        token: otp,
        type: OtpType.magiclink,
      );
      return BaseResponse(success: true, message: 'Verified');
    } on AuthException catch (e) {
      return BaseResponse(success: false, message: e.message);
    } catch (e) {
      return BaseResponse(success: false, message: e.toString());
    }
  }

  static Future<BaseResponse> sendPhoneOtp(String phone) async {
    try {
      await _supabase.auth.signInWithOtp(phone: phone);
      return BaseResponse(success: true, message: 'OTP sent');
    } on AuthException catch (e) {
      return BaseResponse(success: false, message: e.message);
    } catch (e) {
      return BaseResponse(success: false, message: e.toString());
    }
  }

  static Future<BaseResponse> verifyPhoneOtp(String phone, String otp) async {
    try {
      await _supabase.auth.verifyOTP(
        phone: phone,
        token: otp,
        type: OtpType.sms,
      );
      return BaseResponse(success: true, message: 'Verified');
    } on AuthException catch (e) {
      return BaseResponse(success: false, message: e.message);
    } catch (e) {
      return BaseResponse(success: false, message: e.toString());
    }
  }

  static Future<AuthResponse> register(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      return AuthResponse(
        success: true,
        message: 'Registered',
        accessToken: response.session?.accessToken,
        refreshToken: response.session?.refreshToken,
      );
    } on AuthException catch (e) {
      return AuthResponse(success: false, message: e.message);
    } catch (e) {
      return AuthResponse(success: false, message: e.toString());
    }
  }

  static Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return AuthResponse(
        success: true,
        message: 'Logged in',
        accessToken: response.session?.accessToken,
        refreshToken: response.session?.refreshToken,
      );
    } on AuthException catch (e) {
      return AuthResponse(success: false, message: e.message);
    } catch (e) {
      return AuthResponse(success: false, message: e.toString());
    }
  }

  static Future<BaseResponse> forgotPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
      return BaseResponse(success: true, message: 'Reset link sent');
    } on AuthException catch (e) {
      return BaseResponse(success: false, message: e.message);
    } catch (e) {
      return BaseResponse(success: false, message: e.toString());
    }
  }

  static Future<BaseResponse> resetPassword(String email, String otp, String newPassword) async {
    try {
      // Supabase flow usually redirects to app, then we call updateUser
      // This is a simplified approach assuming the user is already verified
      await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      return BaseResponse(success: true, message: 'Password reset successful');
    } on AuthException catch (e) {
      return BaseResponse(success: false, message: e.message);
    } catch (e) {
      return BaseResponse(success: false, message: e.toString());
    }
  }

  static Future<void> logout() async {
    await _supabase.auth.signOut();
  }
}
