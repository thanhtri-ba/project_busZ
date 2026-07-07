# API Documentation

This document outlines the REST APIs used by the application to interact with the backend services.

## Base URL

`https://api.yourdomain.com/v1`

## Authentication

All secured endpoints require a Bearer token in the Authorization header:
`Authorization: Bearer <your_token>`

---

## Endpoints

### 1. Authentication

#### Login
- **Endpoint:** `/auth/login`
- **Method:** `POST`
- **Body:**
  ```json
  {
    "email": "user@example.com",
    "password": "password123"
  }
  ```
- **Response:** `200 OK`
  ```json
  {
    "token": "eyJhbG...",
    "user": {
      "id": 1,
      "name": "John Doe"
    }
  }
  ```

### 2. User Profile

#### Get Profile
- **Endpoint:** `/user/profile`
- **Method:** `GET`
- **Response:** `200 OK`
  ```json
  {
    "id": 1,
    "name": "John Doe",
    "email": "user@example.com"
  }
  ```

*(Add more endpoints related to your app features like bookings, trips, etc. here)*
