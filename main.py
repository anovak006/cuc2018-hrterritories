#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask import (
    Flask,
    Blueprint
)
from hrterritories.api_v1.api import api_v1
from hrterritories.api_v1.territories.resources import ns \
    as territories_namespace
from hrterritories.connector_init import db_init
import hrterritories.db_connector as dbc
import logging
from flask.logging import default_handler


log = logging.getLogger('__name__')
log.addHandler(default_handler)
log.setLevel(logging.DEBUG)


app = Flask(__name__)

# Initialize API
blueprint = Blueprint('api_v1', __name__, url_prefix='/api/v1')
api_v1.init_app(blueprint)
api_v1.add_namespace(territories_namespace)
app.register_blueprint(blueprint)


@app.teardown_appcontext
def cleanup(resp_or_exc):
    log.debug('Session is removed')
    dbc.Session.remove()


if __name__ == '__main__':
    # db_init(init=True)
    app.run(port=8088, debug=True)
