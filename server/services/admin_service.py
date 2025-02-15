import firebase_admin
from firebase_admin import credentials, firestore
import config

# Ensure Firebase is initialized once
if not firebase_admin._apps:
    cred = credentials.Certificate(config.FIREBASE_CREDENTIALS_PATH)
    firebase_admin.initialize_app(cred)

db = firestore.client()


if not firebase_admin._apps:
    cred = credentials.Certificate(config.FIREBASE_CREDENTIALS_PATH)
    firebase_admin.initialize_app(cred)

def freeze_account(data):
    user_ref = db.collection("users").document(data["user_id"])
    user_ref.update({"status": "frozen"})
    return {"message": "User account frozen!"}

def unfreeze_account(data):
    user_ref = db.collection("users").document(data["user_id"])
    user_ref.update({"status": "active"})
    return {"message": "User account unfrozen!"}