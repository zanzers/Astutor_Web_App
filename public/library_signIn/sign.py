from flask import jsonify, request
from public.conn import db_read, db_write
from public.library_login.login import hash_password
from http import HTTPStatus





def sign_student():
 
    try:

        data = request.get_json()
        username = data.get("username")
        password = data.get("password")

        
        print(username, password, "sign_student")


        query = """SELECT * FROM USER WHERE username = %s"""
        existing_user = db_read(query, (username,))

        if existing_user:
            return jsonify({
                "error": "User already exists",
                "success": False
            }), HTTPStatus.CONFLICT

        hashed_pass = hash_password(password)

        insert_query = """INSERT INTO USER (username, password) VALUES(%s, %s)"""
        db_write(insert_query, (username, hashed_pass))

        return jsonify({
            "message": "Registration successful",
            "success": True,
            "redirect_url": '/api/login',
        }), HTTPStatus.CREATED
    
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({
            "error": "Internal server error",
            "success": False
        }), HTTPStatus.INTERNAL_SERVER_ERROR
    

def check_ExistsUser():
    try:
        data = request.get_json()
        username = data.get("username")

        if not username:
            return jsonify({
                "error": "Username is required",
                "success": False,
            }), HTTPStatus.BAD_REQUEST
        
        query = """SELECT * FROM USER WHERE username = %s"""
        existing_user = db_read(query, (username,))

        if existing_user:
            return jsonify({
                "message": "User already exists",
                "exists": True
            }), HTTPStatus.BAD_REQUEST
        else:
            return jsonify({
                "message": "Username available",
                "exists": False
            }), HTTPStatus.OK
    except Exception as e:
            
            print(f"Error checking username: {e}")
            return jsonify({"error": "Internal server error", "success": False}), HTTPStatus.INTERNAL_SERVER_ERROR
