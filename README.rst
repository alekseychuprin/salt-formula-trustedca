salt-formula-trustedca
======================

Populates ``/usr/local/share/ca-certificates``
on Linux-distributions from the Debian-family
and runs ``update-ca-certificates`` on changes.

Place the CAs' .pem files' content in a dict
under 'trustedca' in your pillar:

.. code-block:: yaml

  trustedca:
    enabled: true
    ca:
      root_test1:
        content: |
          -----BEGIN CERTIFICATE-----
          -----END CERTIFICATE-----
      root_test2:
        content: |
          -----BEGIN CERTIFICATE-----
          -----END CERTIFICATE-----
