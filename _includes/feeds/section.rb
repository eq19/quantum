{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data == null -%}{%- include data.rb -%}{%- endif -%}
{%- if my_feed.category == null and my_feed.redirect.from == null %}{{ my_feed.content }}
{%- elsif my_slug -%}{%- include {{ my_feed.path | remove_first: "_" | replace: my_feed.ext, ".html" }} -%}
{%- else -%}{{ my_feed.content }}{%- endif -%}
