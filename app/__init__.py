from flask import Flask
from app.config import Config

app = Flask(__name__, 
            template_folder='../templates', 
            static_folder='../static') 

app.config.from_object(Config)

# Import routes
from app import routes
from app import user_routes
from app import cours_routes

