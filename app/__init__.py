from flask import Flask
from app.config import Config
from app.disciplines_routes import disciplines_bp
from app.videos_routes import videos_bp
from app.progression_routes import progression_bp
from app.exercices_routes import exercices_bp
from app.certifications_routes import certifications_bp
from app.suivre_routes import suivre_bp




app = Flask(__name__, 
            template_folder='../templates', 
            static_folder='../static') 

app.config.from_object(Config)

# Import routes
from app import routes
from app import user_routes
from app import cours_routes
from app import disciplines_routes
from app import videos_routes
from app import progression_routes
from app import exercices_routes
from app import certifications_routes
from app import suivre_routes

app.register_blueprint(disciplines_bp)
app.register_blueprint(videos_bp)
app.register_blueprint(progression_bp)
app.register_blueprint(exercices_bp)
app.register_blueprint(certifications_bp)
app.register_blueprint(suivre_bp)