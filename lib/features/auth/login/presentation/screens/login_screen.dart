import '../../../../../core/network/client_network.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../../../sign_up/data/datasource/remote_register.dart';
import '../../../sign_up/data/datasource/remote_register_implementation.dart';
import '../../../sign_up/data/repo/register_repo_implementation.dart';
import '../../../sign_up/domains/repo/register_repo.dart';
import '../../../sign_up/domains/usecase/register_use_case.dart';
import '../../../sign_up/presentation/cubit/register_cubit.dart';

import '../../../../main_navigation/screens/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/theme.dart';

import '../../../sign_up/presentation/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late RegisterCubit registerCubit;
  late RegisterUseCase registerUseCase;
  late RegisterRepo registerRepo;
  late RemoteRegister remoteRegister;
  late ClientNetwork clientNetwork;

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    clientNetwork = ClientNetwork();
    remoteRegister = RemoteRegisterImplementation(clientNetwork: clientNetwork);
    registerRepo = RegisterRepoImplementation(remoteRegister: remoteRegister);
    registerUseCase = RegisterUseCase(registerRepo: registerRepo);
    registerCubit = RegisterCubit(registerUseCase: registerUseCase);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is FailureLogIn) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
        if (state is SuccessLogin) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Log in SuccessFull"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainNavigationScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppTheme.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    Icon(Icons.shopping_bag, size: 80, color: AppTheme.primary),
                    const SizedBox(height: 32),
                    Text(
                      'Welcome Back!',
                      style: Theme.of(context).textTheme.displayLarge
                          ?.copyWith(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Login to continue your shopping',
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 64),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email Address',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      isLoading: state is LoadinLogin,
                      text: 'Login',
                      onPressed: _login,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        BlocProvider(
                                          create: (context) => registerCubit,
                                          child: SignUpScreen(),
                                        ),
                                transitionsBuilder:
                                    (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
