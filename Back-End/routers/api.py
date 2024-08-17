from fastapi import FastAPI, HTTPException, status, UploadFile
from schema.user import User

app=FastAPI()

@app.post("/register", tags=['user', 'admin'])
async def register(user:User):
    return "register"


        

        
        
            