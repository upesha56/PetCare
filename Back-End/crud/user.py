from database.database import session, engine, Base
from models.user import User as UserModel
from utils.hash import generateHash, verifyHash
import logging

Base.metadata.create_all(engine)


def createUser(user_name:str, password:str, phone_number:int):
    try:
        existingUser=session.query(UserModel).filter_by(user_name=user_name).first()
        
        if existingUser:
            return 409
        else:
            password=generateHash(rowPassword=password)
            user = {"user_name":user_name,
                    "password" : password,
                    "phone_number": phone_number}
            
            newUser=UserModel(**user)
            session.add(newUser)
            session.commit()
            session.refresh(newUser)
            return 201, newUser.user_name
    except Exception as e:
        logging.exception(e)
        
def loginUser(user_name:str, password:str):
    try:
        existingUser=session.query(UserModel).filter_by(user_name=user_name).first()
        if existingUser:
            isTrue=verifyHash(rowPassword=password, hashedPassword=existingUser.password)
            if isTrue:
                return 200, existingUser.user_name
            else:
                return 400, None
        else:
            return 401, None
    except Exception as e:
        logging.exception(e)
        
def getUser(user_name:str):
    try:
        existingUser=session.query(UserModel).filter_by(user_name=user_name).first()
        return existingUser
    except Exception as e:
        logging.exception(e)
        
def updateUser(user_name:str, email:str, address:str, age:int, profile_picture):
    try:
        existingUser=session.query(UserModel).filter_by(user_name=user_name).first()
        if existingUser:
            if email is not None:
                existingUser.email=email
            if address is not None:
                existingUser.address=address
            if age is not None:
                existingUser.age=age
            if profile_picture is not None:
                existingUser.profile_picture=profile_picture
            session.commit()
            session.refresh(existingUser)
            return 200
        else:
            return 401
    except Exception as e:
        logging.exception(e)
        
        
        
