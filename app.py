from flask import Flask, render_template, request, jsonify, redirect, url_for, session
from public.library_login.login import login_student
from public.library_signIn.sign import sign_student, check_ExistsUser

app = Flask(__name__)


@app.route('/api/login', methods=['GET', 'POST'])
def login():
 
    if request.method == 'POST':
        response, status_code = login_student() 
        if status_code == 200:
            return response, status_code
    return render_template('login.html')



@app.route('/api/signup', methods=['GET', 'POST'])
def signIn():

    if request.method == 'POST':
         response, status_code = sign_student();
         return response, status_code
    return render_template('signup.html')



@app.route('/api/index')
def index():
    
        return render_template('index.html')




@app.route('/api/check_user', methods=['POST'])
def check_user():
        if request.method == 'POST':
             responce, status_code = check_ExistsUser()
             return responce, status_code




if __name__ == '__main__':
    app.run(debug=True)
