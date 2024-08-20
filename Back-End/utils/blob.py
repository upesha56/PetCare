def convertImageToBlob(image):
    try:
        image.file.read()
    except Exception as e:
        print(e)
        
        
