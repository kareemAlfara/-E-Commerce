import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class Prouductbottomsheet extends StatefulWidget {
  const Prouductbottomsheet({super.key});

  @override
  State<Prouductbottomsheet> createState() => _ProuductbottomsheetState();
}

class _ProuductbottomsheetState extends State<Prouductbottomsheet> {
  RangeValues _values = const RangeValues(150, 300);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 2,
                width: 70,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            defulttext(
              data: "تصنيف حسب  :",
              fSize: 22,
              fw: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(Assets.imagecosticon),
                defulttext(
                  data: "  السعر : ",
                  fSize: 16,
                  fw: FontWeight.w500,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400]!,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: 135,
                  height: 36,
                  child: Center(
                    child: defulttext(
                      data: "\$${_values.start.round()}",
                      color: Colors.black,
                      fSize: 16,
                      fw: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                defulttext(
                  data: " إلي ",
                  fSize: 16,
                  fw: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400]!,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: 135,
                  height: 36,
                  child: Center(
                    child: defulttext(
                      data: "\$${_values.end.round()}",
                      color: Colors.black,
                      fSize: 16,
                      fw: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Range Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFF22C55E),
                inactiveTrackColor: Colors.grey[300],
                thumbColor: const Color(0xFF22C55E),
                overlayColor: const Color(0xFF22C55E).withOpacity(0.2),
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 12,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 20,
                ),
                trackHeight: 6,
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 12,
                ),
                rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
              ),
              child: RangeSlider(
                values: _values,
                max: 500,
                min: 0,
                divisions: 50,
                onChanged: (RangeValues values) {
                  setState(() {
                    _values = values;
                  });
                },
              ),
            ),
            
            // Price range labels
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$0',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '\$500',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                // Handle filter action
                print("Filter applied with range: \$${_values.start.round()} - \$${_values.end.round()}");
                Navigator.pop(context, _values); // Return the selected range
              }, 
              text: 'تصفية'
            ),
          ],
        ),
      ),
    );
  }
}