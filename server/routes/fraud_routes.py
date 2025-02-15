from flask import Blueprint, request, jsonify
from services.fraud_service import detect_fraud

fraud_bp = Blueprint("fraud_bp", __name__)

@fraud_bp.route("/detect", methods=["POST"])
def check_fraud():
    data = request.json
    is_fraud = detect_fraud(data)
    return jsonify({"fraud": is_fraud})