class AdminAction:
    def __init__(self, action_id, admin_id, affected_user, action_type, action_reason):
        self.action_id = action_id
        self.admin_id = admin_id
        self.affected_user = affected_user
        self.action_type = action_type
        self.action_reason = action_reason