<style>
/* scoped improvements — prefix .av- to avoid BO conflicts */
.av-form .panel { border-radius:6px; border:1px solid #e2e6ea; box-shadow:0 1px 3px rgba(0,0,0,.06); }
.av-form .panel-heading { background:#f8f9fa; border-bottom:1px solid #e2e6ea; border-radius:6px 6px 0 0; font-size:13px; font-weight:600; color:#2d3748; padding:12px 18px; }
.av-form .panel-heading i { color:#5b6af0; margin-right:6px; }
.av-form .form-wrapper { padding:20px 18px; }
.av-form .form-group { margin-bottom:16px; }
.av-form .control-label { font-size:13px; font-weight:500; color:#4a5568; padding-top:8px; }
.av-form .form-control { border:1px solid #d1d5db; border-radius:5px; font-size:13px; color:#2d3748; height:34px; }
.av-form .form-control:focus { border-color:#5b6af0; box-shadow:0 0 0 3px rgba(91,106,240,.12); outline:none; }
.av-form textarea.form-control { height:auto; min-height:80px; }
.av-form .panel-footer { background:#f8f9fa; border-top:1px solid #e2e6ea; border-radius:0 0 6px 6px; padding:12px 18px; }
.av-form .btn-save-av { background:#5b6af0; color:#fff; border:none; border-radius:5px; padding:8px 20px; font-size:13px; font-weight:600; cursor:pointer; }
.av-form .btn-save-av:hover { background:#4755d4; }
.av-form .av-hint { font-size:11px; color:#9ca3af; margin-top:3px; }
.av-form .av-section-label { font-size:10px; font-weight:700; text-transform:uppercase; letter-spacing:.8px; color:#9ca3af; margin:4px 0 14px; }
.av-form .av-color-group { display:flex; align-items:center; gap:8px; flex-wrap:wrap; }
.av-form .av-color-preview { width:30px; height:30px; border-radius:5px; border:1px solid #d1d5db; flex-shrink:0; }
.av-form .av-color-group input.form-control { width:110px !important; font-family:monospace; }
.av-form .av-swatches { display:flex; gap:5px; flex-wrap:wrap; }
.av-form .av-swatch { width:22px; height:22px; border-radius:4px; border:1px solid rgba(0,0,0,.12); cursor:pointer; transition:transform .15s, box-shadow .15s; display:inline-block; }
.av-form .av-swatch:hover { transform:scale(1.25); box-shadow:0 2px 6px rgba(0,0,0,.2); }
/* Credits */
.av-credits { display:flex; align-items:center; gap:14px; background:#f0f4ff; border:1px solid #d0d9ff; border-radius:6px; padding:16px 18px; margin-top:4px; }
.av-credits-icon { width:40px; height:40px; background:#5b6af0; border-radius:8px; display:flex; align-items:center; justify-content:center; flex-shrink:0; }
.av-credits-icon i { color:#fff; font-size:18px; }
.av-credits-text h4 { margin:0 0 3px; font-size:13px; font-weight:700; color:#2d3748; }
.av-credits-text p { margin:0; font-size:12px; color:#6b7280; }
.av-credits-text a { color:#5b6af0; font-weight:600; text-decoration:none; }
.av-credits-text a:hover { text-decoration:underline; }
</style>

<form action="" method="post" class="form-horizontal av-form">

  <!-- GERAL -->
  <div class="panel">
    <div class="panel-heading">
      <i class="icon-cogs"></i> {l s='General settings' mod='ageverify'}
    </div>
    <div class="form-wrapper">
      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Minimum age' mod='ageverify'}</label>
        <div class="col-lg-2">
          <input type="text" name="AGEVERIFY_MIN_AGE" value="{$AGEVERIFY_MIN_AGE|intval}" class="form-control" />
          <p class="av-hint">{l s='Default: 18' mod='ageverify'}</p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Redirect URL for underage' mod='ageverify'}</label>
        <div class="col-lg-6">
          <input type="text" name="AGEVERIFY_REDIRECT_URL" value="{$AGEVERIFY_REDIRECT_URL|escape:'html':'UTF-8'}" class="form-control" placeholder="https://..." />
          <p class="av-hint">{l s='Leave empty to do nothing when rejected' mod='ageverify'}</p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Popup message' mod='ageverify'}</label>
        <div class="col-lg-7">
          <textarea name="AGEVERIFY_MESSAGE" class="form-control">{$AGEVERIFY_MESSAGE|escape:'html':'UTF-8'}</textarea>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Confirm button text' mod='ageverify'}</label>
        <div class="col-lg-4">
          <input type="text" name="AGEVERIFY_BTN_YES" value="{$AGEVERIFY_BTN_YES|escape:'html':'UTF-8'}" class="form-control" />
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Reject button text' mod='ageverify'}</label>
        <div class="col-lg-4">
          <input type="text" name="AGEVERIFY_BTN_NO" value="{$AGEVERIFY_BTN_NO|escape:'html':'UTF-8'}" class="form-control" />
        </div>
      </div>
    </div>
  </div>

  <!-- APARÊNCIA -->
  <div class="panel">
    <div class="panel-heading">
      <i class="icon-picture"></i> {l s='Appearance' mod='ageverify'}
    </div>
    <div class="form-wrapper">

      <p class="av-section-label">{l s='Typography & layout' mod='ageverify'}</p>
      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Font size (px)' mod='ageverify'}</label>
        <div class="col-lg-2">
          <input type="text" name="AGEVERIFY_FONT_SIZE" value="{$AGEVERIFY_FONT_SIZE|escape:'html':'UTF-8'}" class="form-control" placeholder="14" />
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Logo max width (px)' mod='ageverify'}</label>
        <div class="col-lg-2">
          <input type="text" name="AGEVERIFY_LOGO_MAX_WIDTH" value="{$AGEVERIFY_LOGO_MAX_WIDTH|escape:'html':'UTF-8'}" class="form-control" placeholder="120" />
        </div>
      </div>

      <hr style="margin:18px 0;border-color:#e2e6ea;" />
      <p class="av-section-label">{l s='Colors' mod='ageverify'}</p>

      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Circle background' mod='ageverify'}</label>
        <div class="col-lg-8">
          <div class="av-color-group">
            <div class="av-color-preview" id="prev_bg" style="background:{$AGEVERIFY_BG_COLOR|escape:'html':'UTF-8'};"></div>
            <input type="text" name="AGEVERIFY_BG_COLOR" id="AGEVERIFY_BG_COLOR" value="{$AGEVERIFY_BG_COLOR|escape:'html':'UTF-8'}" class="form-control" oninput="document.getElementById('prev_bg').style.background=this.value" />
            <div class="av-swatches">
              <span class="av-swatch" style="background:#ffffff;" onclick="avSetColor('AGEVERIFY_BG_COLOR','prev_bg','#ffffff')"></span>
              <span class="av-swatch" style="background:#f8f9fa;" onclick="avSetColor('AGEVERIFY_BG_COLOR','prev_bg','#f8f9fa')"></span>
              <span class="av-swatch" style="background:#1a1a2e;" onclick="avSetColor('AGEVERIFY_BG_COLOR','prev_bg','#1a1a2e')"></span>
              <span class="av-swatch" style="background:#0f3460;" onclick="avSetColor('AGEVERIFY_BG_COLOR','prev_bg','#0f3460')"></span>
              <span class="av-swatch" style="background:#533483;" onclick="avSetColor('AGEVERIFY_BG_COLOR','prev_bg','#533483')"></span>
              <span class="av-swatch" style="background:#2b2d42;" onclick="avSetColor('AGEVERIFY_BG_COLOR','prev_bg','#2b2d42')"></span>
              <span class="av-swatch" style="background:#000000;" onclick="avSetColor('AGEVERIFY_BG_COLOR','prev_bg','#000000')"></span>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Text color' mod='ageverify'}</label>
        <div class="col-lg-8">
          <div class="av-color-group">
            <div class="av-color-preview" id="prev_text" style="background:{$AGEVERIFY_TEXT_COLOR|escape:'html':'UTF-8'};"></div>
            <input type="text" name="AGEVERIFY_TEXT_COLOR" id="AGEVERIFY_TEXT_COLOR" value="{$AGEVERIFY_TEXT_COLOR|escape:'html':'UTF-8'}" class="form-control" oninput="document.getElementById('prev_text').style.background=this.value" />
            <div class="av-swatches">
              <span class="av-swatch" style="background:#000000;" onclick="avSetColor('AGEVERIFY_TEXT_COLOR','prev_text','#000000')"></span>
              <span class="av-swatch" style="background:#2d3748;" onclick="avSetColor('AGEVERIFY_TEXT_COLOR','prev_text','#2d3748')"></span>
              <span class="av-swatch" style="background:#ffffff;" onclick="avSetColor('AGEVERIFY_TEXT_COLOR','prev_text','#ffffff')"></span>
              <span class="av-swatch" style="background:#6b7280;" onclick="avSetColor('AGEVERIFY_TEXT_COLOR','prev_text','#6b7280')"></span>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Confirm button bg' mod='ageverify'}</label>
        <div class="col-lg-8">
          <div class="av-color-group">
            <div class="av-color-preview" id="prev_yesbg" style="background:{$AGEVERIFY_BTN_YES_BG|escape:'html':'UTF-8'};"></div>
            <input type="text" name="AGEVERIFY_BTN_YES_BG" id="AGEVERIFY_BTN_YES_BG" value="{$AGEVERIFY_BTN_YES_BG|escape:'html':'UTF-8'}" class="form-control" oninput="document.getElementById('prev_yesbg').style.background=this.value" />
            <div class="av-swatches">
              <span class="av-swatch" style="background:#28a745;" onclick="avSetColor('AGEVERIFY_BTN_YES_BG','prev_yesbg','#28a745')"></span>
              <span class="av-swatch" style="background:#20c997;" onclick="avSetColor('AGEVERIFY_BTN_YES_BG','prev_yesbg','#20c997')"></span>
              <span class="av-swatch" style="background:#007bff;" onclick="avSetColor('AGEVERIFY_BTN_YES_BG','prev_yesbg','#007bff')"></span>
              <span class="av-swatch" style="background:#5b6af0;" onclick="avSetColor('AGEVERIFY_BTN_YES_BG','prev_yesbg','#5b6af0')"></span>
              <span class="av-swatch" style="background:#6c757d;" onclick="avSetColor('AGEVERIFY_BTN_YES_BG','prev_yesbg','#6c757d')"></span>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Confirm button text' mod='ageverify'}</label>
        <div class="col-lg-8">
          <div class="av-color-group">
            <div class="av-color-preview" id="prev_yestxt" style="background:{$AGEVERIFY_BTN_YES_TEXT|escape:'html':'UTF-8'};"></div>
            <input type="text" name="AGEVERIFY_BTN_YES_TEXT" id="AGEVERIFY_BTN_YES_TEXT" value="{$AGEVERIFY_BTN_YES_TEXT|escape:'html':'UTF-8'}" class="form-control" oninput="document.getElementById('prev_yestxt').style.background=this.value" />
            <div class="av-swatches">
              <span class="av-swatch" style="background:#ffffff;" onclick="avSetColor('AGEVERIFY_BTN_YES_TEXT','prev_yestxt','#ffffff')"></span>
              <span class="av-swatch" style="background:#000000;" onclick="avSetColor('AGEVERIFY_BTN_YES_TEXT','prev_yestxt','#000000')"></span>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Reject button bg' mod='ageverify'}</label>
        <div class="col-lg-8">
          <div class="av-color-group">
            <div class="av-color-preview" id="prev_nobg" style="background:{$AGEVERIFY_BTN_NO_BG|escape:'html':'UTF-8'};"></div>
            <input type="text" name="AGEVERIFY_BTN_NO_BG" id="AGEVERIFY_BTN_NO_BG" value="{$AGEVERIFY_BTN_NO_BG|escape:'html':'UTF-8'}" class="form-control" oninput="document.getElementById('prev_nobg').style.background=this.value" />
            <div class="av-swatches">
              <span class="av-swatch" style="background:#dc3545;" onclick="avSetColor('AGEVERIFY_BTN_NO_BG','prev_nobg','#dc3545')"></span>
              <span class="av-swatch" style="background:#c0392b;" onclick="avSetColor('AGEVERIFY_BTN_NO_BG','prev_nobg','#c0392b')"></span>
              <span class="av-swatch" style="background:#fd7e14;" onclick="avSetColor('AGEVERIFY_BTN_NO_BG','prev_nobg','#fd7e14')"></span>
              <span class="av-swatch" style="background:#6c757d;" onclick="avSetColor('AGEVERIFY_BTN_NO_BG','prev_nobg','#6c757d')"></span>
              <span class="av-swatch" style="background:#343a40;" onclick="avSetColor('AGEVERIFY_BTN_NO_BG','prev_nobg','#343a40')"></span>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-lg-3">{l s='Reject button text' mod='ageverify'}</label>
        <div class="col-lg-8">
          <div class="av-color-group">
            <div class="av-color-preview" id="prev_notxt" style="background:{$AGEVERIFY_BTN_NO_TEXT|escape:'html':'UTF-8'};"></div>
            <input type="text" name="AGEVERIFY_BTN_NO_TEXT" id="AGEVERIFY_BTN_NO_TEXT" value="{$AGEVERIFY_BTN_NO_TEXT|escape:'html':'UTF-8'}" class="form-control" oninput="document.getElementById('prev_notxt').style.background=this.value" />
            <div class="av-swatches">
              <span class="av-swatch" style="background:#ffffff;" onclick="avSetColor('AGEVERIFY_BTN_NO_TEXT','prev_notxt','#ffffff')"></span>
              <span class="av-swatch" style="background:#000000;" onclick="avSetColor('AGEVERIFY_BTN_NO_TEXT','prev_notxt','#000000')"></span>
            </div>
          </div>
        </div>
      </div>

    </div>
    <div class="panel-footer">
      <button type="submit" name="submitAgeVerify" class="btn btn-save-av pull-right">
        <i class="icon-save"></i>&nbsp; {l s='Save settings' mod='ageverify'}
      </button>
    </div>
  </div>

  <!-- CRÉDITOS -->
  <div class="av-credits">
    <div class="av-credits-icon"><i class="icon-star"></i></div>
    <div class="av-credits-text">
      <h4>{l s='Developed by' mod='ageverify'} <a href="https://iddigital.pt" target="_blank" rel="noopener">iddigital.pt</a></h4>
      <p>{l s='This free module is provided by iddigital.pt. Please keep this credit as a way to support the developer.' mod='ageverify'}</p>
    </div>
  </div>

  <script>
  function avSetColor(inputId, previewId, color) {
    document.getElementById(inputId).value = color;
    document.getElementById(previewId).style.background = color;
  }
  </script>

</form>
