{% macro render(post) %}
  {% if page.mathjax %}
    <script src="https://cdn.bootcss.com/mathjax/2.7.4/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
    <script type="text/x-mathjax-config;executed=true">MathJax.Hub.Config({tex2jax: {inlineMath: [["$","$"], ["\\(","\\)"]]}});</script>
  {% endif %}
  <article class="
  post
  {% if is_post() %} is_post {% endif %}
  ">
    <header class="post-header">
      <div class="post-time syuanpi fadeInRightShort back-1">
        <div class="post-time-wrapper">
          <time>{{ full_date(post.date, 'YYYY-MM-DD') }}</time>
          {% if post.categories and post.categories.length %}
            {% for category in post.categories %}
              <span class="post-category"><a href="{{ url_for(category.path) }}">{{ category.name }}</a></span>
            {% endfor %}
          {% endif %}
        </div>
      </div>
      <div class="post-title syuanpi fadeInRightShort back-2">
        {% if is_post() %}
          {{ post.title }}
        {% else %}
          <a href="{{ url_for(post.path) }}">{{ post.title }}</a>
        {% endif %}
      </div>
    </header>
    <div class="post-content syuanpi fadeInRightShort back-3">
      {% if is_post() %}
        {{ post.content }}
      {% else %}
        {% if post.excerpt %}
          {{ post.excerpt }}
        {% else %}
          {{ post.content }}
        {% endif %}
      {% endif %}
    {% if post.excerpt and is_home() %}
      <p class="content-link">
        <a href="{{ url_for(post.path) }}#more">
          <span>{{ __('page.readmore') }}</span>
        </a>
      </p>
    {% endif %}
    </div>
    {% if post.tags and post.tags.length %}
      <div class="post-tags syuanpi fadeInRightShort back-3">
      {% for tag in post.tags %}
        <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
      {% endfor %}
      </div>
    {% endif %}
    {% if is_post() %}
      {% include "_post/reward.swig" %}
      {% include "_post/copyright.swig" %}
    {% endif %}
  </article>
  {% if is_post() %}
    {% include "pagenum.swig" %}
    {% include "_post/comments.swig" %}

  {% endif %}
  {% if theme.scheme == 'banderole' %}
    {% include "./_feature/banderole.swig" %}
  {% endif %}
{% endmacro %}