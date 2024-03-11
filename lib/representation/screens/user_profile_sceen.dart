import 'package:flutter/cupertino.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../../test.dart';
import '../widgets/text_form_field_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});
  static String routeName = '/user_profile_sceen';
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: 'User ProFile',
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: TextFormFieldDemo(),
      ),
    );
  }
}
