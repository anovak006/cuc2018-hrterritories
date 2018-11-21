#! /usr/bin/env python
# -*- coding: utf-8 -*-
import hrterritories.db_connector as dbc
from argparse import ArgumentParser
import pandas as pd
import logging
from flask.logging import default_handler


log = logging.getLogger('__name__')
log.addHandler(default_handler)
log.setLevel(logging.DEBUG)


# Initialize Database connector
def db_init(mode='in_memory', init=False,
            filename='data/counties_municipalities_settlements.csv'):
    log.info('Start init!')
    '''
    if mode == 'in_memory':
        log.debug('Create SQLite Engine in Memory')
        dbc.create_session('sqlite://')
    elif mode == 'local':
        log.debug('Create locale PostgreSQL Engine')
        dbc.create_session('postgresql://zns:c8rn8tpr1j8v8!@localhost/zns')
    elif mode == 'docker':
        log.debug('Create PostgreSQL Engine in docker')
        pass
    else:
        log.error('Engine is not created')
        pass
    '''
    if init:
        log.debug('Create Database')
        dbc.create_database()
        log.debug(f'Insert data from {filename}')
        insert_data(filename)
    return


def insert_data(filename):
    # procitaj CSV datoteku s korisnickim podacima
    log.debug(f'Start parsing CVS file {filename}')
    df = pd.read_csv(filename, delimiter=',', quotechar="\'")
    df['City'], df['Municipality'] = \
        zip(*df.apply(lambda row: (False, row['Municipality'])
            if(pd.notnull(row['Municipality']))
            else (row['City'], row['Municipality']), axis=1))
    df['City'], df['Municipality'] = \
        zip(*df.apply(lambda row: (True, row['City'])
            if(pd.notnull(row['City']) and pd.isnull(row['Municipality']))
            else (row['City'], row['Municipality']), axis=1))
    df.fillna(method='ffill', inplace=True)
    df['City'] = df['City'].astype('bool')
    df.apply(lambda row: insert_row(row), axis=1)
    log.debug(f'In DB are inserted {len(df)} records')


def insert_row(row):
    county = row['County'].strip()
    city = row['City']
    municiplaity = row['Municipality'].strip()
    settlement = row['Settlement'].strip()
    log.debug(f'INSERT: {settlement}/{municiplaity}/{county} - {city}')
    dbc.insert_settlement(county, city, municiplaity, settlement)
    log.debug(dbc.get_settlement(county, city, municiplaity, settlement).name)
    return


def get_options():
    parser = ArgumentParser(description="""
        Ova skripta unosi podatke o naseljima, općinama, gradovima i županijama
        iz CSV datoteke
        """)
    parser.add_argument("filename", help='CSV file with administrative '
                        'subdivisions', nargs="?", default="")
    parser.add_argument("-m", "--mode", help='Specifie where is database '
                        '(in_memory, local or docker)', default='in_memory')
    args = parser.parse_args()
    return args


if(__name__ == "__main__"):
    options = get_options()
    insert_data(options.mode, True, options.filename)
