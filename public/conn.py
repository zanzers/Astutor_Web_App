import os
from dotenv import load_dotenv
from urllib.parse import urlparse
import mysql.connector
from mysql.connector import Error
from http import HTTPStatus





load_dotenv()
DATABASE_URL = os.getenv('DATABASE_URL')

config = {}

if DATABASE_URL:
    db_url = urlparse(DATABASE_URL)

    config = {

        'user': db_url.username,
        'password': db_url.password,
        'host': db_url.hostname,
        'database': db_url.path[1:],
    }

else:
    raise ValueError("DATABASE_URL environment variable is not set.")


def db_read(query, param=None):

    conn = mysql.connector.connect(**config)

    if conn.is_connected():
            print("Successfully connected to the database.")

    cursor = conn.cursor(dictionary=True)

    try: 

        if param != None:
            cursor.execute(query, param)
            entries = cursor.fetchall()
            conn.commit()

            cursor.close()
            conn.close()

            return entries
        
        else:
            
            cursor.execute(query)
            entries = cursor.fetchall()
            cursor.close()
            conn.close()
            return entries
        

    except Error as e:

        print(f'Error: {e}')
        return HTTPStatus.INTERNAL_SERVER_ERROR