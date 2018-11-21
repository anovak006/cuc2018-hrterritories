#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import (
    Flask,
    Blueprint
)
from api_v1.api import api_v1
from api_v1.territories.resources import ns as territories_namespace
from connector_init import db_init


app = Flask(__name__)

# Initialize API
blueprint = Blueprint('api_v1', __name__, url_prefix='/api/v1')
api_v1.init_app(blueprint)
api_v1.add_namespace(territories_namespace)
app.register_blueprint(blueprint)


if __name__ == '__main__':
    db_init(init=True)
    app.run(port=8088, debug=True)
