import 'package:corbado_auth/corbado_auth.dart';
import 'package:developer_panel_app/widgets/button/filled_text_button.dart';
import 'package:developer_panel_app/widgets/button/outlined_text_button.dart';
import 'package:developer_panel_app/widgets/text/maybe_error.dart';
import 'package:flutter/material.dart';

class PasskeyVerifyScreen extends StatelessWidget implements CorbadoScreen<PasskeyVerifyBlock> {
  final PasskeyVerifyBlock block;

  PasskeyVerifyScreen(this.block);

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaybeError(block.error?.translatedError),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Login with your passkey',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: block.data.primaryLoading,
            onTap: () async {
              await block.passkeyVerify();
            },
            content: 'Login with passkey',
          ),
        ),
        const SizedBox(height: 10),
        block.data.preferredFallback != null
            ? SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedTextButton(
                  onTap: () => block.data.preferredFallback!.onTap(),
                  content: block.data.preferredFallback!.label,
                ),
              )
            : Container(),
        const SizedBox(height: 10),
      ],
    );
  }
}
