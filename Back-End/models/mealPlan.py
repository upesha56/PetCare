from database.database import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, BigInteger, Text, Float


class MealPlan(Base):
    __tablename__="mealPlan"
    
    meal_id=Column(BigInteger, primary_key=True, index=True)
    pet=Column(BigInteger, ForeignKey('pet.pet_id'), nullable=False)
    duration=Column(Integer)
    