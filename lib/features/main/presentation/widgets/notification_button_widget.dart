import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family_flutter/core/exports/exports.dart';
import 'package:my_family_flutter/core/utils/dependencies_injection.dart';

import '../../../../core/router/app_router.gr.dart';
import '../../../notification/presentation/bloc/notification_bloc.dart';

class NotificationButtonWidget extends StatefulWidget {
  const NotificationButtonWidget({
    super.key,
  });

  @override
  State<NotificationButtonWidget> createState() =>
      _NotificationButtonWidgetState();
}

class _NotificationButtonWidgetState extends State<NotificationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                width: context.width * 0.08,
                height: context.height * 0.036,
                state.list.isNotEmpty
                    ? IconHelper.notification
                    : IconHelper.bell,
              ),
              onTap: () => context.router.push(
                NotificationListScreenRoute(
                  notifications: state.list,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
