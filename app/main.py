from flask import Flask, request
from flask_cors import CORS
from PIL import Image
import io
from ultralytics import YOLO
import cv2
import numpy as np
import os

app = Flask(__name__)
CORS(app)

model = YOLO("best.pt")


@app.route("/")
def hello_world():
    print("req")
    return 'Hello World'

@app.route("/", methods=['POST'])
def predict():
    print(request.files)
  
    if 'image' not in request.files:
        return 'No, image uploaded', 400

    image_file = request.files['image']

    image_bytes = io.BytesIO(image_file.read())

    img = cv2.cvtColor(cv2.imdecode(np.frombuffer(image_bytes.getbuffer(), np.uint8), cv2.IMREAD_COLOR), cv2.COLOR_BGR2RGB)
    
    result = model.predict(source=img)[0]
    # result = model.predict(source='macs.jpg')[0]
    ls = list(result.probs)
    prediction = result.names[ls.index(max(ls))]
    

    
    # image = Image.open(image_bytes)
    # image.save('uploaded_image.jpg')


    print(prediction)

    return prediction, 200


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=False)