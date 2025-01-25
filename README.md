## Astutor web Application

**Description:**  
    This system is designed to help students enhance their academic performance by bridging the gap between learners and tutors. The system provides a personalized learning experience, enabling users to access educational resources, connect with professional tutors, and receive guidance on challenging topics. Astutor caters to a wide range of subjects and skill levels, making learning more accessible and effective..

## Installation
1. Install Flask: 
    ```bash
    pip install flask
    ```

2. Install MySQL connector for Python:
    ```bash
    pip install mysql-connector-python
    ```

3. Install dependencies from `requirements.txt`:
    ```bash
    pip install -r requirements.txt
    ```


5. Install Flask-JWT-Extended for authentication :
    ```bash
    pip install Flask-JWT-Extended
    ```

## Configuration
Environment variables needed:

DATABASE_URL=```#```

SECRET_KEY=```#```


---

# API Endpoints

| Endpoint                                    | Method | Description                            |
|---------------------------------------------|--------|----------------------------------------|
| `/api/auth/login`                           | POST   | Admin login                            |
| `/api/flight_schedules`                     | GET    | List all flight schedules              |
| `/api/flight_schedules/<int:flight_no>`     | GET    | Get details for a specific flight      |
| `/api/flight_schedules`                     | POST   | Create a new flight schedule           |
| `/api/flight_schedules/<int:flight_no>`     | PUT    | Update a specific flight schedule      |
| `/api/flight_schedules/<int:flight_no>`     | DELETE | Delete a specific flight schedule      |

---



## Git Commit Guidelines
### Conventional Commits
```bash
feat: add user authentication
fix: resolve database connection issue
docs: update API documentation
test: add user registration tests

    