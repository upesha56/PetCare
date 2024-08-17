from typing import Optional, List
from enum import Enum
from uuid import UUID, uuid4
from pydantic import BaseModel, EmailStr
from datetime import datetime


class User(BaseModel):
    id: Optional[UUID] = uuid4()
    user_name : str
    phone_number : int
    password : str
    user_flag : str
    email : EmailStr
    address : str
    age : int
    profile_picture : str
    created_at : Optional[datetime]=datetime.now()
    
