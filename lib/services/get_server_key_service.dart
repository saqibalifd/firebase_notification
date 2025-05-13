import 'package:googleapis_auth/auth_io.dart';

class GetServerKeySevice {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "fir-notification-1a116",
          "private_key_id": "d699322d82281ae300d54022826b05edb804459f",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDLDWTmZ/du07CN\nWsPFDao1Irz/vnZlR2EOO6qk1V1tfAtSuretsMkgIPBe9FruoS34OA7+u9Yc8N5N\nbdXsCDza4IY9HUizGMX8ABqxw5RRcrheAda2yDfyUu2VNLZzGfkg1qMfCxAfU939\nznVgkA0E7qN+LglwPcom5QxgHxhIfh24aWrXN112N9IitBfXlU2PkWmZv3H913VA\n7Gm0qtEHgwGxLzMHK86nnKyJ1VTxHr2w5UC7VvhJsQJd42blrT0+aP6CqH1Sw7Yd\nYgTfEzx1tbhQrGLinP9pVgNk+q3Yn7PHRuIFgKTQj1rlxugaY9rq9Swe7VxgyK1x\nDoq7tdZbAgMBAAECggEAGzQWBAkCwn4pmvksMulpQnQp0QjnMMYW2oLOPQYkMweu\n4VcIRloMdWRO/9G0oGAcr11x+NkZJEh1kqG39XGHFvsvUN8W/yjprCDRcru//Qd7\nFtvKid4aIg96gAZkuS1OI1hOLgRb6m6LK7aYzXvkb/g5aYK+cKNT7Xu7TuIWQpkm\n6cvpWEtqRbhzU1gDMuFu94aVzQWVUvTwvqNbiALNENbLFu/smPLwMMPIHKZL26u0\nGWj+6UPDJTMkyw/7QKRpJt4OVtFkV1sIphSCVFsWN9GSZkdWNzc32i4oRg2Qawd7\nt5Z7yIIPFXnl4g42IhojS/kgR0xUHXhRwUQ8vG5wTQKBgQD3QE+Cy2wBDul426XV\n72rgV1Po8KFKdQBNYCg7CqMD3MIftsvKxfMkGHVX0uKYXHGDhRWZxZgmYZI3EwZP\ngKG47xfo+jTIvhBcEMmGG3oTEfeL0aOhYu9JPT+4fDMRBfrYDL4kTKEtNuXJLpyA\nRzrzMSuPazPhUK4NHgFQFrOnrQKBgQDSPLbaNwfq1GYV84Hbe5jhmDylw5/hsE0U\nJrhFj5Ike23XhgiWlV8Fx4xXv7odQCFhHIGJfpPEmQtBKCx//s6xQaGgzGZMZaP9\nrrxk+9vCE21nUvZBkpGx6dfL9wcIsJyB6hoonY2LS2WVvY7TP4Wt/M5pJ8UGP3dL\nRaUMKznXJwKBgB9mcHKY6P99aFMr+fSgcj9Jd+OWY7V0BHTPKGzPHgLIj3K9oUYA\nO6+y13wu0Q4ud1APn72mpXsCWzJZXSzNljxJSQ0ScY+o66T1kNJSPP+dAYYlOpWt\nXdw8RhJk24tm6gN0ItWzUajPVwFkxQVZhngKH5EYOT99Io2R6PLF300FAoGBAIsS\noL7/clxUfud8euWPAFYTl+Lr4qKwNnzjFDjnvXwmrkXJI3tBemdfVqZhbSOWXb5Y\n1hP3SJbfysMiaTWOgHpfeSTesblN70qMQZHnzbq3kUKtbbt40qpHj3ocgmmsMwv5\nqa4+cvi3Oo7woz95INw0hPKo3TvB1g9UFddT7OI3AoGACDFXHKFyG+U/XhiQBO7i\nE/D+zYgtbDkCVLEcux5VEKKg2OHB+PG8tBCwUFrlC4IODrxAjHQyAhyB5J9X8PQ5\nF7CIc+5//ckgTK+6XLG1+QsLOx88U0NKRgEHtBMOiU0Hai8/x9uQrTcubvMuVjAf\n6GKFFJcebnnMTKYEy+JV83M=\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-fbsvc@fir-notification-1a116.iam.gserviceaccount.com",
          "client_id": "103880412455304711232",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40fir-notification-1a116.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes);
    final accessServerKey = client.credentials.accessToken.data;
    return accessServerKey;
  }
}
