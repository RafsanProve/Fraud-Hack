import jwt
import datetime
from flask import request, jsonify
import config

def generate_token(user_id):
    token = jwt.encode({
        "user_id": user_id,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)
    }, config.SECRET_KEY, algorithm="HS256")
    return token

def token_required(f):
    from functools import wraps
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get("Authorization")
        if not token:
            return jsonify({"error": "Token is missing!"}), 403
        try:
            data = jwt.decode(token, config.SECRET_KEY, algorithms=["HS256"])
            user_id = data["user_id"]
        except:
            return jsonify({"error": "Token is invalid!"}), 403
        return f(user_id, *args, **kwargs)
    return decorated