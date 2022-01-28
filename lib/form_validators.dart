final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
final RegExp alphaNumericRegex = RegExp(r"^[a-zA-Z0-9]+$");
final RegExp alphaRegex = RegExp(r"^[a-zA-Z]");
final RegExp numericRegex = RegExp(r"^\d$");
final RegExp hexColorRegex = RegExp(r"^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$");
final RegExp phoneRegex =
    RegExp(r"^(\+0?1\s)?((\d{3})|(\(\d{3}\)))?(\s|-)\d{3}(\s|-)\d{4}$");
final RegExp dateRegex =
    RegExp(r"^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$");
final RegExp urlRegex =
    RegExp(r"^(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+$");
