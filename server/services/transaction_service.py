from firebase_admin import firestore

db = firestore.client()

def process_transaction(data):
    transaction_id = db.collection("transactions").document().id
    db.collection("transactions").document(transaction_id).set(data)
    return {"message": "Transaction recorded successfully!"}


def get_transactions(user_id):
    transactions = db.collection("transactions").where("user_id", "==", user_id).stream()
    return [{"transaction_id": t.id, **t.to_dict()} for t in transactions]