#! /usr/bin/env python
# -*- coding: utf-8 -*-
import pytest
import hrterritories.db_connector as dbc


@pytest.fixture(scope="module")
def demo_db(request):
    dbc.create_database()
    return dbc


def test_insert_and_search_settlement(demo_db):
    settlement = 'Sveti petar u Šumi'
    municipality = 'Sveti petar u Šumi'
    county = 'Istarska županija'
    city = False
    result = demo_db.insert_settlement(county, city, municipality, settlement)
    assert result is True
    result = demo_db.insert_settlement(county, city, municipality, settlement)
    assert result is False
    result = demo_db.get_settlement(county, city, municipality, settlement)
    assert result.name == settlement
    county = 'Grad Zagreb'
    result = demo_db.insert_settlement(county, city, municipality, settlement)
    assert result is True
    result = demo_db.get_settlement(county, city, municipality, settlement)
    assert result.name == settlement
    city = True
    result = demo_db.insert_settlement(county, city, municipality, settlement)
    assert result is True
    result = demo_db.get_settlement(county, city, municipality, settlement)
    assert result.name == settlement
    municipality = 'Pazin'
    county = 'Istarska županija'
    result = demo_db.insert_settlement(county, city, municipality, settlement)
    assert result is True
    result = demo_db.get_settlement(county, city, municipality, settlement)
    assert result.name == settlement
    total, results = demo_db.search_settlement_by_name('Sv')
    print(results)
    assert 4 == len(results)
