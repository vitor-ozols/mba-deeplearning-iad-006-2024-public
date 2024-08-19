import numpy as np
from flask import Flask, request, jsonify
from sklearn.datasets import load_digits
from sklearn.preprocessing import StandardScaler
import pickle

# Inicializar a aplicação Flask
app = Flask(__name__)

# carregar o conjunto de dados e normalizar os dados
digits = load_digits()
X, y = digits.data, digits.target
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# carregar o modelo salvo com pickle
with open('../models/decision_tree_model.pkl', 'rb') as model_file:
    clf = pickle.load(model_file)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json.get('data')
    data = np.array(data).reshape(1, -1)
    data_scaled = scaler.transform(data)
    prediction = clf.predict(data_scaled)
    return jsonify({'prediction': int(prediction[0])})

if __name__ == '__main__':
    app.run(debug=True)
