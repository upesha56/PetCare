from database.database import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, BigInteger, Text, CHAR


class User(Base):
    __tablename__="user"
    
    id=Column(BigInteger, primary_key=True, index=True)
    user_name=Column(String(20), unique=True)
    phone_number=Column(Integer)
    password=Column(Text)
    user_flag=Column(CHAR, default='u')
    email=Column(String(20), nullable=True)
    address=Column(Text, nullable=True)
    age=Column(Integer, nullable=True)
    profile_picture=Column(Text, nullable=True)    
    
    def __repr__(self) -> str:
        return self.user_name