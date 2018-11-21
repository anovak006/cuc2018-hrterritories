#! /usr/bin/env python
# -*- coding: utf-8 -*-
import logging
import traceback
from flask_restplus import Api


log = logging.getLogger(__name__)

api_v1 = Api(title='Administrative subdivisions of the Republic of Croatia',
             version='1.0',
             description='Service provides lists of settlements, '
                         'municipalities, cities and counties of Croatia',
             )
