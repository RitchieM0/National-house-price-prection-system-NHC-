from app import app 

if __name__ == '__main__':
    app.run(debug=False)
    
    
# if __name__ == "__main__":
#  from waitress import serve
# serve(app, host="0.0.0.0", port=8080)