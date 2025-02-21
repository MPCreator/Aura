import 'package:flutter/material.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';
import 'widgets/header_section.dart';
import 'widgets/journal_section.dart';
import 'widgets/mood_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.mediumSpace(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.smallSpace(context),
                        horizontal: AppSizes.smallSpace(context),
                      ),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.yellow,
                            size: AppSizes.mediumIconSize(context),
                          ),
                          SizedBox(width: AppSizes.smallSpace(context)),
                          Text(
                            'plus',
                            style: TextStyle(
                              fontSize: AppSizes.mediumText(context),
                              fontWeight: FontWeight.bold,
                              color: AppColors.iconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.smallSpace(context)),
              const HeaderSection(),
              SizedBox(height: AppSizes.largeSpace(context)),
              const JournalSection(),
              SizedBox(height: AppSizes.mediumSpace(context)),
              const MoodSection(),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: AppSizes.mediumIconSize(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
