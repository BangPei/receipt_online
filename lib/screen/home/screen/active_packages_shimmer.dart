import 'package:flutter/material.dart';
import 'package:receipt_online_shop/screen/home/screen/package_card.dart';
import 'package:receipt_online_shop/screen/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ActivePackageShimmer extends StatelessWidget {
  final AnimationController? animationController;
  const ActivePackageShimmer({super.key, this.animationController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 16,
        bottom: 18,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(68.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppTheme.grey.withOpacity(0.2),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  child: Column(
                    children: List.generate(4, (i) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: const ExpeditionPackage(
                          title: "",
                          totalPackage: 0,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const CircleTotalPackage(
                  totalPackage: 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
