const String _passClass = 'mileAndMoreClone';
const String _issuerId = '3388000000022859078';

String getPass(
    {required String userId,
    required String userEmail,
    required String passId,
    required String userFirstName,
    required String userSurName}) {
  final String userPass = """
    {
      "iss": "$userEmail",
      "aud": "google",
      "typ": "savetowallet",
      "origins": [],
      "payload": {
        "genericObjects": [
          {
            "id": "$_issuerId.$userId",
            "classId": "$_issuerId.$_passClass",
            "genericType": "GENERIC_TYPE_UNSPECIFIED",
            "hexBackgroundColor": "#002051",
            "logo": {
              "sourceUri": {
                "uri": "https://play-lh.googleusercontent.com/QLVHbxA2sMIUzk0GUL9_7LoM4TYaZG4TgMIKgc9GiUGdIbriD3erDrpsQvCXwrsq6s_l"
              }
            },
            "cardTitle": {
              "defaultValue": {
                "language": "en",
                "value": "Miles & More"
              }
            },
            "header": {
              "defaultValue": {
                "language": "en",
                "value": "$userFirstName $userSurName"
              }
            },
            "barcode": {
              "type": "QR_CODE",
              "value": "$passId"
            },
            "heroImage": {
              "sourceUri": {
                "uri": "https://play-lh.googleusercontent.com/QLVHbxA2sMIUzk0GUL9_7LoM4TYaZG4TgMIKgc9GiUGdIbriD3erDrpsQvCXwrsq6s_l"
              }
            },
            "textModulesData": [
              {
                "header": "POINTS",
                "body": "1234",
                "id": "points"
              }
            ]
          }
        ]
      }
    }
""";

  return userPass;
}
