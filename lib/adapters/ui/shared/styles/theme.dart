import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/size_extension.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/colors.dart';

class CommonTheme {
  static const primaryValue = 0xff68C0B8;
  static const primaryColorMaterial = MaterialColor(
    primaryValue,
    {
      50: Color.fromRGBO(104, 192, 184, 1),
      100: Color.fromRGBO(104, 192, 184, 0.9),
      200: Color.fromRGBO(104, 192, 184, 0.8),
      300: Color.fromRGBO(104, 192, 184, 0.7),
      400: Color.fromRGBO(104, 192, 184, 0.6),
      500: Color.fromRGBO(104, 192, 184, 0.5),
      600: Color.fromRGBO(104, 192, 184, 0.4),
      700: Color.fromRGBO(104, 192, 184, 0.3),
      800: Color.fromRGBO(104, 192, 184, 0.2),
      900: Color.fromRGBO(104, 192, 184, 0.1),
    },
  );
  static const primaryColor = Color(primaryValue);
  static const primaryColorLight = AppColors.tealLight;
  static const primaryColorDark = AppColors.tealDark;
  static const secondaryColor = AppColors.pinkNormal;
  static const secondaryColorLight = AppColors.pinkLight;
  static const thirdColor = AppColors.orangeNormal;
  static const thirdColorLight = AppColors.orangeLight;

  static const successColor = AppColors.success;
  static const errorColor = AppColors.error;
  static const linkColor = AppColors.blue600;
  static const darkLinkColor = AppColors.blue900;
  static const warningColor = AppColors.warning;

  static const textColor = AppColors.black;
  static const defaultTextColor = AppColors.black;
  static const shadowColor = AppColors.middleGray;
  static const unselectedColor = AppColors.gray;
  static const shadowColorLight = AppColors.gray;
  static const cancelButtonColor = AppColors.gray;
  static const dividerColor = AppColors.lightGray;
  static const appBarShadowColor = AppColors.gray;
  static const disabledColor = AppColors.lightGray;
  static const secondaryTextColor = AppColors.gray;
  static const expasionTileIconColor = AppColors.lightGray;

  static const statusBarColor = AppColors.black;
  static const systemNavigationBarColor = AppColors.black;

  static const navBarColor = AppColors.white;
  static const valeBarColor = AppColors.tealLight;
  static const appBarColor = AppColors.white;
  static const disabledTextColor = AppColors.white;
  static const darkButtonTextColor = AppColors.white;
  static const backgroundColor = AppColors.whitesmoke;
  static const navbarItemSelectedBackgroundColor = AppColors.tealNormalHover;

  static const Color laughIconBackground = Color.fromARGB(255, 154, 221, 134);
  static const Color mehIconBackground = Color.fromARGB(255, 152, 189, 233);
  static const Color smileIconBackground = Color.fromARGB(255, 248, 224, 128);
  static const Color frownIconBackground = Color.fromARGB(255, 224, 115, 96);

  static TextStyle bodySmall = TextStyle(fontSize: 12.sp);
  static TextStyle bodyMedium = TextStyle(fontSize: 14.sp);
  static TextStyle bodyLarge = TextStyle(fontSize: 16.sp);

  static TextStyle labelSmall = TextStyle(fontSize: 11.sp);
  static TextStyle labelMedium = TextStyle(fontSize: 12.sp);
  static TextStyle labelLarge = TextStyle(fontSize: 14.sp);

