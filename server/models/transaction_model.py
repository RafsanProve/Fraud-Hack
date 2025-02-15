class Transaction:
    def __init__(self, transaction_id, user_id, amount, transaction_type, status, ip_address, location):
        self.transaction_id = transaction_id
        self.user_id = user_id
        self.amount = amount
        self.transaction_type = transaction_type
        self.status = status
        self.ip_address = ip_address
        self.location = location