import '../../../core/network/client_network.dart';
import '../../auth/login/data/datasource/remote_log_in_data_source.dart';
import '../../auth/login/data/datasource/remote_log_in_data_source_impl.dart';
import '../../auth/login/data/repo/log_in_repo_implement.dart';
import '../../auth/login/domains/repo/log_in_repo_domain.dart';
import '../../auth/login/domains/usecase/log_in_use_case.dart';
import '../../auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/storage_helper.dart';
import '../../../core/theme.dart';
import '../../auth/login/presentation/screens/login_screen.dart';
import '../../main_navigation/screens/main_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late LoginCubit loginCubit;
  late LogInUseCase logInUseCase;
  late LogInRepoDomain logInRepoDomain;
  late RemoteLogInDataSource remoteLogInDataSource;
  late ClientNetwork clientNetwork;
  @override
  void initState() {
    super.initState();
    _navigateToNext();
    clientNetwork = ClientNetwork();
    remoteLogInDataSource = RemoteLogInDataSourceImpl(
      clientNetwork: clientNetwork,
    );
    logInRepoDomain = LogInRepoImplement(
      remoteLogInDataSource: remoteLogInDataSource,
    );
    logInUseCase = LogInUseCase(logInRepoDomain: logInRepoDomain);
    loginCubit = LoginCubit(logInUseCase: logInUseCase);
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    final accessToken = await StorageHelper.getAccessToken();
    final refreshToken = await StorageHelper.getRefreshToken();

    if (!mounted) return;
    if (accessToken != null &&
        accessToken.isNotEmpty &&
        refreshToken != null &&
        refreshToken.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => loginCubit,
            child: LoginScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag, size: 120, color: AppTheme.primary),
            const SizedBox(height: 24),
            Text(
              'Huma-volve',
              style: Theme.of(context).textTheme.displayLarge
                  ?.copyWith(fontSize: 40, color: AppTheme.primary),
            ),
            const SizedBox(height: 8),
            Text(
              'Your Ultimate E-Commerce App',
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 48),
            CircularProgressIndicator(color: AppTheme.primary),
          ],
        ),
      ),
    );
  }
}
