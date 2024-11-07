enum AppRouteEnum { homePage, settingPage, reportFailedPage, reportInvoicePage }

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.homePage:
        return "/";
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
