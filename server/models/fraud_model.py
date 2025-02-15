class FraudCase:
    def __init__(self, fraud_id, user_id, transaction_id, fraud_reason, fraud_score, is_verified):
        self.fraud_id = fraud_id
        self.user_id = user_id
        self.transaction_id = transaction_id
        self.fraud_reason = fraud_reason
        self.fraud_score = fraud_score
        self.is_verified = is_verified