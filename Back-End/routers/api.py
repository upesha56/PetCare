from flask import Flask, request, jsonify
from crud.user import createUser, loginUser

app=Flask(__name__)


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
            
            _status=createUser(user_name=user_name, phone_number=phone_number, password=password)
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
            
            _status=loginUser(user_name=user_name, password=password)
            
            if _status == 200:
                return jsonify({"detail":"user logging successfully"}), 200
            elif _status == 400:
                return jsonify({'detail': "Bad request"}), 400
            else:
                return jsonify({'detail': "Incorrect user name"}), 401
    except Exception as e:
        return jsonify({'error': str(e)}), 400
    
        

        
        
            