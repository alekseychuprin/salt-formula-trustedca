{%- from "trustedca/map.jinja" import trustedca with context %}

{%- if trustedca.enabled and grains.os_family == 'Debian'%}

{%- if trustedca.ca is defined %}

{%- for ca_name, ca in trustedca.get('ca', {}).iteritems() %}

/usr/local/share/ca-certificates/{{ca_name}}.crt:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: {{ ca.content | yaml_encode }}

{%- endfor %}

update-ca-certificates:
  cmd.wait:
    - watch:
    {%- for ca_name, ca in trustedca.get('ca', {}).iteritems() %}
        - file: {{trustedca.ca_base_path}}/{{ca_name}}.crt
    {%- endfor %}

{%- endif %}

{%- endif %}
