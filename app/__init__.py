from flask import Flask

microblog = Flask(__name__)

from app import routes
