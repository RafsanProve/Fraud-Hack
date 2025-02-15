from flask import Blueprint, request, jsonify
from services.admin_service import freeze_account, unfreeze_account

admin_bp = Blueprint("admin_bp", __name__)

@admin_bp.route("/freeze", methods=["POST"])
def freeze():
    data = request.json
    return jsonify(freeze_account(data))

@admin_bp.route("/unfreeze", methods=["POST"])
def unfreeze():
    data = request.json
    return jsonify(unfreeze_account(data))