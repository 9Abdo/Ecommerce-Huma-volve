import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareProductButton extends StatelessWidget {
  const ShareProductButton({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final productLink = "https://fir-exmple-5e3e2.web.app/$productId";
        final String shareMessage = "look at the Product: $productLink";
        await SharePlus.instance.share(
          ShareParams(
            text: shareMessage,
            subject: "Check out of this product on Huma Volve",
          ),
        );
      },
      icon: Icon(Icons.share),
    );
  }
}
