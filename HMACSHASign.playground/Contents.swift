let message = "message"
let salt = "salt"

print(message.hmacSign(salt, .sha512)!)
