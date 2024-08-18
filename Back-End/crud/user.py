from database.database import localSession, engine, Base
from models.user import User as UserModel
from models.pet import Pet as PetModel
from models.mealPlan import MealPlan as MealPlanModel
from utils.hash import generateHash, verifyHash
import logging

Base.metadata.create_all(engine)

session=localSession()


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
            return 201
    except Exception as e:
        logging.exception(e)
        
def loginUser(user_name:str, password:str):
    try:
        existingUser=session.query(UserModel).filter_by(user_name=user_name).first()
        if existingUser:
            isTrue=verifyHash(rowPassword=password, hashedPassword=existingUser.password)
            if isTrue:
                return 200
            else:
                return 400
        else:
            return 401
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
        
        
        
