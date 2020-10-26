import numpy as np
from flask import Flask, request, abort, jsonify
import joblib

app = Flask(__name__)

app.config['DEBUG'] = True


@app.route('/health', methods=['GET'])
def health():
    return jsonify({'data': "app is working"})


@app.route('/predict', methods=['GET', 'POST'])
def predict():
    if request.method == 'GET':
        try:
            model = joblib.load('model.pkl')
            data = request.get_json(force=True)
            if data is None:
                abort(400)
            X = np.array(data['payload']).reshape(1, -1)
            # numpy array is not JSON serializable, casting to list
            pred = model.predict(X).tolist()

            return jsonify({'prediction': pred})

        except (ValueError, TypeError) as e:
            return jsonify('Error with - {}'.format(e))


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
