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
        existingUser=session.query(UserModel).filter(UserModel.user_name==user_name).first()
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
        
        
        