  static TextStyle titleSmall = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold);
  static TextStyle titleMedium = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);
  static TextStyle titleLarge = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold);

  static TextStyle headlineSmall = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold);
  static TextStyle headlineMedium = TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold);
  static TextStyle headlineLarge = TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold);

  static TextStyle displaySmall = TextStyle(fontSize: 36.sp);
  static TextStyle displayMedium = TextStyle(fontSize: 45.sp);
  static TextStyle displayLarge = TextStyle(fontSize: 57.sp);

  /* ---------- Text Styles ---------- */
  static final bodySmallStyle = bodySmall.copyWith(color: textColor);
  static final bodySmallLightStyle = bodySmall.copyWith(color: CommonTheme.darkButtonTextColor);

  static final bodyMediumStyle = bodyMedium.copyWith(color: textColor);
  static final bodyMediumLightStyle = bodyMedium.copyWith(color: darkButtonTextColor);
  static final formErrorStyle = bodyMedium.copyWith(color: errorColor, decorationColor: errorColor);

  static final bodyLargeStyle = bodyLarge.copyWith(color: textColor);

  static final titleMediumTextStyle = titleMedium.copyWith(color: textColor);
  static final homeCardTitleTextStyle = titleMedium.copyWith(color: primaryColor);
  static final titleMediumLightStyle = titleMedium.copyWith(color: darkButtonTextColor);

  static final cardBodyTextStyle = titleSmall.copyWith(color: textColor);
  static final titleSmallLightStyle = titleSmall.copyWith(color: darkButtonTextColor);

  static final appBarTextStyle = titleMedium.copyWith(color: statusBarColor);

  static const systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: CommonTheme.statusBarColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: CommonTheme.statusBarColor,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  /* ---------- Default Elevation ---------- */
  static const defaultCardElevation = 1.5;

  /* ---------- Default constants ---------- */
  static final baseBarHeight = 0.09.sh;
  static final appBarHeight = 0.07.sh;
  static final barHeight = 0.04.sh;
  static final defaultButtonHeight = hJM(6);
  static final defaultButtonWidth = wJM(33);
  static final defaultIconSizeChip = wJM(5);

  /* ---------- Default Paddings ---------- */
  static final defaultBodyPadding = EdgeInsets.all(wJM(4));
  static final defaultCardPadding = EdgeInsets.all(wJM(4));
  static final defaultButtonPadding = EdgeInsets.symmetric(horizontal: wJM(3));
  static final defaultPadding = EdgeInsets.symmetric(horizontal: wJM(5), vertical: hJM(1.5));

  /* ---------- Default Radius ---------- */
  static final defaultCardRadius = defaultImageRadius;
  static final defaultImageRadius = BorderRadius.circular(10);
  static final navbarItemRadius = BorderRadius.circular(20);
  static const defaultButtonRadius = BorderRadius.all(Radius.circular(15));

  /* ---------- Scrollbar Styles ---------- */
  static final defaultScrollbarThickness = wJM(1);
  static const defaultScrollbarRadius = Radius.circular(10.0);

  /* ---------- BoxShadow Styles ---------- */
  static final List<BoxShadow> defaultAppBarboxShadow = [
    BoxShadow(
      blurRadius: 3,
      spreadRadius: 3,
      offset: const Offset(0, 5),
      color: CommonTheme.appBarShadowColor.withOpacity(0.1),
    ),
  ];

  static final List<BoxShadow> defaultNavBarboxShadow = [
    BoxShadow(
      blurRadius: 3,
      spreadRadius: 3,
      offset: const Offset(0, -5),
      color: CommonTheme.appBarShadowColor.withOpacity(0.1),
    ),
  ];

  /* ---------- Buttons Styles ---------- */
  static final datePickerButtonStyle = ButtonStyle(padding: WidgetStatePropertyAll(defaultButtonPadding));

  static const inputDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: CommonTheme.primaryColor, width: 1),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: CommonTheme.primaryColor, width: 2),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 1),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: errorColor, width: 1),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: disabledColor, width: 1),
    ),
  );
}

const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const List<Locale> supportedAppLocales = [
  Locale('es'),
];

final appThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: TextTheme(
    labelSmall: CommonTheme.labelSmall,
    labelMedium: CommonTheme.labelMedium,
    labelLarge: CommonTheme.labelLarge,
    titleSmall: CommonTheme.titleSmall,
    titleMedium: CommonTheme.titleMedium,
    titleLarge: CommonTheme.titleLarge,
    headlineSmall: CommonTheme.headlineSmall,
    headlineMedium: CommonTheme.headlineMedium,
    headlineLarge: CommonTheme.headlineLarge,
    displaySmall: CommonTheme.displaySmall,
    displayMedium: CommonTheme.displayMedium,
    displayLarge: CommonTheme.displayLarge,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.tealNormal,
    onPrimary: AppColors.tealDark,
    secondary: AppColors.pinkNormal,
    onSecondary: AppColors.pinkNormalHover,
    error: AppColors.error,
    onError: AppColors.pinkDarker,
    surface: AppColors.tealLight,
    onSurface: AppColors.tealDark,
  ),
  cardColor: CommonTheme.backgroundColor,
  navigationBarTheme: const NavigationBarThemeData(indicatorShape: StadiumBorder()),
  dialogBackgroundColor: CommonTheme.backgroundColor,
  disabledColor: CommonTheme.disabledColor,
  dividerColor: CommonTheme.dividerColor,
  primaryColor: CommonTheme.primaryColor,
  scaffoldBackgroundColor: CommonTheme.backgroundColor,
  shadowColor: AppColors.gray,
  primarySwatch: CommonTheme.primaryColorMaterial,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  cardTheme: const CardTheme(
    color: CommonTheme.backgroundColor,
    elevation: 2.0,
    surfaceTintColor: CommonTheme.backgroundColor,
  ),
  iconTheme: IconThemeData(size: 0.04.sh),
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: Colors.transparent,
    collapsedBackgroundColor: Colors.transparent,
    expandedAlignment: Alignment.centerLeft,
    childrenPadding: EdgeInsets.symmetric(horizontal: wJM(3)),
    textColor: CommonTheme.textColor,
    iconColor: CommonTheme.textColor,
    collapsedIconColor: CommonTheme.textColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0), side: BorderSide.none),
    collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0), side: BorderSide.none),
  ),
);
