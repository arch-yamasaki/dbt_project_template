{% macro generate_database_name(custom_database_name=none, node=none) -%}

    {%- set default_database = target.database -%}
    
    {%- if target.name == 'prod' -%}
        {{ target.database }}
    {%- else -%}
        {{target.database}}-sandbox
    {%- endif -%}

{%- endmacro %}
