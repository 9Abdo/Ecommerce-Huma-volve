import '../../../core/network/client_network.dart';
import '../../home/data/datasource/remote_data_source_implemention.dart';
import '../../home/data/datasource/remote_home_date_source.dart';
import '../../home/data/repo/home_repo_implemention.dart';
import '../../home/domain/repo/home_repo.dart';
import '../../home/domain/usecase/get_category_use_case.dart';
import '../../home/domain/usecase/get_product_use_case.dart';
import '../../home/presentation/cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../cart/screens/cart_screen.dart';
import '../../profile/screens/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  late GetProductUseCase getProductUseCase;
  late GetCategoryUseCase getCategoryUseCase;
  late HomeRepo homeRepo;
  late RemoteHomeDateSource remoteHomeDateSource;
  late ClientNetwork clientNetwork;
  late HomeCubit homeCubit;
  @override
  void initState() {
    clientNetwork = ClientNetwork();
    remoteHomeDateSource = RemoteDataSourceImplemention(
      clientNetwork: clientNetwork,
    );
    homeRepo = HomeRepoImplemention(remoteHomeDateSource: remoteHomeDateSource);
    getCategoryUseCase = GetCategoryUseCase(homeRepo: homeRepo);
    getProductUseCase = GetProductUseCase(homeRepo: homeRepo);
    homeCubit = HomeCubit(
      getCategoryUseCase: getCategoryUseCase,
      getProductUseCase: getProductUseCase,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      BlocProvider(create: (context) => homeCubit, child: HomeScreen()),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Colors.white,
            selectedItemColor: AppTheme.primary,
            unselectedItemColor: Colors.grey.shade400,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.home_filled, size: 28),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.home_filled, size: 32),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.shopping_cart_outlined, size: 28),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.shopping_cart, size: 32),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.person_outline, size: 28),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(Icons.person, size: 32),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
