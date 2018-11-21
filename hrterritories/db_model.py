#! /usr/bin/env python
# -*- coding: utf-8 -*-
from sqlalchemy import (
    Column,
    ForeignKey,
    Integer,
    String,
    Boolean,
    UniqueConstraint
)
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import (
    relationship,
    backref
)


Base = declarative_base()


class County(Base):
    __tablename__ = 'county'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    municipality = relationship('Municipality', back_populates='county')
    __table_args__ = (UniqueConstraint('name'),)


class Municipality(Base):
    __tablename__ = 'municipality'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    city = Column(Boolean)
    settlement = relationship('Settlement', back_populates='municipality')
    county_id = Column(Integer, ForeignKey('county.id'))
    county = relationship('County', back_populates='municipality')
    __table_args__ = (UniqueConstraint('name', 'county_id', 'city',
                                       name='_municipality_county_uc'),)


class Settlement(Base):
    __tablename__ = 'settlement'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    post_number = Column(Integer)
    municipality_id = Column(Integer, ForeignKey('municipality.id'))
    municipality = relationship('Municipality', back_populates="settlement")
    __table_args__ = (UniqueConstraint('name', 'municipality_id',
                                       name='_settlement_municipality_uc'),)
