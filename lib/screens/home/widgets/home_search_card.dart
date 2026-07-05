import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:busz/core/theme/app_colors.dart';
import 'package:busz/core/theme/app_text_styles.dart';
import 'package:busz/screens/home/widgets/date_picker_bottom_sheet.dart';

class HomeSearchCard extends StatefulWidget {
  final VoidCallback onSearch;
  final VoidCallback onSelectFrom;
  final VoidCallback onSelectTo;

  const HomeSearchCard({
    super.key,
    required this.onSearch,
    required this.onSelectFrom,
    required this.onSelectTo,
  });

  @override
  State<HomeSearchCard> createState() => _HomeSearchCardState();
}

class _HomeSearchCardState extends State<HomeSearchCard> {
  bool _isRoundTrip = false;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.10),
            blurRadius: 30,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _TripTypePill(
                  label: 'One-way',
                  icon: Icons.arrow_right_alt_rounded,
                  selected: !_isRoundTrip,
                  onTap: () => setState(() => _isRoundTrip = false),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _TripTypePill(
                  label: 'Round trip',
                  icon: Icons.sync_alt_rounded,
                  selected: _isRoundTrip,
                  onTap: () => setState(() => _isRoundTrip = true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Column(
                children: [
                  _LocationBox(
                    label: 'From',
                    value: 'TP. Hồ Chí Minh',
                    icon: Icons.trip_origin_rounded,
                    iconColor: AppColors.routeDeparture,
                    onTap: widget.onSelectFrom,
                  ),
                  const SizedBox(height: 12),
                  _LocationBox(
                    label: 'To',
                    value: 'Đà Lạt',
                    icon: Icons.location_on_rounded,
                    iconColor: AppColors.routeArrival,
                    onTap: widget.onSelectTo,
                  ),
                ],
              ),
              Positioned(
                right: 16,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.25),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.swap_vert_rounded, color: AppColors.textWhite, size: 22),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _DateBox(
                  icon: Icons.calendar_today_outlined,
                  label: DateFormat('dd MMM').format(_selectedDate),
                  onTap: () async {
                    final selected = await showModalBottomSheet<DateTime>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const DatePickerBottomSheet(),
                    );
                    if (!mounted || selected == null) return;
                    setState(() => _selectedDate = selected);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _DateBox(
                  icon: Icons.wb_sunny_outlined,
                  label: 'Today',
                  selected: true,
                  onTap: () => setState(() => _selectedDate = DateTime.now()),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _DateBox(
                  icon: Icons.event_available_outlined,
                  label: 'Tomorrow',
                  onTap: () => setState(() => _selectedDate = DateTime.now().add(const Duration(days: 1))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton.icon(
              onPressed: widget.onSearch,
              icon: const Icon(Icons.search_rounded),
              label: const Text('Search Bus'),
            ),
          ),
        ],
      ),
    );
  }
}

class _TripTypePill extends StatelessWidget {
  const _TripTypePill({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryLight : AppColors.gray50,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: selected ? AppColors.primary : AppColors.borderNormal),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: selected ? AppColors.primary : AppColors.textSecondary),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.label.copyWith(
                color: selected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationBox extends StatelessWidget {
  const _LocationBox({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderNormal),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w800),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateBox extends StatelessWidget {
  const _DateBox({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryLight : AppColors.gray50,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: selected ? AppColors.primary : AppColors.borderNormal),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 17, color: selected ? AppColors.primary : AppColors.textSecondary),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: selected ? AppColors.primary : AppColors.textSecondary,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
