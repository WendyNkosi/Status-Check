from flask import Flask, render_template

# creates a Flask application 
app = Flask(__name__)
#This will ensure that the templates get reloaded with fresh data
app.jinja_env.auto_reload = True
app.config['TEMPLATES_AUTO_RELOAD'] = True  
  
@app.route("/") 
def home(): 
    return render_template('index.html') 

@app.route("/history.html") 
def history(): 
    return render_template('history.html') 

@app.route("/index.html") 
def index(): 
    return render_template('index.html')
  
# run the application 
if __name__ == "__main__":
    app.run()
