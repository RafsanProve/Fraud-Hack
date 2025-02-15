import bcrypt
from utils import generate_token
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

def register_user(data):
    email = data["email"]
    password = data["password"]
    hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")
    user_id = db.collection("users").document().id
    db.collection("users").document(user_id).set({
        "user_id": user_id,
        "full_name": data["full_name"],
        "email": email,
        "password_hash": hashed_password,
        "account_balance": 1000.00,
        "country": data["country"],
        "status": "active"
    })
    return {"message": "User registered successfully!"}

def login_user(data):
    email = data["email"]
    password = data["password"]
    user_ref = db.collection("users").where("email", "==", email).stream()
    user = next(user_ref, None)
    if not user:
        return {"error": "User not found!"}, 400
    user_data = user.to_dict()
    if bcrypt.checkpw(password.encode("utf-8"), user_data["password_hash"].encode("utf-8")):
        token = generate_token(user_data["user_id"])
        return {"token": token}, 200
    return {"error": "Invalid credentials!"}, 401