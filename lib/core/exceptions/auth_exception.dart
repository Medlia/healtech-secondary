// Sign up exceptions
class InvalidEmailException implements Exception {}

class WeakPasswordException implements Exception {}

class EmailAlreadyInUseException implements Exception {}

// Log in exceptions
class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

// Generic exceptions
class GenericException implements Exception {}

class UserNotLoggedInException implements Exception {}

// Google Signin Exceptions
class AccountExistsWithDifferentCredentialException implements Exception {}

class InvalidCredentialException implements Exception {}

class OperationNotAllowedException implements Exception {}

class UserDisabledException implements Exception {}
