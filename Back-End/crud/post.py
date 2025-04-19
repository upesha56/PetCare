from database.database import session, engine, Base
from models.post import Post as PostModel
from models.user import User as UserModel
import logging

Base.metadata.create_all(engine)


def addPost(user_name:str, content:str):
    try:
        user=session.query(UserModel).filter_by(user_name=user_name).first()
        if user:
            newPost=PostModel(owner=user.id, content=content)
            session.add(newPost)
            session.commit()
            session.refresh()
            return 201
    except Exception as e:
        logging.exception(e)
        
        
def getPost():
    try:
        postDic={}
        posts=session.query(PostModel).all()
        for post in posts:
            postDic['owner']=post.owner
            postDic['content']=post.content
        return postDic
    except Exception as e:
        logging.exception(e)        