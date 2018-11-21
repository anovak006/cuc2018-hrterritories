import os
from setuptools import setup


# Utility function to read the README file.
# Used for the long_description.  It's nice, because now 1) we have a top level
# README file and 2) it's easier to type in the README file than to put a raw
# string in below ...
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()


setup(
    name="hrterritories",
    version="0.1",
    author="Albert Novak",
    author_email="albert.novak@carnet.hr",
    description=("Service provides lists of settlements, municipalities,\
                 cities and counties of Croatia"),
    license="EUPL 1.2",
    keywords="settlement municipality citiy county",
    url="http://github.com/anovak006/hrsettlements",
    packages=['hrterritories'],
    long_description=read('README'),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        "License :: OSI Approved :: "
        "European Union Public Licence 1.2 (EUPL 1.2)",
    ],
)
