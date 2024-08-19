from database.database import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, BigInteger, Text, Float


class Pet(Base):
    __tablename__="pet"
    
    id=Column(BigInteger, primary_key=True, index=True)
    owner=Column(BigInteger, ForeignKey('user.id'))
    type_of_pet=Column(Text)
    age=Column(Integer)
    weight=Column(Float(3, 3))
    height=Column(Float(3, 3))
    photo=Column(Text, nullable=True)
    breed=Column(Text)
    medical_history=Column(Text)
    
    