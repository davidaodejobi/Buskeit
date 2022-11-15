import 'dart:convert';

Map<String, dynamic> decode(String token) {
  try {
    List<String> splitToken = token.split(".");
    String payloadBase64 = splitToken[1];
    String normalizedPayload = base64.normalize(payloadBase64);
    String payloadString = utf8.decode(base64.decode(normalizedPayload));
    Map<String, dynamic> decodedPayload = jsonDecode(payloadString);

    // Return the decoded payload
    return decodedPayload;
  } catch (error) {
    // If there's an error return null
    return {};
  }
}

bool isTokenExpired(String token) {
  try {
    // Decode the token
    final Map<String, dynamic> decodedToken = decode(token);
    if (decodedToken != {}) {
      // Get the expiration date
      final DateTime expirationDate = DateTime.fromMillisecondsSinceEpoch(0)
          .add(Duration(seconds: decodedToken["exp"]));
      // If the current date is after the expiration date, the token is already expired
      return DateTime.now().isAfter(expirationDate);
    } else {
      return true;
    }
  } catch (error) {
    return true;
  }
}
