<link rel="apple-touch-startup-image" media="(device-width: 375px)" href="assets/apple-launch-1125x2436.png">
<link rel="apple-touch-startup-image" media="(orientation: landscape)" href="assets/apple-touch-startup-image-2048x1496.png">
{{ css('style/style') }}
{% include "../../_script/config.swig" %}

{# lightbox #}
{% if theme.lightbox %}
    {{ css('script/lib/lightbox/css/lightbox.min') }}
{% endif %}

{# animation #}
{% if theme.animate %}
    {{ css('syuanpi/syuanpi.min') }}
{% endif %}

{# favicon #}
{% if theme.favicon %}
    <link rel="icon" href="{{ theme.favicon }}">
{% endif %}

{# any analytics #}
{% include "../../_script/_analytics/google.swig" %}
{% include "../../_script/_analytics/baidu.swig" %}
{% include "../../_script/_analytics/busuanzi.swig" %}

<script>
  (function(d) {
    var config = {
      kitId: 'krr4wpr',
      scriptTimeout: 3000,
      async: true
    },
    h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
  })(document);
</script>