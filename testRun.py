from flask import Flask
from public.library.popular import list_popular  

app = Flask(__name__)

@app.route('/')
def popular_courses():
    return list_popular()

if __name__ == '__main__':
    app.run(debug=True)
   