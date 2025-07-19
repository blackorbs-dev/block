import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/svg_icon.dart';
import 'package:block/features/dashboard/presentation/cubits/phone_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDropDown extends StatelessWidget{
  const CountryDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final countryList = ['NG','US','GH','UK'];
    final country = context.select((PhoneCubit cubit) => cubit.state.country);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countryList.map((c) => DropdownMenuItem(
            value: c,
            child: Text('${countryFlag(c)} ($c)', style: context.theme.textTheme.bodyMedium),
          )).toList(),
          selectedItemBuilder: (context) =>
            countryList.map((item) =>
                Align(
                  widthFactor: 1.4,
                  alignment: Alignment.centerLeft,
                  child: Text(countryFlag(item), style: context.theme.textTheme.bodyMedium),
                )
            ).toList(),
          icon: Row(
            children: [
              SvgIcon('assets/icons/ic_drop_down.svg', size: 14),
              Container(
                height: 22,
                width: 1,
                color: context.theme.colors.greyAccent,
                margin: const EdgeInsets.only(left: 6),
              )
            ],
          ),
          onChanged: (value) {
            if (value != null) {
              context.read<PhoneCubit>().updateCountry(value);
            }
          },
        ),
      ),
    );
  }


  String countryFlag(String code) => code.codeUnits
      .map((char) => String.fromCharCode(0x1F1E6 + (char - 65)))
      .join();
}