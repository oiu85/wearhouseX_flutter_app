import 'package:flutter/material.dart';

/// App color constants - Should ONLY be used in theme definitions
/// Widgets should use Theme.of(context).colorScheme instead
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  //* ==================== Light Theme Colors ====================
  
  //* Primary Brand Colors (Light) - Blue & Gold Palette
  static const Color lightPrimary = Color(0xFF2563EB); // Blue-600 - Primary brand color
  static const Color lightSecondary = Color(0xFFD4AF37); // Gold - Secondary accent
  static const Color lightTertiary = Color(0xFFFFD700); // Bright Gold - Tertiary accent
  
  //* Background & Surface (Light) - Grey Palette
  static const Color lightBackground = Color(0xFFFFFFFF); // White
  static const Color lightSurface = Color(0xFFFFFFFF); // White
  static const Color lightScaffoldBackground = Color(0xFFF9FAFB); // Light grey background
  
  //* Text Colors (Light)
  static const Color lightTextPrimary = Color(0xFF111827); // Dark grey - Almost black
  static const Color lightTextSecondary = Color(0xFF6B7280); // Medium grey
  static const Color lightTextOnPrimary = Color(0xFFFFFFFF); // White on colored buttons
  
  //* UI Element Colors (Light) - Grey Palette
  static const Color lightBorder = Color(0xFFE5E7EB); // Light grey border
  static const Color lightDivider = Color(0xFFD1D5DB); // Medium grey divider
  static const Color lightShadow = Color(0x1A000000);
  
  //* Catalog Colors (Light)
  static const Color lightCatalogBackground = Color(0xFFF3F4F6); // Light grey
  static const Color lightCatalogTextColor = Color(0xFF374151); // Dark grey
  static const Color lightCatalogCardBackground = Color(0xFFFFFFFF); // White
  static const Color lightCatalogCardShadow = Color(0x338E8E8E);
  static const Color lightCatalogCardTextPrimary = Color(0xFF111827); // Dark grey
  static const Color lightCatalogCardTextSecondary = Color(0x99111827);
  static const Color lightCatalogDivider = Color(0x29000000);
  static const Color lightCatalogTabInactive = Color(0xFF9CA3AF); // Medium grey
  
  //* Campaign Colors (Light)
  static const Color lightCampaignCardBackground = Color(0xFFF9FAFB); // Very light grey
  static const Color lightCampaignTitleColor = Color(0xFF1F2937); // Dark grey
  static const Color lightProgressBarUnfilled = Color(0xFFE5E7EB); // Light grey
  static const Color lightTabInactiveColor = Color(0xFF9CA3AF); // Medium grey
  
  //* Bottom Sheet Colors (Light)
  static const Color lightBottomSheetBackground = Color(0xFFFFFFFF); // White
  static const Color lightBottomSheetDivider = Color(0xFFD1D5DB); // Medium grey
  static const Color lightDropdownBackground = Color(0xFFF9FAFB); // Very light grey
  static const Color lightChipBorderInactive = Color(0xFFD1D5DB); // Medium grey
  static const Color lightFieldDivider = Color(0xFFE5E7EB); // Light grey
  static const Color lightHintText = Color(0xFF9CA3AF); // Medium grey
  
  //* Effects (Light)
  static const Color lightGlassEffect = Color(0x4C717171);
  static const Color lightInactiveIndicator = Color(0xFFD1D5DB); // Medium grey
  
  //* ==================== Dark Theme Colors ====================
  //* Dark Mode Color System: Blue & Gold
  
  //* Primary Brand Colors (Dark) - Blue & Gold Palette
  static const Color darkPrimary = Color(0xFF60A5FA); // Blue-400 - Primary for dark mode
  static const Color darkSecondary = Color(0xFFFFD700); // Bright Gold - Secondary accent
  static const Color darkTertiary = Color(0xFFD4AF37); // Gold - Tertiary accent
  
  //* Background & Surface (Dark) - Dark Grey Palette
  static const Color darkBackground = Color(0xFF0F172A); // Very dark blue-grey
  static const Color darkSurface = Color(0xFF1E293B); // Dark blue-grey surface
  static const Color darkScaffoldBackground = Color(0xFF0F172A); // Very dark blue-grey
  
  //* Text Colors (Dark)
  static const Color darkTextPrimary = Color(0xFFF1F5F9); // Very light grey - Almost white
  static const Color darkTextSecondary = Color(0xFFCBD5E1); // Light grey
  static const Color darkTextOnPrimary = Color(0xFFFFFFFF); // White on blue buttons
  
  //* UI Element Colors (Dark) - Grey Palette
  static const Color darkBorder = Color(0xFF334155); // Medium dark grey
  static const Color darkDivider = Color(0xFF475569); // Medium grey
  static const Color darkShadow = Color(0x1AFFFFFF);
  
  //* Catalog Colors (Dark)
  static const Color darkCatalogBackground = Color(0xFF0F172A); // Very dark blue-grey
  static const Color darkCatalogTextColor = Color(0xFFE2E8F0); // Light grey
  static const Color darkCatalogCardBackground = Color(0xFF1E293B); // Dark blue-grey
  static const Color darkCatalogCardShadow = Color(0x33000000);
  static const Color darkCatalogCardTextPrimary = Color(0xFFF1F5F9); // Very light grey
  static const Color darkCatalogCardTextSecondary = Color(0x99F1F5F9);
  static const Color darkCatalogDivider = Color(0xFF334155); // Medium dark grey
  static const Color darkCatalogTabInactive = Color(0xFF64748B); // Medium grey
  
  //* Campaign Colors (Dark)
  static const Color darkCampaignCardBackground = Color(0xFF1E293B); // Dark blue-grey
  static const Color darkCampaignTitleColor = Color(0xFFF1F5F9); // Very light grey
  static const Color darkProgressBarUnfilled = Color(0xFF334155); // Medium dark grey
  static const Color darkTabInactiveColor = Color(0xFF64748B); // Medium grey
  
  //* Bottom Sheet Colors (Dark)
  static const Color darkBottomSheetBackground = Color(0xFF1E293B); // Dark blue-grey
  static const Color darkBottomSheetDivider = Color(0xFF334155); // Medium dark grey
  static const Color darkDropdownBackground = Color(0xFF1E293B); // Dark blue-grey
  static const Color darkChipBorderInactive = Color(0xFF334155); // Medium dark grey
  static const Color darkFieldDivider = Color(0xFF334155); // Medium dark grey
  static const Color darkHintText = Color(0xFF64748B); // Medium grey
  
  //* Effects (Dark)
  static const Color darkGlassEffect = Color(0x4CFFFFFF);
  static const Color darkInactiveIndicator = Color(0xFF334155); // Medium dark grey
  
  //* ==================== Static Colors (Same in Both Themes) ====================
  
  //* Progress & Indicators - Blue & Gold
  static const Color progressBarFilled = Color(0xFF2563EB); // Blue-600
  static const Color tabActiveIndicator = Color(0xFF2563EB); // Blue-600
  static const Color donationCardShadow = Color(0x192563EB); // Blue shadow
  
  //* Action Buttons - Blue & Gold
  static const Color actionButtonBackground = Color(0x191E40FF); // Semi-transparent blue
  static const Color actionButtonIcon = Color(0xFF2563EB); // Blue-600
  static const Color accentGold = Color(0xFFD4AF37); // Gold accent
  static const Color accentGoldBright = Color(0xFFFFD700); // Bright Gold accent
  static const Color favoriteActiveBackground = Color(0x19FF3F3F); // Semi-transparent red
  static const Color favoriteActiveIcon = Color(0xFFFF3F3F); // Solid red
}
