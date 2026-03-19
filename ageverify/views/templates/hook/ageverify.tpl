<div id="ageverify-overlay">
  <div id="ageverify-popup-wrapper">
    <div id="ageverify-popup"
         style="background:{$ageverify_bg_color|escape:'html':'UTF-8'};font-size:{$ageverify_font_size|intval}px;color:{$ageverify_text_color|escape:'html':'UTF-8'};">
      <div id="ageverify-logo">
        <img src="{$ageverify_shop_logo|escape:'html':'UTF-8'}"
             alt="{$ageverify_shop_name|escape:'html':'UTF-8'}"
             style="max-width:{$ageverify_logo_max_width|intval}px;" />
      </div>
      <p>{$ageverify_message|escape:'html':'UTF-8'}</p>
    </div>
    <div class="ageverify-buttons">
      <button id="ageverify-yes"
              style="background:{$ageverify_btn_yes_bg|escape:'html':'UTF-8'};color:{$ageverify_btn_yes_text|escape:'html':'UTF-8'};">
        {$ageverify_btn_yes|escape:'html':'UTF-8'}
      </button>
      <button id="ageverify-no"
              style="background:{$ageverify_btn_no_bg|escape:'html':'UTF-8'};color:{$ageverify_btn_no_text|escape:'html':'UTF-8'};">
        {$ageverify_btn_no|escape:'html':'UTF-8'}
      </button>
    </div>
  </div>
</div>

<script>
(function() {
  function setCookie(name, value, days) {
    var expires = '';
    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days*24*60*60*1000));
      expires = '; expires=' + date.toUTCString();
    }
    document.cookie = name + '=' + (value || '') + expires + '; path=/; SameSite=Lax';
  }
  function getCookie(name) {
    var nameEQ = name + '=';
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
  }

  document.addEventListener('DOMContentLoaded', function() {
    var overlay = document.getElementById('ageverify-overlay');
    if (!overlay) return;

    if (getCookie('ageverified') === '1') {
      return;
    }

    overlay.style.display = 'flex';
    document.body.classList.add('ageverify-locked');

    var yesBtn = document.getElementById('ageverify-yes');
    var noBtn  = document.getElementById('ageverify-no');

    if (yesBtn) {
      yesBtn.addEventListener('click', function(e) {
        e.preventDefault();
        setCookie('ageverified', '1', 30);
        overlay.parentNode.removeChild(overlay);
        document.body.classList.remove('ageverify-locked');
      });
    }

    if (noBtn) {
      noBtn.addEventListener('click', function(e) {
        e.preventDefault();
        var redirect = '{$ageverify_redirect|escape:'html':'UTF-8'}';
        if (redirect) {
          window.location.href = redirect;
        }
      });
    }
  });
})();
</script>
