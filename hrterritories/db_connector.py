#! /usr/bin/env python
# -*- coding: utf-8 -*-
from .db_model import (
    Base,
    County,
    Municipality,
    Settlement
)
from sqlalchemy import (
    create_engine,
    func
)
from sqlalchemy.orm import (
    sessionmaker,
    scoped_session,
    joinedload,
    contains_eager
)
from sqlalchemy.orm.exc import NoResultFound
import os

engine = \
    create_engine(os.environ['DATABASE_URL'])
# engine = create_engine('sqlite:///sqlalchemy_example.db')

Session = scoped_session(sessionmaker(bind=engine))


def create_database():
    Base.metadata.create_all(engine)


def insert_settlement(county, city, municipality, settlement):
    session = Session()
    try:
        db_county = session.query(County).filter_by(name=county).one()
    except NoResultFound:
        try:
            db_county = County(name=county)
            session.add(db_county)
            session.flush()
        except:
            session.rollback()
            raise
    try:
        db_municipality = session.query(Municipality)\
                    .filter(Municipality.name == municipality)\
                    .filter(Municipality.city == city)\
                    .filter(Municipality.county_id == db_county.id)\
                    .one()
    except NoResultFound:
        try:
            db_municipality = Municipality(name=municipality, city=city,
                                           county=db_county)
            session.add(db_municipality)
            session.flush()
        except:
            session.rollback()
            raise
    try:
        db_settlement = session.query(Settlement)\
                    .join(Settlement.municipality)\
                    .options(joinedload(Settlement.municipality))\
                    .filter(Settlement.name == settlement)\
                    .filter(Municipality.id == db_municipality.id)\
                    .one()
    except NoResultFound:
        try:
            db_settlement = Settlement(name=settlement,
                                       municipality=db_municipality)
            session.add(db_settlement)
            session.commit()
            return True
        except:
            session.rollback()
            raise
    return False


def get_settlement(county, city, municipality, settlement):
    session = Session()
    try:
        result = session.query(Settlement)\
                    .join(Settlement.municipality)\
                    .join(Municipality.county)\
                    .filter(Settlement.name == settlement)\
                    .filter(Municipality.name == municipality)\
                    .filter(Municipality.city == city)\
                    .filter(County.name == county)\
                    .options(contains_eager(Settlement.municipality).
                             contains_eager(Municipality.county))\
                    .one()
    except NoResultFound:
        return False
    return result


def get_settlement_by_id(settlement_id):
    session = Session()
    try:
        result = session.query(Settlement).\
                    filter_by(id=settlement_id).\
                    one()
    except NoResultFound:
        return False
    return result


def search_settlement_by_name(name, page=1, limit=20):
    session = Session()
    offset = (page - 1) * limit
    try:
        result = session.query(Settlement)\
                        .filter(Settlement.name.ilike(f'{name}%'))\
                        .limit(limit).offset(offset).all()
        query = session.query(func.count(Settlement.id))\
                       .filter(Settlement.name.ilike(f'{name}%'))
        count = query.scalar()
    except NoResultFound:
        return False
    return count, result
