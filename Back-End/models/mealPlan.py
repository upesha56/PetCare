from database.database import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, BigInteger, Text, Float


class MealPlan(Base):
    __tablename__="mealPlan"
    
    id=Column(BigInteger, primary_key=True, index=True)
    pet=Column(BigInteger, ForeignKey('pet.id'))
    duration=Column(Integer)
    
    
    def __repr__(self) -> str:
        return self.id