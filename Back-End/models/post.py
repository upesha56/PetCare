from database.database import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, BigInteger, Text, Float, LargeBinary, CHAR, ForeignKey
from sqlalchemy.orm import relationship


class Post(Base):
    __tablename__="post"
    
    post_id=Column(BigInteger, primary_key=True, index=True)
    owner=Column(BigInteger, ForeignKey('user.id'), nullable=False)
    content=Column(Text)
    picture=Column(LargeBinary, nullable=True)    
        