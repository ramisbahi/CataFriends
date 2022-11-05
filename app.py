from flask import Flask
from flask_sqlalchemy import SQLAlchemy

# create the extension
db = SQLAlchemy()
# create the app
app = Flask(__name__)
# configure the SQLite database, relative to the app instance folder
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///project.db"
# initialize the app with the extension
db.init_app(app)


class Member(db.Model):
    name = db.Column(db.String, primary_key=True)
    photo = db.Column(db.String)
    q1 = db.Column(db.String)
    q2 = db.Column(db.String)
    q3 = db.Column(db.String)

with app.app_context():
    db.create_all()


#members query


#individual member query