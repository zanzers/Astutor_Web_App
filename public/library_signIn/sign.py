from flask import jsonify, request
from public.conn import db_read, db_write
from public.library_login.login import hash_password
from http import HTTPStatus





def sign_student():
 
    try:

        data = request.get_json()
        username = data.get("username")
        password = data.get("password")

        
        query = """SELECT * FROM student WHERE username = %s"""
        existing_user = db_read(query, (username,))

        if existing_user:
            return jsonify({
                "error": "User already exists",
                "success": "False"
            }), HTTPStatus.CONFLICT

        hashed_pass = hash_password(password)

        insert_query = """INSERT INTO student (username, password) VALUES(%s, %s)"""
        db_write(insert_query, (username, hashed_pass))

        return jsonify({
            "message": "Registration successful",
            "success": "True"
        }), HTTPStatus.CREATED
    
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({
            "error": "Internal server error",
            "success": "False"
        }), HTTPStatus.INTERNAL_SERVER_ERROR