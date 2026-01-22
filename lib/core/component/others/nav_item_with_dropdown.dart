import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavItemWithDropdown extends StatefulWidget {
  final String label;
  final bool isActive;
  final List<NavDropdownItem> items;

  const NavItemWithDropdown({
    super.key,
    required this.label,
    required this.items,
    this.isActive = false,
  });

  @override
  State<NavItemWithDropdown> createState() => _NavItemWithDropdownState();
}

class _NavItemWithDropdownState extends State<NavItemWithDropdown> {
  bool _isHovering = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _showDropdown() {
    _removeOverlay();

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 280.w,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8.h),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12.r),
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovering = true),
              onExit: (_) {
                setState(() => _isHovering = false);
                _removeOverlay();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 25),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final isLast = index == widget.items.length - 1;

                    return Column(
                      children: [
                        _DropdownItemWidget(
                          label: item.label,
                          onTap: () {
                            _removeOverlay();
                            item.onTap();
                          },
                        ),
                        if (!isLast)
                          Divider(
                            height: 1.h,
                            thickness: 1,
                            color: extensionColors.divider,
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
          setState(() => _isHovering = true);
          _showDropdown();
        },
        onExit: (_) {
          Future.delayed(const Duration(milliseconds: 100), () {
            if (!_isHovering) {
              _removeOverlay();
            }
          });
          setState(() => _isHovering = false);
        },
        child: InkWell(
          onTap: () {
            if (_overlayEntry == null) {
              _showDropdown();
            } else {
              _removeOverlay();
            }
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  widget.label,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: widget.isActive ? theme.colorScheme.secondary : theme.colorScheme.onBackground,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  _overlayEntry != null ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 16.sp,
                  color: widget.isActive ? theme.colorScheme.secondary : theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DropdownItemWidget extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _DropdownItemWidget({
    required this.label,
    required this.onTap,
  });

  @override
  State<_DropdownItemWidget> createState() => _DropdownItemWidgetState();
}

class _DropdownItemWidgetState extends State<_DropdownItemWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          color: _isHovering ? extensionColors.catalogBackground : Colors.transparent,
          child: AppText(
            isAutoScale: true ,
            widget.label,
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class NavDropdownItem {
  final String label;
  final VoidCallback onTap;

  const NavDropdownItem({
    required this.label,
    required this.onTap,
  });
}
