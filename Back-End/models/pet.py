from database.database import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, BigInteger, Text, Float, LargeBinary, CHAR, ForeignKey
from sqlalchemy.orm import relationship

class Pet(Base):
    __tablename__="pet"
    
    pet_id=Column(BigInteger, primary_key=True, index=True)
    pet_name=Column(String(20))
    owner=Column(BigInteger, ForeignKey('user.id'), nullable=False)
    type_of_pet=Column(Text)
    age=Column(Integer)
    birthday=Column(DateTime)
    weight=Column(Float(3, 3))
    height=Column(Float(3, 3))
    photo=Column(LargeBinary, nullable=True)
    gender=Column(CHAR)
    breed=Column(Text)
    medical_history=Column(Text, nullable=True)
    
    owner_relationship = relationship("User", back_populates="pet_relationship")

    
    