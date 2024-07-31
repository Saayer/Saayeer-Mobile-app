enum FlavorType { DEV, STAGING, PROD }

enum RequestState { LOADING, LOADED, ERROR, SUCCESS }

enum UserStatus { GUEST, LOGGED_IN }

enum DataSource { REMOTE, LOCAL }

enum UserConnectWay { FACEBOOK, GOOGLE, MANUAL }

enum AddEditAddressType { addAddress, editAddress }

enum PaymentMethodType {
  CASH._("Cash"),
  WALLET._("Wallet"),
  CREDIT._("Credit");

  final String name;

  const PaymentMethodType._(this.name);
}
