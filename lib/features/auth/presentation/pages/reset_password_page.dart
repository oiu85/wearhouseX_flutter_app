import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/validation/email_validator.dart';
import '../../../../core/validation/password_validator.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/di/app_dependencies.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

/// Reset password page
class ResetPasswordPage extends StatefulWidget {
  final String? email;

  const ResetPasswordPage({
    super.key,
    this.email,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _tokenController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailValidator = EmailValidator();
  final _passwordValidator = PasswordValidator();

  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      _emailController.text = widget.email!;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _tokenController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePasswordConfirmation(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_confirmPasswordRequired.tr();
    }
    if (value != _passwordController.text) {
      return LocaleKeys.validation_passwordMismatch.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final resetPasswordBloc = GetIt.I<ResetPasswordBloc>();

    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      bloc: resetPasswordBloc,
      listener: (context, state) {
        if (state.status.isSuccess() && state.successMessage != null) {
          // Navigate to login on success
          context.go(AppRoutes.login);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: AppText(
                state.successMessage!,
                translation: false,
              ),
              backgroundColor: theme.colorScheme.primaryContainer,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () => context.pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),
                  // Title
                  AppText(
                    LocaleKeys.auth_resetPassword,
                    translation: true,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AppText(
                    LocaleKeys.auth_resetPasswordDescription,
                    translation: true,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 48.h),
                  // Email Field
                  CustomTextField(
                    controller: _emailController,
                    labelText: LocaleKeys.auth_email.tr(),
                    hintText: LocaleKeys.auth_enterYourEmail.tr(),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _emailValidator(value),
                  ),
                  SizedBox(height: 20.h),
                  // Token Field
                  CustomTextField(
                    controller: _tokenController,
                    labelText: LocaleKeys.auth_resetPasswordToken.tr(),
                    hintText: LocaleKeys.auth_enterResetToken.tr(),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.auth_resetTokenRequired.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  // Password Field
                  CustomTextField(
                    controller: _passwordController,
                    labelText: LocaleKeys.auth_newPassword.tr(),
                    hintText: LocaleKeys.auth_enterNewPassword.tr(),
                    obscureText: true,
                    validator: (value) => _passwordValidator(value),
                  ),
                  SizedBox(height: 20.h),
                  // Confirm Password Field
                  CustomTextField(
                    controller: _confirmPasswordController,
                    labelText: LocaleKeys.auth_confirmNewPassword.tr(),
                    hintText: LocaleKeys.auth_confirmNewPasswordHint.tr(),
                    obscureText: true,
                    validator: _validatePasswordConfirmation,
                  ),
                  SizedBox(height: 32.h),
                  // Submit Button
                  BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                    bloc: resetPasswordBloc,
                    builder: (context, state) {
                      final isLoading = state.status.isLoading();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomFilledButton(
                            text: LocaleKeys.auth_resetPassword,
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      resetPasswordBloc.add(
                                        ResetPasswordSubmitted(
                                          email: _emailController.text,
                                          token: _tokenController.text,
                                          password: _passwordController.text,
                                          passwordConfirmation:
                                              _confirmPasswordController.text,
                                        ),
                                      );
                                    }
                                  },
                            backgroundColor: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                            height: 50.h,
                          ),
                          SizedBox(height: 16.h),
                          // UI Helper for loading and error states
                          UiHelperStatus(
                            state: state.status,
                            message: state.errorMessage,
                            onRetry: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                resetPasswordBloc.add(
                                  ResetPasswordSubmitted(
                                    email: _emailController.text,
                                    token: _tokenController.text,
                                    password: _passwordController.text,
                                    passwordConfirmation:
                                        _confirmPasswordController.text,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  // Back to Login
                  TextButton(
                    onPressed: () => context.go(AppRoutes.login),
                    child: AppText(
                      LocaleKeys.auth_backToLogin,
                      translation: true,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
