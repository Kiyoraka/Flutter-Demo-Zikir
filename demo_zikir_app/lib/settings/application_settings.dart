import 'package:flutter/material.dart';
import 'dart:ui';
import 'theme/themes.dart';

class ApplicationSettings extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final Function(bool) onVibrationChanged;
  final Function(bool) onSoundChanged;
  final Function(bool) onConfirmResetChanged;
  final Function(bool) onAutoSaveChanged;
  final Function(bool) onVolumeButtonCountingChanged;
  final Function(int) onTargetCountChanged;
  final bool vibrationEnabled;
  final bool soundEnabled;
  final bool confirmReset;
  final bool autoSaveCount;
  final bool volumeButtonCountingEnabled;
  final int targetCount;

  const ApplicationSettings({
    Key? key,
    required this.themeNotifier,
    required this.onVibrationChanged,
    required this.onSoundChanged,
    required this.onConfirmResetChanged,
    required this.onAutoSaveChanged,
    required this.onVolumeButtonCountingChanged,
    required this.onTargetCountChanged,
    required this.vibrationEnabled,
    required this.soundEnabled,
    required this.confirmReset,
    required this.autoSaveCount,
    required this.volumeButtonCountingEnabled,
    required this.targetCount,
  }) : super(key: key);

  @override
  _ApplicationSettingsState createState() => _ApplicationSettingsState();
}

class _ApplicationSettingsState extends State<ApplicationSettings> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Application Settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // Vibration feedback
                        _buildSettingItem(
                          icon: Icons.vibration,
                          title: 'Vibration Feedback',
                          subtitle: 'Vibrate when tapping the counter',
                          value: widget.vibrationEnabled,
                          onChanged: widget.onVibrationChanged,
                        ),
                        
                        // Sound feedback
                        _buildSettingItem(
                          icon: Icons.volume_up,
                          title: 'Sound Effects',
                          subtitle: 'Play sound when tapping the counter',
                          value: widget.soundEnabled,
                          onChanged: widget.onSoundChanged,
                        ),
                        
                        // Reset confirmation
                        _buildSettingItem(
                          icon: Icons.help_outline,
                          title: 'Reset Confirmation',
                          subtitle: 'Show confirmation dialog before resetting counter',
                          value: widget.confirmReset,
                          onChanged: widget.onConfirmResetChanged,
                        ),
                        
                        // Auto-save count
                        _buildSettingItem(
                          icon: Icons.save,
                          title: 'Auto-save Count',
                          subtitle: 'Save counter value automatically',
                          value: widget.autoSaveCount,
                          onChanged: widget.onAutoSaveChanged,
                        ),
                        
                        // Volume button counting during screen off
                        _buildSettingItem(
                          icon: Icons.volume_down,
                          title: 'Volume Button Counting',
                          subtitle: 'Count using volume buttons when screen is off',
                          value: widget.volumeButtonCountingEnabled,
                          onChanged: widget.onVolumeButtonCountingChanged,
                        ),
                        
                        // Target count
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Target Count',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Set a target count for your zikir',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildTargetCountButton(33),
                                    _buildTargetCountButton(99),
                                    _buildTargetCountButton(100),
                                    _buildTargetCountButton(500),
                                    _buildTargetCountButton(1000),
                                  ],
                                ),
                                SizedBox(height: 15),
                                // Custom target count input
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: 'Custom target count',
                                            hintStyle: TextStyle(color: Colors.white70),
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                                          ),
                                          onSubmitted: (value) {
                                            if (value.isNotEmpty) {
                                              int? customCount = int.tryParse(value);
                                              if (customCount != null && customCount > 0) {
                                                widget.onTargetCountChanged(customCount);
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.check, color: Colors.white),
                                        onPressed: () {
                                          // This will be handled by onSubmitted
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: widget.themeNotifier.currentTheme.gradientColors[0],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildTargetCountButton(int count) {
    final isSelected = widget.targetCount == count;
    return GestureDetector(
      onTap: () {
        widget.onTargetCountChanged(count);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected 
              ? widget.themeNotifier.currentTheme.gradientColors[0]
              : Colors.white.withOpacity(0.2),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// Helper function to show the application settings overlay
void showApplicationSettings({
  required BuildContext context,
  required ThemeNotifier themeNotifier,
  required bool vibrationEnabled,
  required bool soundEnabled,
  required bool confirmReset,
  required bool autoSaveCount,
  required bool volumeButtonCountingEnabled,
  required int targetCount,
  required Function(bool) onVibrationChanged,
  required Function(bool) onSoundChanged,
  required Function(bool) onConfirmResetChanged,
  required Function(bool) onAutoSaveChanged,
  required Function(bool) onVolumeButtonCountingChanged,
  required Function(int) onTargetCountChanged,
}) {
  // Use StatefulBuilder to maintain local state in the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Create local state for immediate UI updates
      bool localVibrationEnabled = vibrationEnabled;
      bool localSoundEnabled = soundEnabled;
      bool localConfirmReset = confirmReset;
      bool localAutoSaveCount = autoSaveCount;
      bool localVolumeButtonCountingEnabled = volumeButtonCountingEnabled;
      int localTargetCount = targetCount;
      
      return StatefulBuilder(
        builder: (context, setState) {
          return ApplicationSettings(
            themeNotifier: themeNotifier,
            vibrationEnabled: localVibrationEnabled,
            soundEnabled: localSoundEnabled,
            confirmReset: localConfirmReset,
            autoSaveCount: localAutoSaveCount,
            volumeButtonCountingEnabled: localVolumeButtonCountingEnabled,
            targetCount: localTargetCount,
            onVibrationChanged: (value) {
              // Update local state for immediate UI refresh
              setState(() {
                localVibrationEnabled = value;
              });
              // Also update parent state
              onVibrationChanged(value);
            },
            onSoundChanged: (value) {
              setState(() {
                localSoundEnabled = value;
              });
              onSoundChanged(value);
            },
            onConfirmResetChanged: (value) {
              setState(() {
                localConfirmReset = value;
              });
              onConfirmResetChanged(value);
            },
            onAutoSaveChanged: (value) {
              setState(() {
                localAutoSaveCount = value;
              });
              onAutoSaveChanged(value);
            },
            onVolumeButtonCountingChanged: (value) {
              setState(() {
                localVolumeButtonCountingEnabled = value;
              });
              onVolumeButtonCountingChanged(value);
            },
            onTargetCountChanged: (value) {
              setState(() {
                localTargetCount = value;
              });
              onTargetCountChanged(value);
            },
          );
        },
      );
    },
  );
}