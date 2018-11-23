# -*- coding: utf-8 -*-
import pytest
import requests


'''
def pytest_addoption(parser):
    parser.addoption(
        "--hostname", action="store", default="127.0.0.1",
        help="hostname or IP address"
    )


@pytest.fixture
def hostname(request):
    return request.config.getoption("--hostname")
'''
hostname = "127.0.0.1"

url_base = f'http://{hostname}:8088/'


def test_search_settlement():
    # Testiranje dohvata settlements
    settlement = 'a'
    url_root = url_base + 'api/v1/territories/settlements/search'
    url = url_root
    # headers = {'Authorization': 'JWT {}'.format(token)}
    json = {'name': settlement, 'page': 1, 'limit': 30}
    r = requests.post(url, verify=False, json=json)
    print(len(r.json()['settlements']))
    assert 30 == len(r.json()['settlements'])
    url = url_root + f'?name={settlement}&page=1&limit=60'
    print(url)
    r = requests.post(url, verify=False)
    print(len(r.json()['settlements']))
    assert 31 == len(r.json()['settlements'])
    url = url_root + f'?name={settlement}&page=2&limit=30'
    r = requests.post(url, verify=False)
    assert 1 == len(r.json()['settlements'])
    settlement = 'b'
    url = url_root + f'?name={settlement}&page=1&limit=700'
    r = requests.post(url, verify=False)
    assert 643 == len(r.json()['settlements'])
    settlement = 'ba'
    url = url_root + f'?name={settlement}&page=1&limit=200'
    r = requests.post(url, verify=False)
    assert 114 == len(r.json()['settlements'])
    settlement = 'andrilovec'
    url = url_root + f'?name={settlement}&page=1&limit=10'
    r = requests.post(url, verify=False)
    assert "Andrilovec" == r.json()['settlements'][0]['settlement']
    assert 1 == r.json()['settlements'][0]['id']
    assert "Dugo Selo" == r.json()['settlements'][0]['municipality']
    assert "Zagrebačka županija" == r.json()['settlements'][0]['county']
