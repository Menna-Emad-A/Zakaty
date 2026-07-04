import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shared/app_colors.dart';
import '../shared/dummy_data.dart';
import 'add_gold_page.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: _buildHeader(),
        ),
        const SizedBox(height: 24),
        _buildTabBar(),
        const SizedBox(height: 16),
        Expanded(
          child: _buildAssetsList(),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Shield logo placeholder
            Container(
              width: 30,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.secondary2Color, width: 2),
              ),
              child: const Icon(Icons.shield, color: AppColors.main2Color, size: 16),
            ),
            const SizedBox(width: 12),
            Text(
              'Assets',
              style: GoogleFonts.arefRuqaaInk(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.transparent,
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

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.secondaryColor, width: 1)),
      ),
      child: Row(
        children: [
          _buildTabItem(0, 'All'),
          _buildTabItem(1, 'Liable'),
          _buildTabItem(2, 'Exempt'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.main2Color : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.arefRuqaaInk(
              color: isSelected ? AppColors.main2Color : AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAssetsList() {
    // Filter logic if needed later, for now we just show all
    final items = DummyData.detailedAssets;
    
    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 100),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildAssetCard(items[index]);
      },
    );
  }

  Widget _buildAssetCard(DetailedAssetItem item) {
    return GestureDetector(
      onTap: () async {
        if (item.type == AssetType.gold) {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddGoldPage()),
          );
          if (result == true) {
            setState(() {});
          }
        }
      },
      child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.backgroundLight,
                ),
                child: Icon(
                  _getIconForAsset(item.type),
                  color: AppColors.main2Color,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item.name,
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.main2Color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (item.details.isNotEmpty) ...[
            Text(
              item.details,
              style: GoogleFonts.arefRuqaaInk(
                color: AppColors.mainColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
          ],
          Text(
            item.valueStr,
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (item.zakatStatus.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.main2Color),
                ),
                child: Text(
                  item.zakatStatus,
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.main2Color,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          else 
            // Placeholder empty badge if needed to align things as per image
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 30, // approximate height of the badge
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.main2Color),
                ),
              ),
            ),
        ],
      ),
    ));
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
}
