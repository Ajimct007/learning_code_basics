from fastapi import FastAPI, File, UploadFile
import uvicorn
import numpy as np
from io import BytesIO
from PIL import Image
import tensorflow as tf

app = FastAPI()

# Declaring the MODEL as global variable
MODEL = tf.keras.models.load_model("../saved_models/1")

# Declare the class names
CLASS_NAMES = ["Early Blight", "Late Blight", "Healthy"]

@app.get("/ping") ## we are specifying the endpoint
async def ping():
	return "Hello, I am alive"

def read_file_as_image(data): # here bytes as an input, and returns the np.ndarray as output
	image = np.array(Image.open(BytesIO(data)))
	#print('__image', image, '----') # Finally it converted the file as numpy array
	return image


@app.post("/predict") ## Endpoint predict
# here we will send the image of a potato plant leaf
# We have to upload a file to the website which received here

async def predict(
		file: UploadFile = File(...)
	): 
	
	# bytes = await file.read() # Read the file
	# print('bytes___', bytes) # we can able to see the file read by the server and printing that in bytes

	# Lets write a simple function for read file as image
	image = read_file_as_image(await file.read())
	
	# we have to send the batch image we can use numpy's expand_dims
	img_batch = np.expand_dims(image, 0)

	predictions = MODEL.predict(img_batch)

	# Since we have the batch here, we have to select the 1st image from the batch, so that we can take only one image
	predicted_class = CLASS_NAMES[np.argmax(predictions[0])]

	# for confidence we have to use np.max
	confidence = np.max(predictions[0])

	# we can return them as a simple dictionary
	return {
			'class':predicted_class,
			'confidence':float(confidence)
	}

if __name__ == '__main__':
	uvicorn.run(app, host='localhost', port=8000)