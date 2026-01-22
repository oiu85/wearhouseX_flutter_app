import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText; // Not translated here; pass localized text
  final String? hintText;  // Not translated here; pass localized text
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double? width;   // default 325
  final double? height;  // default 75
  final String? prefixIconPath;  // SVG icon path
  final Widget? prefixIcon;  // Widget prefix icon (Material icon, etc.)
  final Widget? suffixIcon;  // Custom suffix icon widget
  final bool autofocus;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.width,
    this.height,
    this.prefixIconPath,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    // Height is provided by user, calculate padding based on actual height
    final double effectiveHeight = widget.height ?? 75.h;
    final double contentVerticalPadding = ((effectiveHeight) - 50.h) / 2;

    final borderRadius = BorderRadius.circular(12.r);

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 6.h, right: 6.w),
            child: AppText(
              widget.labelText!,
              translation: false,
              textAlign: TextAlign.right,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                height: 1.43,
              ),
            ),
          ),
        SizedBox(
          height: effectiveHeight,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _obscure,
            autofocus: widget.autofocus,
            onChanged: widget.onChanged,
            validator: widget.validator,
            textAlign: TextAlign.right,
            textAlignVertical: TextAlignVertical.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1.6,
            ),
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              filled: true,
              fillColor: extensionColors.textFieldBorder.withAlpha(127),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: contentVerticalPadding.clamp(0, double.infinity),
              ),
              hintText: widget.hintText,
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: extensionColors.hintText,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                height: 1.64,
              ),
              prefixIcon: widget.prefixIcon ?? (widget.prefixIconPath != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SvgPicture.asset(
                            widget.prefixIconPath!,
                            width: 24.sp,
                            height: 24.sp,
                            colorFilter: ColorFilter.mode(
                              extensionColors.hintText,
                              BlendMode.srcIn,
                            ),
                          ),
                        )
                      : null),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      splashRadius: 18.r,
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: extensionColors.hintText,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                  : widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5.w),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5.w),
              ),
            ),
          ),
        ),
      ],
    );

    // Wrap in Container with width only if width is provided
    if (widget.width != null) {
      return Container(
        width: widget.width,
        child: content,
      );
    }
    return content;
  }
}
