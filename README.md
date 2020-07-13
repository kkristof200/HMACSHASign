# HMACSHASign

HMAC SHA Sign in swift

## Usage

1. Add /HMACSHASign.playground/Sources/HMACSHASign/* to your project
2. Use it like this:

```swift
let message = "message"
let salt = "salt"

print(message.hmacSign(salt, .sha512)!)
```
