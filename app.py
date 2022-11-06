from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

import json
# create the extension

# create the app
app = Flask(__name__)


# configure the SQLite database, relative to the app instance folder
app.config["SQLALCHEMY_DATABASE_URI"] = "postgresql://zphbdiog:M0uVZ2pSe8wuwnBOTQfmpUEkmKUi1iAJ@suleiman.db.elephantsql.com/zphbdiog"
# initialize the app with the extension
db = SQLAlchemy(app)
db.init_app(app)
#db.commit()


class Members(db.Model):
    name = db.Column(db.String(50), primary_key=True)
    photo = db.Column(db.String(200))
    q1 = db.Column(db.String(200))
    q2 = db.Column(db.String(200))
    q3 = db.Column(db.String(200))

    def __repr__(self):
        return f'<Member: {self.name}>'

with app.app_context():
    db.create_all()


#members query
@app.route("/members")
def user_list():
    #members = Member.query.all()
    members = Members.query.all()
    ret = {"data" : []}
    for member in members:
        ret["data"].append({
            "name" : member.name,
            "photo": member.photo,
            "questions":[member.q1,member.q2,member.q3]
        })
    return json.dumps(ret) 

app.run(debug = True)
