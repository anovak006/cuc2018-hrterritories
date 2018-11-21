#! /usr/bin/env python
# -*- coding: utf-8 -*-
import hrterritories.db_connector as dbc
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


def search_settlements_by_name(name, page, limit):
    total, settlements = dbc.search_settlement_by_name(name, page, limit)
    logger.info(f'Total number: {total}')
    return total, [dict(id=s.id, settlement=s.name,
                        municipality=s.municipality.name,
                        county=s.municipality.county.name)
                   for s in settlements]
