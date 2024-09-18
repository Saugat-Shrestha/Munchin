from flask import Flask, request, jsonify 
from food_recommedation import Get_Recommendation # need to review 

app = Flask(__name__)

@app.route('/recommend', methods=['POST']) 

def get_recommendation(): 
    data = request.get_json()
    content = data.get('content') 

    if not content:
        return jsonify({'error': 'No content provided'}), 400

    recommendation = Get_Recommendation(content) 
    print(recommendation)
    return recommendation

if __name__ == '__main__':
    app.run(debug=True)
    




