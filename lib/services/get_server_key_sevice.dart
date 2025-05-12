import 'package:googleapis_auth/auth_io.dart';

class GetServerKeySevice {
  Future<String> getServerKeyToker() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "fir-notification-1a116",
          "private_key_id": "d7afa027ec02b25516fae9ce0ac598c95233c9d7",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9ntaLldH8Xrwg\nDLDzJiYxl2AjFr3ydhlV3A68bGOtI4t8ij89LAutmwQg1CL4CQZiFHtuoQHDPx3v\nl6TbhHQlU9bZOwI3C4ojKFxfm8NkvwH1QgDC+OnxawSb+R9HagdLisQmMTfpKb2I\nETBuGyTL1HY75WGv9q1Xd9q2q46W86ZtDZ7sFpvZj8gyLVWOrHUeTkIYV5O2I+RH\nr8dBShXgIzOtrwxVSIMLrox49lcYpruiSmoSnJ5gSo+2Kzhbyu+jogd7anQns8lS\nEHW/DGnZVWQ3+9gJ9Kdp3IAXT2vpgOMTHehvvBy7IfLlxu/afURHaP5AzU/FfUiJ\nk9dmiFhHAgMBAAECggEAFiQI1c2i8j6MOuB10j5fG/qamB5HWZtJRAmTkuluY2tm\nFcmoBALeQ4wj2Zgg6SisnSEvycV1COZCyZTBrtFyz7T6vkIHSoQcwhQsDQyJWScl\nxGHLkviGNdE9fYouM87Wlo8tGMSLIbzk9jwDlVJdY+DQBBhkOqv+pjBG0n41Amex\nlCbsPsLDFTMUf8Vcw/ymnObIYgZtCRcTXzuuhrH5qIz+k7mIl4wla6S1KcM7sF39\nzpd5sGW7KTjaxjn2SVuxiLZzcIYLZfrGe0qAZ52+Wj4jbL1ASGa+6f2QDTg7cfj2\ncAY2DonaIvme9F51aF+6x+x5bz/sxMEVKHcgpm4AoQKBgQD5nrhOBtp3nLhMLosl\nI9dOjIoWbL0zDxLup28gfrDPut7dTS7yVvlXvEHAxWLZpF4peqJ6+MN13UUjGJbj\nET+EPfWfM9yJl4yEpcLUfj+53rtBxtgVzHt1KoJ2Eop3wTu70LgHYbsHf3TcH8fm\nzx+k3FwobDivMp45l4XLFPQu1wKBgQDCd4mGL9Y2gTdItk3VgvM3fV5WtaVFNAPG\nO93tDm7XuvN5pY58vDxKh5ystRznQoPM+xBPzySW0mU/U9VqzW2Jpe17K66otsaP\nX4+IcuAAovhUU2NDurONMeu31G4hQeSuWLCidbP7kZJIm90wAF2vOFB9QPs36yOC\nBQN+wb0kEQKBgChLMa8OtidGug06GiX1oiTA1O2HwgbC8ShrCKozKTFvFdidQ+3E\nkl1SOz713d4KBVUmwaGeFFcrT6S5rGmc+CbNpZ98TKY9O2aSJ2ALvRew14NnqKvk\nJS2lngeXOJjaLV1E9N/kK7+rGF8MFkWwu4fuNkYkKgZF4nqjdepxSHVjAoGBAIGt\n4xiHl+q62lnzsA28iGItiRZ7hR2T5RxxWbm2UTYtJiWtwEnv4Ki2rEUDdaXF1kx/\n8820zaqB3SCQ0BWrresHqkjjxVIeqGR9jiKosDXcd4sMHHrS6t8yNgVddJ9a6JtW\n61s68G3HEmy2+5YB+HdbL1mHVr9gX0pZ+42wtmdxAoGAVV/nsxjqEqaCYLxUCoQL\nvHjC7HVKRh27Q83thaVucG6JtQc8Q+dqSAu4mjTDjeXI6q/pR4uS5seJMGFqK8BX\ndHgRvjG6tmnH2rfEfyqOSk4A+1a177HrXyL35w99MBC0lFZnYvFd7E9pdG2MtIxd\ncX8dJdJXYwF0vibP0AMRIgg=\n-----END PRIVATE KEY-----\n",
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
