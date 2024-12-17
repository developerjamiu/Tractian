import 'package:flutter/cupertino.dart';

class CompaniesErrorView extends StatelessWidget {
  const CompaniesErrorView({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  final String? errorMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage ?? 'An error occured'),
          CupertinoButton(
            onPressed: onRetry,
            child: Text('Try again'),
          ),
        ],
      ),
    );
  }
}
