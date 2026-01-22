import 'drag_handle.dart';
import '../../shared/app_snackbar.dart';
import '../../localization/app_text.dart';
import '../../localization/locale_keys.g.dart';
import '../../theme/app_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

/// Share bottom sheet widget for sharing content
class ShareBottomSheet {
  /// Shows the share bottom sheet with options to share via different platforms
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String text,
    String? subject,
    String? url,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: _ShareBottomSheetContent(
          title: title,
          text: text,
          subject: subject,
          url: url,
        ),
      ),
    );
  }
}

class _ShareBottomSheetContent extends StatelessWidget {
  final String title;
  final String text;
  final String? subject;
  final String? url;

  const _ShareBottomSheetContent({
    required this.title,
    required this.text,
    this.subject,
    this.url,
  });

  String get _shareText {
    final buffer = StringBuffer();
    buffer.writeln(title);
    if (text.isNotEmpty) {
      buffer.writeln();
      buffer.writeln(text);
    }
    if (url != null && url!.isNotEmpty) {
      buffer.writeln();
      buffer.writeln(url);
    }
    return buffer.toString();
  }

  String get _shareUrl {
    return url ?? '';
  }

  Future<void> _shareContent(BuildContext context) async {
    // Close bottom sheet first before showing native share
    if (context.mounted) {
      Navigator.of(context).pop();
    }
    
    // Small delay to ensure bottom sheet is fully closed
    await Future.delayed(const Duration(milliseconds: 300));
    
    try {
      // Prepare share text
      final shareText = _shareText.trim();
      
      if (shareText.isEmpty) {
        throw Exception('No content to share');
      }
      
      // Use native share
      await Share.share(
        shareText,
        subject: subject ?? title,
      );
    } catch (e) {
      // Show error message
      debugPrint('Share error: $e');
      if (context.mounted) {
        AppSnackbar.showError(
          context,
          LocaleKeys.share_shareFailed,
        );
      }
    }
  }

  Future<void> _copyToClipboard(BuildContext context) async {
    try {
      final textToCopy = _shareUrl.isNotEmpty ? _shareUrl : _shareText;
      await Clipboard.setData(ClipboardData(text: textToCopy));
      
      if (context.mounted) {
        Navigator.of(context).pop();
        AppSnackbar.showSuccess(
          context,
          LocaleKeys.share_copiedToClipboard,
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        AppSnackbar.showError(
          context,
          LocaleKeys.share_copyFailed,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //* Drag Handle
          const Center(child: DragHandle()),
          
          SizedBox(height: 24.h),
          
          //* Share Options - List Style
          _ShareOptionItem(
            icon: Icons.share_outlined,
            label: LocaleKeys.share_share,
            onTap: () => _shareContent(context),
            theme: theme,
          ),
          
          SizedBox(height: 12.h),
          
          _ShareOptionItem(
            icon: Icons.copy_outlined,
            label: LocaleKeys.share_copyLink,
            onTap: () => _copyToClipboard(context),
            theme: theme,
          ),
          
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _ShareOptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final ThemeData theme;

  const _ShareOptionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final extensionColors = theme.extension<AppColorExtension>()!;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
          child: Row(
            children: [
              //* Icon Container
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                    width: 1.w,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 24.sp,
                  color: theme.colorScheme.primary,
                ),
              ),
              
              SizedBox(width: 18.w),
              
              //* Label
              Expanded(
                child: AppText(
                  label,
                  translation: true,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                    height: 1.4,
                  ),
                ),
              ),
              
              //* Arrow Icon
              Icon(
                Icons.chevron_right,
                size: 26.sp,
                color: extensionColors.campaignTitleColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

