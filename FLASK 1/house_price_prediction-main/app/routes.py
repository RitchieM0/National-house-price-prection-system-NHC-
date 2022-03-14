
# from flask import load
from flask import request, jsonify
from flask import Flask
from flask import Config
from flask_cors import CORS
# from numpy import loads
# from numpy import load
import pickle
from werkzeug import Response


app = Flask(__name__)
app.config.from_object(Config)

CORS(app)

def predicting_price(rooms, area, house_type, latitude, longitude):
    # predictor = load("../Regressor.joblib", allow_pickle=True)
    
    with open('../regressor_pkl', 'rb') as model:
        predictor = pickle.load(model)

    price = predictor.predict([[rooms, area, house_type, latitude, longitude]])
    # price = predictor.predict([[3 ,85.0,1,-5.0888, 39.1023]])
    return price



@app.route('/', methods=['GET'])
def home():
    
    return Response('Ok', 200) 
     #return render_template("index.html")



@app.route('/predict', methods=["POST"])
def predict():
    request_data = request.get_json()
    # number of rooms, floor area, house type, latitude, longitude
    number_of_rooms = request_data['number_of_rooms']
    floor_area = request_data['floor_area']
    house_type = request_data['house_type']
    latitude = request_data['latitude']
    longitude = request_data['longitude']
    print(request_data)
    
    y_value = predicting_price(number_of_rooms, floor_area, house_type, latitude, longitude)
    print(y_value)


    # return jsonify({"price": y_value})
    return jsonify({"price": y_value[0]})

    





if __name__ == "__main__":
    app.run(debug=True, port=8000)
    