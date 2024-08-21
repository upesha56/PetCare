from database.database import session, engine, Base
from models.pet import Pet as PetModel
from models.user import User as UserModel
import logging

Base.metadata.create_all(engine)

def addPet(user_name:str, pet:dict):
    try:
        user=session.query(UserModel).filter_by(user_name=user_name).first()
        pet['owner']=user_name
        newPet=PetModel(**pet)
        if newPet:
            session.add(newPet)
            session.commit()
            session.refresh(newPet)
            return 201
        else:
            print(pet)
            return 500
    except Exception as e:
        raise e
