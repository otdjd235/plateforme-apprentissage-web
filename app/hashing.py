import hashlib
import os
import base64

def hash_password(password):
    salt = os.urandom(16)
    key = hashlib.pbkdf2_hmac(
        'sha256',                  
        password.encode(),         
        salt,                      
        100_000                    
    )
    return base64.b64encode(salt + key).decode()

def verify_password(stored_password, input_password):
    decoded = base64.b64decode(stored_password.encode())
    salt = decoded[:16]
    stored_key = decoded[16:]
    input_key = hashlib.pbkdf2_hmac('sha256', input_password.encode(), salt, 100_000)
    return stored_key == input_key
