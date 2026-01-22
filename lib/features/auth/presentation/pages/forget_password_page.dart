import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/validation/email_validator.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/di/app_dependencies.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

/// Forgot password page
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailValidator = EmailValidator();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final forgotPasswordBloc = GetIt.I<ForgotPasswordBloc>();

    return Scaffold(
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
                    LocaleKeys.auth_forgotPassword,
                    translation: true,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AppText(
                    LocaleKeys.auth_forgotPasswordDescription,
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
                    labelText: LocaleKeys.auth_email,
                    hintText: LocaleKeys.auth_enterYourEmail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _emailValidator(value),
                  ),
                  SizedBox(height: 32.h),
                  // Submit Button
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    bloc: forgotPasswordBloc,
                    builder: (context, state) {
                      final isLoading = state.status.isLoading();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomFilledButton(
                            text: LocaleKeys.auth_sendResetLink,
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      forgotPasswordBloc.add(
                                        ForgotPasswordSubmitted(
                                          _emailController.text,
                                        ),
                                      );
                                    }
                                  },
                            backgroundColor: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                            height: 50.h,
                          ),
                          SizedBox(height: 16.h),
                          // Success message
                          if (state.status.isSuccess() &&
                              state.successMessage != null)
                            Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: AppText(
                                state.successMessage!,
                                translation: false,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                          // UI Helper for loading and error states
                          UiHelperStatus(
                            state: state.status,
                            message: state.errorMessage,
                            onRetry: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                forgotPasswordBloc.add(
                                  ForgotPasswordSubmitted(
                                    _emailController.text,
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
                    onPressed: () => context.pop(),
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
      );
  }
}
