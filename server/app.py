from flask import Flask
from flask_cors import CORS
from routes.auth_routes import auth_bp
from routes.transaction_routes import transaction_bp
from routes.fraud_routes import fraud_bp
from routes.admin_routes import admin_bp
import firebase_admin
from firebase_admin import credentials
import config

# Initialize Flask App
app = Flask(__name__)
CORS(app)

# Initialize Firebase if not already initialized
if not firebase_admin._apps:
    cred = credentials.Certificate(config.FIREBASE_CREDENTIALS_PATH)
    firebase_admin.initialize_app(cred)

# Register Blueprints
app.register_blueprint(auth_bp, url_prefix='/auth')
app.register_blueprint(transaction_bp, url_prefix='/transaction')
app.register_blueprint(fraud_bp, url_prefix='/fraud')
app.register_blueprint(admin_bp, url_prefix='/admin')

if __name__ == "__main__":
    app.run(debug=True)
