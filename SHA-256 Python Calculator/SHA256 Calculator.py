'''
Author: Uzair Khan
Date: 02-22-2026
Purpose: The purpose of this Python program is to calculate a SHA-256 hash for a message without a secret key.
'''
import hashlib

# Message to hash:
message = "Encryption is strong."

# Encode the Message
sha256_hash = hashlib.sha256(message.encode()).hexdigest()

# Output the Result

print("SHA-256 hash:", sha256_hash)
