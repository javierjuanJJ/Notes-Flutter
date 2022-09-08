// Login exceptions

class UserNotFoundAuthException implements Exception {

}
class WrongPasswordAuthException implements Exception {

}

// Register exceptions

class EmailAlreadyInUseAuthException implements Exception {

}

class WeakPasswordAuthException implements Exception {

}

class InvalidEmailAuthException implements Exception {

}

// Generic exception

class GenericAuthException implements Exception {

}


class UserNotLoggedInAuthException implements Exception {

}