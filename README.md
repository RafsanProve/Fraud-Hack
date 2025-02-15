# Fraud-Hack
A Financial Transaction System that can effectively detect fraud

# **API Documentation: Financial Fraud Detection System**

## **Base URL**
```
http://127.0.0.1:5000/
```

---
## **Authentication APIs**

### **1. User Registration**
**Endpoint:** `/auth/register`
**Method:** `POST`
**Description:** Registers a new user.

**Request Body:**
```json
{
  "full_name": "John Doe",
  "email": "johndoe@example.com",
  "password": "securepassword",
  "country": "USA"
}
```

**Response:**
```json
{
  "message": "User registered successfully!"
}
```

---

### **2. User Login**
**Endpoint:** `/auth/login`
**Method:** `POST`
**Description:** Authenticates a user and returns a JWT token.

**Request Body:**
```json
{
  "email": "johndoe@example.com",
  "password": "securepassword"
}
```

**Response:**
```json
{
  "token": "your_jwt_token"
}
```

---
## **Transaction APIs**

### **3. Create a Transaction**
**Endpoint:** `/transaction/create`
**Method:** `POST`
**Description:** Records a financial transaction.

**Headers:**
```
Authorization: Bearer your_jwt_token
```

**Request Body:**
```json
{
  "user_id": "user_123",
  "amount": 200.00,
  "transaction_type": "transfer",
  "status": "completed",
  "ip_address": "192.168.1.1",
  "location": "New York, USA"
}
```

**Response:**
```json
{
  "message": "Transaction recorded successfully!"
}
```

---

### **4. List User Transactions**
**Endpoint:** `/transaction/list`
**Method:** `GET`
**Description:** Retrieves all transactions of a user.

**Query Parameters:**
```
?user_id=user_123
```

**Response:**
```json
[
  {
    "transaction_id": "txn_001",
    "amount": 200.00,
    "transaction_type": "transfer",
    "status": "completed",
    "ip_address": "192.168.1.1",
    "location": "New York, USA"
  }
]
```

---
## **Fraud Detection APIs**

### **5. Detect Fraud**
**Endpoint:** `/fraud/detect`
**Method:** `POST`
**Description:** Detects fraudulent transactions based on various parameters.

**Request Body:**
```json
{
  "transaction_id": "txn_001",
  "user_id": "user_123",
  "amount": 10000.00,
  "ip_address": "192.168.1.1",
  "location": "New York, USA"
}
```

**Response:**
```json
{
  "fraud": true,
  "reason": "Unusual transaction amount"
}
```

---
## **Admin APIs**

### **6. Freeze User Account**
**Endpoint:** `/admin/freeze`
**Method:** `POST`
**Description:** Freezes a user account due to fraudulent activity.

**Request Body:**
```json
{
  "user_id": "user_123"
}
```

**Response:**
```json
{
  "message": "User account frozen!"
}
```

---

### **7. Unfreeze User Account**
**Endpoint:** `/admin/unfreeze`
**Method:** `POST`
**Description:** Unfreezes a previously frozen user account.

**Request Body:**
```json
{
  "user_id": "user_123"
}
```

**Response:**
```json
{
  "message": "User account unfrozen!"
}
```

---
## **Security Notes**
- All requests (except registration & login) require a JWT token in the `Authorization` header.
- Fraud detection is automated based on transaction history and predefined rules.
- Admin users have access to account freezing/unfreezing functionality.

**📌 API Version:** `v1.0`

