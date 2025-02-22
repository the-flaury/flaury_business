import 'package:flaury_business/app/chat/widgets/chat_tiles.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SymmetricPadding(
          v: 0,
          h: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSpacing(v: 20),
              AppTextBold(text: 'Inbox', fontSize: 20),
              SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
              MainCustomTextfield(
                  hintext: 'Search',
                  obscureText: false,
                  onchanged: (String value) {},
                  prefixIcon: const Icon(Icons.search_rounded)),
              const AppSpacing(v: 20),
              // expanded to fit all of the chat tiles
              Expanded(
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (_, index) {
                      return ChatTiles(
                        ontap: () =>
                            Navigator.pushNamed(context, AppRoutes.chatdetails),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NOChatPlacholder extends StatelessWidget {
  const NOChatPlacholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextSemiBold(
          text:
              "No open conversations yet..\nSearch for a service and start  a conversation\n now. ",
          textAlign: TextAlign.center,
          fontSize: 14,
          color: AppColors.grey,
        ),
        AppTextBold(text: 'Click here!', fontSize: 14),
      ],
    );
  }
}
