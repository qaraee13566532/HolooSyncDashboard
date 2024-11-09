enum AppRouteEnum { loginPage,homePage, settingPage, reportFailedPage, reportInvoicePage }

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.loginPage:
        return "/";
      case AppRouteEnum.homePage:
        return "/home_page";
      case AppRouteEnum.settingPage:
        return "/setting_page";
      case AppRouteEnum.reportFailedPage:
        return "/report_failed_page";
      case AppRouteEnum.reportInvoicePage:
        return "/report_invoice_page";
      default:
        return "/";
    }
  }
}
