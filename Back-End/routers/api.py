import os 
from flask import Flask, request, jsonify
from crud.user import createUser, loginUser, getUser, updateUser
from crud.post import addPost, getPost
from crud.pet import addPet


app=Flask(__name__)
app.secret_key=os.getenv('APP_SECRET_KEY')

session=dict()

@app.route("/")
def index():
    return "hello"


@app.route('/register', methods=["POST"])
def register():
    try:
        if request.method == "POST":
            data=request.get_json()
            
            _status, user_name=createUser(**data)
            
            if _status == 201:
                session['user_name'] = user_name
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
            
            _status, user_name=loginUser(**data)
                                                
            if _status == 200:
                session['user_name']=user_name
                return jsonify({"detail":"user logging successfully"}), 200
            elif _status == 400:
                return jsonify({'detail': "Incorrect password"}), 400
            elif _status==401:
                return jsonify({'detail': "Incorrect user name"}), 401
            else: 
                return jsonify({'detail': "Unexpected error"}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500
 
@app.route('/user-profile', methods=["GET", "POST"])
def userProfile():
    try:
        user = getUser(user_name=session['user_name'])
        if not request.method=="POST":
            if user:
                return jsonify({
                    "detail": "User profile retrieved successfully",
                    "userName": user.user_name,
                }), 200
            else:
                return jsonify({'detail': "Unexpected error"}), 500
        else:
            data=request.get_json()
            print(data)
            session["type_of_pet"]=data['type_of_pet']
            if data:
                return jsonify({"detail": "Type of pet add successfully"}), 200
            else:
                return jsonify({'detail': "Unexpected error"}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500 
    
    
    
@app.route('/pet-registration', methods=["POST"])
def petRegistration():
    try:
        if request.method=="POST":
            data=request.get_json()
            print(data, session['user_name'])                                  
                                    
            _status=addPet(user_name=session['user_name'], pet=data)
                        
            if _status == 201:
                return jsonify({'detail': "Pet Registration successfully"}), 201
            else:
                return jsonify({'detail': "Unexpected error"}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500     
    
@app.route('/comment', methods=["POST"])
def addComment():
    try:
        if request.method == "POST":
            data=request.get_json()
            _status=addPost(user_name=session["user_name"], content=data['content'])
            if _status == 201:
                return jsonify({'detail': "Post Creation successfully"}), 201
            else:
                return jsonify({'error': str(e)}), 500             
    except Exception as e:
        return jsonify({'error': str(e)}), 500     
        
@app.route("/community", methods=['GET'])
def communityPost():
    try:
        if not request.method=="POST":
            post=getPost()
            if post:
                return jsonify({
                    "detail": "Post retrieved successfully",
                    "post": post,
                }), 200
            else:
                return jsonify({
                    "detail": "Unexpected error",
                }), 500
        else:
            return jsonify({'detail': "Unexpected error"}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
@app.route("/update-profile", methods=["POST"])
def update_user():
    try:
        if request.method == "POST":
            data=request.json()
            _status=updateUser(user_name=session["user_name"], email=data["email"], name=data['name'], address=data['address'], age=data['age'], phone_number=data['phone_number'])
            if _status == 201:
                return jsonify({'detail': "Update user successfully"}), 201
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
        

        
        
            