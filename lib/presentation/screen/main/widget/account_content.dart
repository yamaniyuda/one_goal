import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconify_flutter/icons/icon_park_twotone.dart';

class AccountContent extends StatelessWidget {
    const AccountContent({super.key});

    @override
    Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;

        return Stack(
            clipBehavior: Clip.none, 
            children: [
                Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: screenWidth,
                    padding: const EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                        ),
                        border: Border.all(
                            color: Colors.grey,
                        ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const SizedBox(height: 100),
                            Text(
                                AppLocalizations.of(context)!.account_setting,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                ),
                            ),
                            const SizedBox(height: 10),
                            ListTile(
                                leading: Iconify(
                                    IconParkTwotone.abnormal,
                                    color: Colors.black,
                                    size: 30,
                                ),
                                title: Text(
                                    AppLocalizations.of(context)!.personal_data_title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                    ),
                                ),
                                subtitle: Text(
                                    AppLocalizations.of(context)!.personal_data_desc,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                    ),
                                ),
                            ),
                            ListTile(
                                leading: Iconify(
                                    IconParkTwotone.transaction,
                                    color: Colors.black,
                                    size: 30,
                                ),
                                title: Text(
                                    AppLocalizations.of(context)!.e_statement_title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                    ),
                                ),
                                subtitle: Text(
                                    AppLocalizations.of(context)!.e_statement_desc,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                    ),
                                ),
                            ),
                            ListTile(
                                leading: Iconify(
                                    IconParkTwotone.gift,
                                    color: Colors.black,
                                    size: 30,
                                ),
                                title: Text(
                                    AppLocalizations.of(context)!.referral_title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                    ),
                                ),
                                subtitle: Text(
                                    AppLocalizations.of(context)!.referral_desc,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                    ),
                                ),
                            ),
                            ListTile(
                                leading: Iconify(
                                    IconParkTwotone.peoples_two,
                                    color: Colors.black,
                                    size: 30,
                                ),
                                title: Text(
                                    AppLocalizations.of(context)!.comunity_title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                    ),
                                ),
                                subtitle: Text(
                                    AppLocalizations.of(context)!.comunity_desc,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                    ),
                                ),
                            ),
                            Text(
                                AppLocalizations.of(context)!.app_setting,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                ),
                            ),
                            ListTile(
                                leading: Iconify(
                                    IconParkTwotone.stretching_one,
                                    color: Colors.black,
                                    size: 30,
                                ),
                                title: Text(
                                    AppLocalizations.of(context)!.change_language_title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                    ),
                                ),
                                subtitle: Text(
                                    AppLocalizations.of(context)!.change_language_desc,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                    ),
                                ),
                                onTap: () => context.push('/change-language'),
                            ),
                            ListTile(
                                leading: Iconify(
                                    IconParkTwotone.switch_button,
                                    color: Colors.black,
                                    size: 30,
                                ),
                                title: Text(
                                    AppLocalizations.of(context)!.dark_mode_title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                    ),
                                ),
                                subtitle: Text(
                                    AppLocalizations.of(context)!.dark_mode_desc,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ],
        );
    }
}
