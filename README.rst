.. -*- mode: rst -*-

.. role:: bash(code)
   :language: bash

|Travis|_ |PyPi|_ |TestStatus|_ |PythonVersion|_

.. |Travis| image:: https://travis-ci.org/aagnone3/llama-trading.svg?branch=master

.. |PyPi| image:: https://badge.fury.io/py/llama-trading.svg
.. _PyPi: https://badge.fury.io/py/llama-trading

.. |TestStatus| image:: https://travis-ci.org/aagnone3/llama-trading.svg
.. _TestStatus: https://travis-ci.org/aagnone3/llama-trading.svg

.. |PythonVersion| image:: https://img.shields.io/pypi/pyversions/llama-trading.svg
.. _PythonVersion: https://img.shields.io/pypi/pyversions/llama-trading.svg

llama-trading
================


- Unit testing with pytest
- Continuous integration testing with Travis CI
- Packaging and publishing to PyPi
- Documentation with Sphinx and Github Pages

Documentation
-------------

Documentation can be found at the github pages here_

.. _here: https://aagnone3.github.io/llama-trading/

Dependencies
~~~~~~~~~~~~

llama-trading is tested to work under Python 3.x.
See the requirements via the following command:

.. code-block:: bash

  cat requirements.txt

Installation
~~~~~~~~~~~~

llama-trading is currently available on the PyPi's repository and you can
install it via `pip`:

.. code-block:: bash

  pip install -U llama-trading

If you prefer, you can clone it and run the setup.py file. Use the following
commands to get a copy from GitHub and install all dependencies:

.. code-block:: bash

  git clone https://github.com/aagnone3/llama-trading.git
  cd llama-trading
  pip install .

Or install using pip and GitHub:

.. code-block:: bash

  pip install -U git+https://github.com/aagnone3/llama-trading.git

Local Testing
~~~~~~~~~~~~~

.. code-block:: bash

  make test
  
Travis Testing
~~~~~~~~~~~~~~

The :bash:`Makefile`, :bash:`.travis.yml` file and :bash:`.ci` directory contain the structure necessary to have Travis_ test the repository upon all branch updates. Some additional steps, however, are needed:

- Enable the repository to be monitored by Travis via your Travis profile.
- Generate a Github app token, and assign it to the (private) environment variable :bash:`${GITHUB_TOKEN}` in the Travis environment.

.. _Travis: https://travis-ci.org/aagnone3/llama-trading
