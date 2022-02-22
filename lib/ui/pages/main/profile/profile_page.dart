import 'package:flutter/material.dart';
import 'package:valbury/config/config.dart';
import 'package:valbury/ui/ui.dart';
import 'package:valbury/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback? onBack;
  const ProfilePage({Key? key, this.onBack}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onBack?.call();
        return false;
      },
      child: Parent(
        appBar: context.appBar(
          title: Strings.get.profile,
          isPrimary: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              widget.onBack?.call();
            },
          )
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(Dimens.space20),
          child: Container(
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(Dimens.cornerRadius),
              boxShadow: [BoxShadows.card]
            ),
            padding: EdgeInsets.all(Dimens.space20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemProfile(label: Strings.get.email, value: sl<PrefManager>().email),
                SpacerV(value: Dimens.space20,),
                _itemProfile(label: Strings.get.phoneNumber, value: sl<PrefManager>().phone),
                Divider(height: Dimens.space24,),
                Center(
                  child: Button(
                    title: Strings.get.logout,
                    verticalMargin: 0,
                    onPressed: (){
                      context.dialogConfirm(
                        title: Strings.get.logout,
                        message: Strings.get.confirmLogout,
                        onActionYes: (){
                          context.goToClearStack(AppRoute.loginPage);
                          sl<PrefManager>().clear();
                        }
                      );
                    },
                    showShadow: false,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _itemProfile({required String label, required String value}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.body2.copyWith(color: Palette.primary),
        ),
        Text(
          value,
          style: TextStyles.h4,
        ),
      ],
    );
  }
}
