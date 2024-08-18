import os 
from flask import Flask, request, jsonify, session
from crud.user import createUser, loginUser
from flask_cors import CORS

app=Flask(__name__)
app.secret_key=os.getenv('APP_SECRET_KEY')
CORS(app=app)


@app.route("/")
def index():
    return "hello"


@app.route('/register', methods=["GET", "POST"])
def register():
    try:
        if request.method == "POST":
            user_name = request.args.get('user_name')
            phone_number = request.args.get('user_name')
            password = request.args.get('password')
            
            _status, userId=createUser(user_name=user_name, phone_number=phone_number, password=password)
            session['userId']=userId
            
            if _status == 201:
                return jsonify({'detail': "User created successfully"}), 201
            else:
                return jsonify({'detail': "User name already registered"}), 409
    except Exception as e:
        return jsonify({'error': str(e)}), 400
    
    
@app.route('/login', methods=["GET", "POST"])
def login():
    try:
        if request.method == "POST":
            user_name = request.args.get('user_name')
            password = request.args.get('password')
            
            _status, userId=loginUser(user_name=user_name, password=password)
            session['userId']=userId
            
            if _status == 200:
                return jsonify({"detail":"user logging successfully"}), 200
            elif _status == 400:
                return jsonify({'detail': "Bad request"}), 400
            else:
                return jsonify({'detail': "Incorrect user name"}), 401
    except Exception as e:
        return jsonify({'error': str(e)}), 400
    
@app.route('/logout', methods=["GET", "POST"])
def logout():
    try:
        session.clear()  
    except Exception as e:
        return jsonify({'error': str(e)}), 400
        

        
        
            