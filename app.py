from flask import Flask, render_template, request, jsonify, redirect, url_for, session
from public.library_login.login import login_student


app = Flask(__name__)


@app.route('/api/login', methods=['GET', 'POST'])
def login():
 
    if request.method == 'POST':
        response, status_code = login_student() 
        response_json = response.get_json() 

        if status_code == 200:
            print("Response by login_student-200:", response_json, status_code)
            return response, status_code

        
        print("Response by login_student:", response_json, status_code)
        return response, status_code

    return render_template('login.html')







@app.route('/api/signup', methods=['GET', 'POST'])
def signIn():

    

    return render_template('signup.html')



@app.route('/api/index')
def index():
    
        return render_template('index.html')





if __name__ == '__main__':
    app.run(debug=True)
