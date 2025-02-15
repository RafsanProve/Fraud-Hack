from flask import Blueprint, request, jsonify
from services.auth_service import register_user, login_user

auth_bp = Blueprint("auth_bp", __name__)

@auth_bp.route("/register", methods=["POST"])
def register():
    data = request.json
    return jsonify(register_user(data))

@auth_bp.route("/login", methods=["POST"])
def login():
    data = request.json
    return jsonify(login_user(data))