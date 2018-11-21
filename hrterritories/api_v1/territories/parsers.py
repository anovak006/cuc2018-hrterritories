#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask_restplus import reqparse


territories_search_parser = reqparse.RequestParser()
territories_search_parser.add_argument('name', required=True, help="Name of \
                                       settlement, municipality, \
                                       city or county")
territories_search_parser.add_argument('page', type=int, required=True,
                                       help="Page number of total pages")
territories_search_parser.add_argument('limit', type=int, required=True,
                                       help="Maximum number of settlements on \
                                            the list")
