import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Full screen image viewer with zoom and pan support
class FullScreenImageViewer extends StatefulWidget {
  final String? imageUrl;
  final String? localImagePath;
  final String? heroTag;

  const FullScreenImageViewer({
    super.key,
    this.imageUrl,
    this.localImagePath,
    this.heroTag,
  }) : assert(imageUrl != null || localImagePath != null);

  /// Show the full screen image viewer
  static Future<void> show(
    BuildContext context, {
    String? imageUrl,
    String? localImagePath,
    String? heroTag,
  }) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        barrierDismissible: true,
        pageBuilder: (context, animation, secondaryAnimation) {
          return FullScreenImageViewer(
            imageUrl: imageUrl,
            localImagePath: localImagePath,
            heroTag: heroTag,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer>
    with SingleTickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  double _currentScale = 1.0;
  final double _minScale = 1.0;
  final double _maxScale = 4.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // Hide system UI for immersive experience
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // Restore system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onDoubleTap() {
    if (_currentScale != 1.0) {
      // Reset to original scale
      _animateToScale(Matrix4.identity());
    } else {
      // Zoom to 2x
      final center = MediaQuery.of(context).size.center(Offset.zero);
      // ignore: deprecated_member_use
      final matrix = Matrix4.identity()
        ..translate(center.dx, center.dy)
        ..scale(2.0)
        ..translate(-center.dx, -center.dy);
      _animateToScale(matrix);
    }
  }

  void _animateToScale(Matrix4 targetMatrix) {
    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: targetMatrix,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animation!.addListener(() {
      _transformationController.value = _animation!.value;
    });

    _animationController.forward(from: 0);
  }

  void _onInteractionUpdate(ScaleUpdateDetails details) {
    _currentScale = _transformationController.value.getMaxScaleOnAxis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image with zoom/pan
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            onDoubleTap: _onDoubleTap,
            child: InteractiveViewer(
              transformationController: _transformationController,
              onInteractionUpdate: _onInteractionUpdate,
              minScale: _minScale,
              maxScale: _maxScale,
              child: Center(
                child: _buildImage(),
              ),
            ),
          ),

          // Close button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16.h,
            right: 16.w,
            child: _buildCloseButton(),
          ),

          // Zoom hint
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 24.h,
            left: 0,
            right: 0,
            child: _buildZoomHint(),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    Widget imageWidget;

    if (widget.localImagePath != null) {
      imageWidget = Image.file(
        File(widget.localImagePath!),
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _buildErrorWidget();
        },
      );
    } else if (widget.imageUrl != null) {
      imageWidget = Image.network(
        widget.imageUrl!,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
              color: Colors.white,
              strokeWidth: 2.w,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildErrorWidget();
        },
      );
    } else {
      imageWidget = _buildErrorWidget();
    }

    // Wrap with Hero if tag provided
    if (widget.heroTag != null) {
      return Hero(
        tag: widget.heroTag!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildErrorWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.broken_image_outlined,
          size: 64.sp,
          color: Colors.white54,
        ),
        SizedBox(height: 16.h),
        Text(
          'Failed to load image',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildCloseButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          Icons.close_rounded,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _buildZoomHint() {
    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: _currentScale == 1.0 ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Text(
          'Double tap to zoom • Pinch to zoom',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white60,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}

