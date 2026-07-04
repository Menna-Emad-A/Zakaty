import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../shared/app_colors.dart';
import '../shared/dummy_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 100),
      children: [
        _buildHeader(),
        const SizedBox(height: 24),
        _buildStatCards(),
        const SizedBox(height: 32),
        _buildRecentActivity(),
        const SizedBox(height: 32),
        _buildMyAssets(),
        const SizedBox(height: 24),
        _buildBottomCards(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              // Avatar (using a placeholder container for now)
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondary2Color,
                ),
                child: const Icon(Icons.person, color: AppColors.backgroundLight),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello , ${DummyData.userName}',
                      style: GoogleFonts.arefRuqaaInk(
                        color: AppColors.backgroundLight,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'May Allah accept your Zakat',
                      style: GoogleFonts.arefRuqaaInk(
                        color: AppColors.backgroundLight,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.transparent, // or a slight tint if needed
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications_none,
            color: AppColors.backgroundLight,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          _buildSingleStatCard(
            title: 'Zakat Threshold',
            value: DummyData.zakatThresholdStr,
            subtitle: 'Updated Today',
            subtitleIcon: Icons.check,
          ),
          const SizedBox(width: 12),
          _buildSingleStatCard(
            title: 'Total Assets',
            value: DummyData.totalAssetsStr,
            subtitle: 'Above Nisab',
            subtitleIcon: Icons.check,
            hasProgress: true,
          ),
          const SizedBox(width: 12),
          _buildZakatDueCard(),
        ],
      ),
    );
  }

  Widget _buildSingleStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData subtitleIcon,
    bool hasProgress = false,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.main2Color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (hasProgress) ...[
            const SizedBox(height: 12),
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary2Color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox()),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ] else ...[
            const SizedBox(height: 16),
          ],
          Row(
            children: [
              Icon(subtitleIcon, size: 12, color: AppColors.secondary2Color),
              const SizedBox(width: 4),
              Text(
                subtitle,
                style: GoogleFonts.arefRuqaaInk(
                  color: AppColors.secondary2Color,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildZakatDueCard() {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Zakat Due',
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.main2Color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            DummyData.zakatDueStr,
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.main2Color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pay Now',
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.backgroundLight,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.backgroundLight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Activity',
              style: GoogleFonts.arefRuqaaInk(
                color: AppColors.mainColor,
                fontSize: 18,
              ),
            ),
            Text(
              'View All',
              style: GoogleFonts.arefRuqaaInk(
                color: AppColors.mainColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: AppColors.cardGradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: DummyData.recentActivities.asMap().entries.map((entry) {
              int idx = entry.key;
              ActivityItem activity = entry.value;
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.title,
                            style: GoogleFonts.arefRuqaaInk(
                              color: AppColors.mainColor,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            activity.amountStr,
                            style: GoogleFonts.arefRuqaaInk(
                              color: AppColors.secondary2Color, // or a distinct color if needed
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            activity.time,
                            style: GoogleFonts.arefRuqaaInk(
                              color: AppColors.secondaryColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (idx != DummyData.recentActivities.length - 1)
                      Container(
                        height: 40,
                        width: 1,
                        color: AppColors.backgroundLight.withOpacity(0.5),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMyAssets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.secondary2Color, Color(0xFF40515C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.pie_chart, color: AppColors.mainColor, size: 24),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Assets',
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.mainColor,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Overview of your asset distribution',
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.backgroundLight,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            // Pie Chart
            Flexible(
              flex: 4,
              child: SizedBox(
                width: 160,
                height: 160,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: DummyData.assetChartData.map((data) {
                          return PieChartSectionData(
                            color: data.color,
                            value: data.percentage,
                            title: '${data.percentage.toInt()}%',
                            radius: 40,
                            titleStyle: GoogleFonts.arefRuqaaInk(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total Assets',
                            style: GoogleFonts.arefRuqaaInk(
                              color: AppColors.backgroundLight,
                              fontSize: 8,
                            ),
                          ),
                          Text(
                            '260,000 EGP', // Using static or dynamic
                            style: GoogleFonts.arefRuqaaInk(
                              color: AppColors.backgroundLight,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 24),
            // Legend
            Expanded(
              flex: 6,
              child: Column(
                children: DummyData.assetChartData.map((data) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: data.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            _getIconForAsset(data.type),
                            size: 16,
                            color: data.color,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: GoogleFonts.arefRuqaaInk(
                                  color: AppColors.mainColor,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${data.value.toInt()} EGP',
                                style: GoogleFonts.arefRuqaaInk(
                                  color: AppColors.backgroundLight,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${data.percentage.toInt()}%',
                          style: GoogleFonts.arefRuqaaInk(
                            color: data.color,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _getIconForAsset(AssetType type) {
    switch (type) {
      case AssetType.gold:
        return Icons.money;
      case AssetType.realEstate:
        return Icons.apartment;
      case AssetType.cash:
        return Icons.account_balance_wallet;
      case AssetType.business:
        return Icons.business_center;
      case AssetType.others:
        return Icons.pie_chart_outline;
    }
  }

  Widget _buildBottomCards() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hijri Progress Card
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hijri Year Progress',
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // Circle Progress representation
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundLight,
                        border: Border.all(color: AppColors.main2Color, width: 3),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${DummyData.hijriDaysPassed}',
                            style: GoogleFonts.arefRuqaaInk(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                          Text(
                            'Days',
                            style: GoogleFonts.arefRuqaaInk(
                              color: AppColors.mainColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${DummyData.hijriDaysLeft}',
                                style: GoogleFonts.arefRuqaaInk(
                                  color: AppColors.mainColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Days left',
                                style: GoogleFonts.arefRuqaaInk(
                                  color: AppColors.mainColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Progress bar
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.main2Color,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                                const Expanded(flex: 2, child: SizedBox()),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 10, color: AppColors.mainColor),
                              const SizedBox(width: 4),
                              Text(
                                'Ends on 15 Dhul-Hijjah',
                                style: GoogleFonts.arefRuqaaInk(
                                  color: AppColors.mainColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Smart Reminder Card
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLight,
                        border: Border.all(color: AppColors.main2Color, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.lightbulb, color: Colors.amber, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Smart Reminder',
                        style: GoogleFonts.arefRuqaaInk(
                          color: AppColors.mainColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'You received salary today.\nConsider paying 10% of your pending Zakat.',
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.mainColor,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    border: Border.all(color: AppColors.main2Color),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Pay Partial',
                        style: GoogleFonts.arefRuqaaInk(
                          color: AppColors.main2Color,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, size: 12, color: AppColors.main2Color),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
