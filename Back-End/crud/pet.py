from database.database import session, engine, Base
from models.pet import Pet as PetModel
from models.user import User as UserModel
import logging


def addPet(user_name:str, pet:dict):
    try:
        user=session.query(UserModel).filter(user_name=user_name).first()
        pet['owner']=user.id
        newPet=PetModel(**pet)
        session.add(newPet)
        session.commit()
        session.refresh(newPet)
        
    except Exception as e:
        logging.exception(e)
