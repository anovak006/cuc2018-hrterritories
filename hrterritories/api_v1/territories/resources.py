#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask_restplus import Resource
# from flask.ext.oidc import OpenIDConnect
# from server.apis.api_v1 import api
from .config import ns
from .parsers import territories_search_parser
from .serializers import settlement, settlements
from .business import search_settlements_by_name
import logging


# oidc = OpenIDConnect()
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


CITY = {'id': 1,
        'name': 'Dugo Selo',
        'city': True}

COUNTY = {'id': 1,
          'name': 'Zagrebačka županija'}

SETTLEMENT = {'id': 1,
              'name': 'Andrilovec',
              'municipality_city': CITY,
              'county': COUNTY}


@ns.route('settlements/<int:id>')
@ns.param('id', 'ID of settlement')
@ns.response(404, 'The settlement was not found')
class Settlement(Resource):
    @ns.marshal_with(settlement)
    def get(self, id):
        '''Retrieve settlement data with a defined identifier'''
        return SETTLEMENT


@ns.route('/settlements/search')
class SettlementsSearch(Resource):
    @ns.marshal_with(settlements)
    @ns.expect(territories_search_parser, validate=False)
    def post(self):
        '''Search Settlements by Criteria'''
        args = territories_search_parser.parse_args()
        logger.info('Search parameters: {}'.format(args))
        count, response = search_settlements_by_name(**args)
        logger.info(f'Total count: {count}')
        return {'total_count': count, 'settlements': response}
