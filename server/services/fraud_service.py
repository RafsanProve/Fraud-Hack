from firebase_admin import firestore

db = firestore.client()

def detect_fraud(transaction):
    fraud_detected = False
    fraud_reason = ""

    if transaction["amount"] > 10000:  # Example threshold
        fraud_detected = True
        fraud_reason = "Unusual transaction amount"

    if fraud_detected:
        fraud_id = db.collection("fraud_cases").document().id
        db.collection("fraud_cases").document(fraud_id).set({
            "transaction_id": transaction["transaction_id"],
            "fraud_reason": fraud_reason,
            "fraud_score": 90,
            "is_verified": False
        })
    return fraud_detected, fraud_reason