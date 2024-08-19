import os 
from flask import Flask, request, jsonify, session
from crud.user import createUser, loginUser
from flask_cors import CORS

app=Flask(__name__)
app.secret_key=os.getenv('APP_SECRET_KEY')


@app.route("/")
def index():
    return "hello"


@app.route('/register', methods=["POST"])
def register():
    try:
        if request.method == "POST":
            data=request.get_json()
            user_name = str(data.get('user_name'))
            phone_number = str(data.get('phone_number'))
            password = str(data.get('password'))
            
            _status, userId=createUser(user_name=user_name, phone_number=phone_number, password=password)
            session['userId']=userId
            
            if _status == 201:
                return jsonify({'detail': "User created successfully"}), 201
            else:
                return jsonify({'detail': "User name already registered"}), 400
    except Exception as e:
        return jsonify({'error': str(e)})
    
    
@app.route('/login', methods=["POST"])
def login():
    try:
        if request.method == "POST":
            data=request.get_json()
            user_name = str(data['user_name'])
            password = str(data['password'])
            
            _status, userId=loginUser(user_name=user_name, password=password)
            
            
            session['userId']=userId
            
            if _status == 200:
                return jsonify({"detail":"user logging successfully"}), 200
            elif _status == 400:
                return jsonify({'detail': "Incorrect password"}), 400
            elif _status==401:
                return jsonify({'detail': "Incorrect user name"}), 401
            else: 
                return jsonify({'detail': "Unexpected error"}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
@app.route('/logout', methods=["GET", "POST"])
def logout():
    try:
        session.clear()  
    except Exception as e:
        return jsonify({'error': str(e)}), 400
        

        
        
            