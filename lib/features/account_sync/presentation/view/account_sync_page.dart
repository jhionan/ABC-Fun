import 'dart:io';

import 'package:abc_fun/core/domain/view/widgets/abc_button.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_scaffold.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_card.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/navigation/abc_router.gr.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AccountSyncPage extends StatelessWidget {
  const AccountSyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbcScaffold(
      adaptativeBuilder: (context, type, constraints) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AbcButton.backButton(
                context: context,
                onPressed: () => context.router.replace(const DashboardRoute()),
              ),
            ),
            SizedBox(
              height: context.dimensions.vMargin * 2,
            ),
            AbcTitleCard(
              title: context.intl.syncAccountPageTitle,
              description: '',
              descriptionStyle: Theme.of(context).textTheme.bodyLarge,
              imageUrl: Images.accountSync,
              childBellow: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(context.intl.accountSyncPageSyncAccount)),
                      Image.asset(Images.googleIcon, width: 40, height: 40, fit: BoxFit.contain),
                    ],
                  ),
                  onPressed: () => _connectGoogleAccount(context),
                ),
              ),
              // child: Container(
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(
              //       color: Theme.of(context).primaryColor,
              //       width: 2
              //     )
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(context.intl.accountSyncPageSyncAccount),
              //       Image.asset(Images.googleIcon, width: 40, height: 40, fit: BoxFit.contain),
              //     ],
              //   ),
              // ),
            )
          ],
        );
      },
    );
  }

  _connectGoogleAccount(BuildContext context) {
   
  }
}
