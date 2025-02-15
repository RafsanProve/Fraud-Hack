class User:
    def __init__(self, user_id, full_name, email, password_hash, account_balance, country, status):
        self.user_id = user_id
        self.full_name = full_name
        self.email = email
        self.password_hash = password_hash
        self.account_balance = account_balance
        self.country = country
        self.status = status