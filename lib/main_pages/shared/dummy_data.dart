import 'package:flutter/material.dart';
import 'app_colors.dart';

// Enums for identifying types of assets and activities
enum AssetType { gold, realEstate, cash, business, others }
enum ActivityType { received, increase, paid }

// Models
class ActivityItem {
  final String title;
  final String amountStr;
  final String time;
  final ActivityType type;

  ActivityItem({
    required this.title,
    required this.amountStr,
    required this.time,
    required this.type,
  });
}

class AssetChartData {
  final AssetType type;
  final String name;
  final double value;
  final double percentage;
  final Color color;

  AssetChartData({
    required this.type,
    required this.name,
    required this.value,
    required this.percentage,
    required this.color,
  });
}

class DetailedAssetItem {
  final AssetType type;
  final String name;
  final String details;
  final String valueStr;
  final String zakatStatus;
  final bool isLiable;

  DetailedAssetItem({
    required this.type,
    required this.name,
    required this.details,
    required this.valueStr,
    required this.zakatStatus,
    required this.isLiable,
  });
}

class DummyData {
  // User info
  static const String userName = 'Hossam';
  
  // Home Page Financials
  static const String zakatThresholdStr = '250,000 EGP';
  static const String totalAssetsStr = '300,450 EGP';
  static const String zakatDueStr = '5,200 EGP';
  
  static const int totalAssetsValue = 260000; // Value inside pie chart

  // Home Page - Recent Activity
  static List<ActivityItem> recentActivities = [
    ActivityItem(
      title: 'Salary Received',
      amountStr: '+ EGP 10,000',
      time: 'Today',
      type: ActivityType.received,
    ),
    ActivityItem(
      title: 'Gold Price Updated',
      amountStr: '+ 10% value increase',
      time: '1 week ago',
      type: ActivityType.increase,
    ),
    ActivityItem(
      title: 'Zakat Paid',
      amountStr: 'EGP 5,000',
      time: '2 week ago',
      type: ActivityType.paid,
    ),
  ];

  // Home Page - Pie Chart Data
  static List<AssetChartData> assetChartData = [
    AssetChartData(
      type: AssetType.gold,
      name: 'Gold',
      value: 72000,
      percentage: 28,
      color: AppColors.goldAsset,
    ),
    AssetChartData(
      type: AssetType.realEstate,
      name: 'Real Estate',
      value: 83200,
      percentage: 32,
      color: AppColors.realEstateAsset,
    ),
    AssetChartData(
      type: AssetType.cash,
      name: 'Cash',
      value: 46800,
      percentage: 18,
      color: AppColors.cashAsset,
    ),
    AssetChartData(
      type: AssetType.business,
      name: 'Business',
      value: 72000,
      percentage: 15,
      color: AppColors.businessAsset,
    ),
    AssetChartData(
      type: AssetType.others,
      name: 'Others',
      value: 18200,
      percentage: 7,
      color: AppColors.othersAsset,
    ),
  ];

  // Assets Page - Detailed Assets List
  static List<DetailedAssetItem> detailedAssets = [
    DetailedAssetItem(
      type: AssetType.gold,
      name: 'Gold',
      details: '50g . 21 K',
      valueStr: '150,450 EGP',
      zakatStatus: 'Zakat : EGP 3,625',
      isLiable: true,
    ),
    DetailedAssetItem(
      type: AssetType.realEstate,
      name: 'Real Estate',
      details: 'Apartment',
      valueStr: '1,200,000 EGP',
      zakatStatus: 'Personal - No Zakat',
      isLiable: false,
    ),
    DetailedAssetItem(
      type: AssetType.cash,
      name: 'Cash & Saving',
      details: '',
      valueStr: '75,450 EGP',
      zakatStatus: '', // Empty in screenshot
      isLiable: true,
    ),
    DetailedAssetItem(
      type: AssetType.business,
      name: 'Business',
      details: '',
      valueStr: '320,000 EGP',
      zakatStatus: 'Zakat : 2.5 %',
      isLiable: true,
    ),
  ];

  // Hijri Progress
  static const int hijriDaysLeft = 39;
  static const int hijriDaysPassed = 321;
}
