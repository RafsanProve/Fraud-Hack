from fraudlabspro.fraudvalidation import FraudValidation

API_KEY = '6KZ47SHMKNVRYDOYK68OCJOFSSENT1W9'

class detect_fraud:
    def __init__(self, name,trans_id, ip_addr, amount):
        self.name = name
        self.trans_id = trans_id
        self.ip_addr = ip_addr
        self.api_valid = FraudValidation(API_KEY)
        self.amount = amount

    def call_fraudlab_api(self):
        '''
            returns true if fraud
        '''

        data = {
            'ip': self.ip_addr,
            'order': {
                'currency': 'BDT',
                'amount': f'{self.amount}',
                'quantity': 1, 
                'paymentGateway': 'stripe',
                'paymentMethod': 'cod'
            },
            'billing': {
                'firstName': self.name,
                'country': 'BD',
            },
            'shipping': {
                'country': 'BD',
            }
        }

        result = self.api_valid.validate(data)

        if result["ip_geolocation"]["is_proxy"] or result["billing_address"]["is_ip_country_match"] or result["device"]["is_malware_exploit"]:
            return True

        else:
            return False
        
    def query_budget(self):
        pass

    def transication_budget(self):
        pass
    
    