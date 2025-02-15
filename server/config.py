import os

FIREBASE_CREDENTIALS_PATH = os.path.join(os.path.dirname(__file__), "firebase_credentials.json")
SECRET_KEY = os.environ.get('SECRET_KEY')