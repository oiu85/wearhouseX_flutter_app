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

/// Login page for driver authentication
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailValidator = EmailValidator();
  final _passwordValidator = PasswordValidator();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loginBloc = GetIt.I<LoginBloc>();

    return BlocListener<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if (state.status.isSuccess() && state.user != null) {
          // Navigate to home on success
          context.go(AppRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40.h),
                  // *App Logo/Title
                  AppText(
                    LocaleKeys.auth_driverLogin,
                    translation: true,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AppText(
                    LocaleKeys.auth_signInToContinue,
                    translation: true,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 48.h),
                  //* Email Field
                  CustomTextField(
                    controller: _emailController,
                    labelText: LocaleKeys.auth_email.tr(),
                    hintText: LocaleKeys.auth_enterYourEmail.tr(),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _emailValidator(value),
                  ),
                  SizedBox(height: 20.h),
                  //* Password Field
                  CustomTextField(
                    controller: _passwordController,
                    labelText: LocaleKeys.auth_password.tr(),
                    hintText: LocaleKeys.auth_enterYourPassword.tr(),
                    obscureText: true,
                    validator: (value) => _passwordValidator(value),
                  ),
                  SizedBox(height: 12.h),
                  //* Remember Me Toggle
                  Row(
                    children: [
                      Checkbox(
                        value: false, // TODO: Implement remember me storage
                        onChanged: (value) {
                          // TODO: Store remember me preference
                        },
                        activeColor: theme.colorScheme.primary,
                      ),
                      AppText(
                        LocaleKeys.auth_rememberMe,
                        translation: true,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      //* Forgot Password Link
                      TextButton(
                        onPressed: () {
                          context.push(AppRoutes.forgotPassword);
                        },
                        child: AppText(
                          LocaleKeys.auth_forgotPassword,
                          translation: true,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  //* Login Button
                  BlocBuilder<LoginBloc, LoginState>(
                    bloc: loginBloc,
                    builder: (context, state) {
                      final isLoading = state.status.isLoading();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomFilledButton(
                            text: LocaleKeys.auth_login,
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      loginBloc.add(
                                        LoginSubmitted(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                            backgroundColor: theme.colorScheme.primary,
                            textColor: theme.colorScheme.onPrimary,
                            height: 50.h,
                          ),
                          SizedBox(height: 16.h),
                          //* UI Helper for loading and error states
                          UiHelperStatus(
                            state: state.status,
                            message: state.errorMessage,
                            onRetry: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                loginBloc.add(
                                  LoginSubmitted(
                                    email: _emailController.text,
                                    password: _passwordController.text,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
