import 'package:flutter/material.dart';
import 'package:quiz_app/app/profile/profile_view/profile_view.dart';
import '../../app_style/app_colors.dart';
import '../../app_style/app_text_style.dart';
import '../categories/categories_view.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Quiz App', style: appBarStyle,),
            backgroundColor: primaryColor,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home,color: Colors.white,)),
                Tab(icon: Icon(Icons.person,color: Colors.white,)),
              ],
            ),
          ),
          body:  TabBarView(
              children: [
                const CategoriesView(),
                ProfileView(),
              ],
            ),
        ));
  }
}