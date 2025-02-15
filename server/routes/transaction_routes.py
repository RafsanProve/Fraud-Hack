from flask import Blueprint, request, jsonify
from services.transaction_service import process_transaction, get_transactions

transaction_bp = Blueprint("transaction_bp", __name__)

@transaction_bp.route("/create", methods=["POST"])
def create_transaction():
    data = request.json
    return jsonify(process_transaction(data))

@transaction_bp.route("/list", methods=["GET"])
def list_transactions():
    user_id = request.args.get("user_id")
    return jsonify(get_transactions(user_id))