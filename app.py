from flask import Flask, render_template
from public.library.popular import list_popular  



app = Flask(__name__)


@app.route('/')
def home_page():
    return render_template('index.html')

@app.route('/api/popular-courses')
def popular_courses():
    return list_popular()


if __name__ == "__main__":
    app.run(debug=True)