
// Alternative simpler shimmer without animation
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
class ProductLoadingShimmer extends StatefulWidget {
  const ProductLoadingShimmer({super.key});

  @override
  State<ProductLoadingShimmer> createState() => _ProductLoadingShimmerState();
}

class _ProductLoadingShimmerState extends State<ProductLoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      builder: (context, index) => _buildShimmerItem(),
      itemCount: 6, // Show 6 loading items
      crossAxisCount: 2,
    );
  }

  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(11),
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heart icon shimmer
            Align(
              alignment: Alignment.topLeft,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return _buildShimmerContainer(
                    width: 24,
                    height: 24,
                    borderRadius: 12,
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            
            // Product image shimmer
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return _buildShimmerContainer(
                    width: double.infinity,
                    height: 130,
                    borderRadius: 8,
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            
            // Product name shimmer
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return _buildShimmerContainer(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: 16,
                  borderRadius: 4,
                );
              },
            ),
            const SizedBox(height: 8),
            
            // Price and add button row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price shimmer
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return _buildShimmerContainer(
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      height: 13,
                      borderRadius: 4,
                    );
                  },
                ),
                
                // Add button shimmer
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return _buildShimmerContainer(
                      width: 36,
                      height: 36,
                      borderRadius: 18,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerContainer({
    required double width,
    required double height,
    required double borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.grey[300]!,
            Colors.grey[200]!,
            Colors.grey[300]!,
          ],
          stops: [
            0.0,
            0.5,
            1.0,
          ],
          transform: GradientRotation(_animation.value * 3.14159),
        ),
      ),
    );
  }
}

class SimpleProductLoadingShimmer extends StatelessWidget {
  const SimpleProductLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      builder: (context, index) => _buildShimmerItem(context),
      itemCount: 6,
      crossAxisCount: 2,
    );
  }

  Widget _buildShimmerItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(11),
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heart icon placeholder
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // Product image placeholder
            Center(
              child: Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // Product name placeholder
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            
            // Price and add button row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price placeholder
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  height: 13,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                
                // Add button placeholder
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}