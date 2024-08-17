from fastapi import FastAPI, HTTPException, status, UploadFile
from schema.user import User

app=FastAPI()

@app.post("/register", tags=['user', 'admin'])
async def register(user:User):
    return "register"


@app.post("login", tags=["user", "admin"])
async def login(user_name:str, password:str):
    return "login"


        

        
        
            