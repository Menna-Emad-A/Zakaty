import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shared/app_colors.dart';
import '../shared/dummy_data.dart';

class AddGoldPage extends StatefulWidget {
  const AddGoldPage({super.key});

  @override
  State<AddGoldPage> createState() => _AddGoldPageState();
}

class _AddGoldPageState extends State<AddGoldPage> {
  final TextEditingController _weightController = TextEditingController(text: '50');
  String _karat = '21 K';
  String _purpose = 'jewelry'; // 'jewelry' or 'investment'

  double get _currentValue {
    double weight = double.tryParse(_weightController.text) ?? 0;
    // Assuming 1g of 21K gold is around 2900 EGP for dummy calculation
    return weight * 2900.0;
  }

  void _saveAsset() async {
    // 1. Update Dummy Data
    double weight = double.tryParse(_weightController.text) ?? 0;
    double value = _currentValue;
    
    String details = '${weight.toInt()} g . $_karat';
    String zakatStatus = _purpose == 'investment' ? 'Zakat : EGP ${(value * 0.025).toInt()}' : 'Personal - No Zakat';
    
    // Replace the gold item in dummy data
    int index = DummyData.detailedAssets.indexWhere((item) => item.type == AssetType.gold);
    if (index != -1) {
      DummyData.detailedAssets[index] = DetailedAssetItem(
        type: AssetType.gold,
        name: 'Gold',
        details: details,
        valueStr: '${value.toInt()} EGP',
        zakatStatus: zakatStatus,
        isLiable: _purpose == 'investment',
      );
    }

    // 2. Show Animated Popup
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 400),
            curve: Curves.elasticOut,
            tween: Tween<double>(begin: 0.5, end: 1.0),
            builder: (context, double scale, child) {
              return Transform.scale(
                scale: scale,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.main2Color, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle, color: AppColors.main2Color, size: 60),
                      const SizedBox(height: 16),
                      Text(
                        'Added Successfully',
                        style: GoogleFonts.arefRuqaaInk(
                          color: AppColors.backgroundLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        );
      }
    );

    // 3. Wait for 1 second and navigate back
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.pop(context); // Close dialog
      Navigator.pop(context, true); // Go back to Assets page and return true to indicate change
    }
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.assetsBackgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.backgroundLight,
                          ),
                          child: const Icon(Icons.monetization_on, color: AppColors.main2Color, size: 50),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Weight',
                        style: GoogleFonts.arefRuqaaInk(
                          color: AppColors.backgroundLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildWeightInput(),
                      const SizedBox(height: 32),
                      Text(
                        'What is the Purpose ?',
                        style: GoogleFonts.arefRuqaaInk(
                          color: AppColors.backgroundLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildPurposeOption(
                        id: 'jewelry',
                        title: 'Jewelry',
                        subtitle: 'Not Liable for Zakat',
                      ),
                      const SizedBox(height: 16),
                      _buildPurposeOption(
                        id: 'investment',
                        title: 'Saving & investment',
                        subtitle: 'Zakat applicable',
                      ),
                      const SizedBox(height: 32),
                      _buildSummaryCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back_ios_new, color: AppColors.backgroundLight, size: 18),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'Add Gold',
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.backgroundLight,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.arefRuqaaInk(
                      color: AppColors.mainColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (val) => setState(() {}),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                Text(
                  'g',
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.mainColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Karat Dropdown/Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  _karat,
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.keyboard_arrow_down, color: AppColors.mainColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurposeOption({required String id, required String title, required String subtitle}) {
    bool isSelected = _purpose == id;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _purpose = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.mainColor, width: 2),
          boxShadow: const [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.arefRuqaaInk(
                    color: AppColors.mainColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Container(
              width: 25,
              height: 25,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.mainColor, width: 2),
                color: Colors.transparent,
              ),
              child: isSelected 
                ? Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainColor,
                    ),
                  )
                : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.mainColor, width: 2),
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
          Text(
            'Current value',
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.mainColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${_currentValue.toInt()} EGP',
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.mainColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Based on today’s gold price',
            style: GoogleFonts.arefRuqaaInk(
              color: AppColors.secondaryColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: _saveAsset,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.main2Color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.main2Color),
              ),
              alignment: Alignment.center,
              child: Text(
                'Add Assets',
                style: GoogleFonts.arefRuqaaInk(
                  color: AppColors.backgroundLight,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
