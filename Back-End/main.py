from routers.api import app
from flask_cors import CORS


if __name__=="__main__":
    CORS(app=app)
    app.run(host="127.0.0.1",
            port=8000,
            debug=True)
    
    
    


    
    
    
    

    
    