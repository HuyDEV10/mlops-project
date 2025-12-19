from fastapi import FastAPI
from pydantic import BaseModel
import mlflow.pyfunc
import numpy as np

app = FastAPI()

# Load model từ MLflow (Production)
model = mlflow.pyfunc.load_model(
    "models:/iris_model@prod"
)

class InputData(BaseModel):
    features: list

@app.get("/")
def root():
    return {"message": "Iris model API is running"}

@app.post("/predict")
def predict(data: InputData):
    X = np.array(data.features).reshape(1, -1)
    pred = model.predict(X)
    return {"prediction": int(pred[0])}
