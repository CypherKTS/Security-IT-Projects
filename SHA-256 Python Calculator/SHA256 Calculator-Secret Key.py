'''
Author: Uzair Khan
Date: 02-22-2026
Purpose: The purpose of this Python program is to calculate a SHA-256 hash for a message given a secret key.
'''
import hashlib
import hmac

# The Secret Key
key = b"4%9MapJ8"  # 8-byte secret key

# Message To Verify
message = b"Meet me at the library."  # The message to be hashed

# If any tag is provided to compare with the actual hash.
provided_tag = "57ac3d7a8b28cd0409935b6a3025acde6efc6f45920c7ea173d5a8e4d83a6526"

# Calculate the HMAC using SHA-256
calculated_tag = hmac.new(key, message, hashlib.sha256).hexdigest()

# Compare the calculated tag with the provided tag
if calculated_tag == provided_tag:
    print(f"Message: {message.decode()} is GENUINE")
    print(f"Message: {calculated_tag} is the actual tag")
else:
    print(f"Message: {message.decode()} is FORGED")

    print(f"Message: {calculated_tag} is the actual tag")
