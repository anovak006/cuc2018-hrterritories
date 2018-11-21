#! /usr/bin/env python
# -*- coding: utf-8 -*-
from flask_restplus import fields
from .config import ns


city = ns.model('Municipality/City', {
    'id': fields.Integer(required=True, description='ID of municipality/city'),
    'name': fields.String(require=True,
                          description='Name of municipality/city'),
    'city': fields.Boolean(require=True, description='Status of city')
})

county = ns.model('County', {
    'id': fields.Integer(required=True, description='ID of county'),
    'name': fields.String(require=True, description='Name of county')
})

settlement = ns.model('Settlement', {
    'id': fields.Integer(required=True, description='ID of settlement'),
    'settlement': fields.String(require=True,
                                description='Name of settlement'),
    'municipality': fields.String(require=True,
                                  description='Name of municipality/city'),
    'county': fields.String(require=True, description='Name of county')
})

settlements = ns.model('Settlements', {
    'total_count': fields.Integer(required=True,
                                  description='Total number of settlements'),
    'settlements': fields.List(fields.Nested(settlement))
})
