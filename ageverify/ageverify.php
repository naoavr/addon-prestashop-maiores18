<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class AgeVerify extends Module
{
    public function __construct()
    {
        $this->name = 'ageverify';
        $this->tab = 'front_office_features';
        $this->version = '1.1.4';
        $this->author = 'iddigital.pt';
        $this->need_instance = 0;
        $this->bootstrap = true;

        parent::__construct();

        if (method_exists($this, 'trans')) {
            $this->displayName = $this->trans('Age verification popup', [], 'Modules.Ageverify.Admin');
            $this->description = $this->trans('Displays an age verification popup for alcohol related shops.', [], 'Modules.Ageverify.Admin');
        } else {
            $this->displayName = $this->l('Age verification popup');
            $this->description = $this->l('Displays an age verification popup for alcohol related shops.');
        }
    }

    public function install()
    {
        $default_message = 'Este site contém informação sobre bebidas alcoólicas. Confirme que tem idade legal para consumir bebidas alcoólicas.';
        $default_yes = 'Sou maior de idade';
        $default_no = 'Sou menor de idade';

        return parent::install()
            && $this->registerHook('displayHeader')
            && Configuration::updateValue('AGEVERIFY_MIN_AGE', 18)
            && Configuration::updateValue('AGEVERIFY_REDIRECT_URL', '')
            && Configuration::updateValue('AGEVERIFY_MESSAGE', $default_message)
            && Configuration::updateValue('AGEVERIFY_BTN_YES', $default_yes)
            && Configuration::updateValue('AGEVERIFY_BTN_NO', $default_no)
            && Configuration::updateValue('AGEVERIFY_BG_COLOR', '#ffffff')
            && Configuration::updateValue('AGEVERIFY_TEXT_COLOR', '#000000')
            && Configuration::updateValue('AGEVERIFY_BTN_YES_BG', '#28a745')
            && Configuration::updateValue('AGEVERIFY_BTN_YES_TEXT', '#ffffff')
            && Configuration::updateValue('AGEVERIFY_BTN_NO_BG', '#dc3545')
            && Configuration::updateValue('AGEVERIFY_BTN_NO_TEXT', '#ffffff')
            && Configuration::updateValue('AGEVERIFY_FONT_SIZE', '14')
            && Configuration::updateValue('AGEVERIFY_LOGO_MAX_WIDTH', '120');
    }

    public function uninstall()
    {
        return parent::uninstall()
            && Configuration::deleteByName('AGEVERIFY_MIN_AGE')
            && Configuration::deleteByName('AGEVERIFY_REDIRECT_URL')
            && Configuration::deleteByName('AGEVERIFY_MESSAGE')
            && Configuration::deleteByName('AGEVERIFY_BTN_YES')
            && Configuration::deleteByName('AGEVERIFY_BTN_NO')
            && Configuration::deleteByName('AGEVERIFY_BG_COLOR')
            && Configuration::deleteByName('AGEVERIFY_TEXT_COLOR')
            && Configuration::deleteByName('AGEVERIFY_BTN_YES_BG')
            && Configuration::deleteByName('AGEVERIFY_BTN_YES_TEXT')
            && Configuration::deleteByName('AGEVERIFY_BTN_NO_BG')
            && Configuration::deleteByName('AGEVERIFY_BTN_NO_TEXT')
            && Configuration::deleteByName('AGEVERIFY_FONT_SIZE')
            && Configuration::deleteByName('AGEVERIFY_LOGO_MAX_WIDTH');
    }

    public function hookDisplayHeader($params)
    {
        $this->context->controller->registerStylesheet(
            'ageverify-css',
            'modules/'.$this->name.'/views/css/ageverify.css',
            ['media' => 'all', 'priority' => 150]
        );

        $this->context->smarty->assign([
            'ageverify_message'        => Configuration::get('AGEVERIFY_MESSAGE'),
            'ageverify_btn_yes'        => Configuration::get('AGEVERIFY_BTN_YES'),
            'ageverify_btn_no'         => Configuration::get('AGEVERIFY_BTN_NO'),
            'ageverify_redirect'       => Configuration::get('AGEVERIFY_REDIRECT_URL'),
            'ageverify_shop_logo'      => _PS_IMG_.Configuration::get('PS_LOGO'),
            'ageverify_shop_name'      => Configuration::get('PS_SHOP_NAME'),
            'ageverify_bg_color'       => Configuration::get('AGEVERIFY_BG_COLOR'),
            'ageverify_text_color'     => Configuration::get('AGEVERIFY_TEXT_COLOR'),
            'ageverify_btn_yes_bg'     => Configuration::get('AGEVERIFY_BTN_YES_BG'),
            'ageverify_btn_yes_text'   => Configuration::get('AGEVERIFY_BTN_YES_TEXT'),
            'ageverify_btn_no_bg'      => Configuration::get('AGEVERIFY_BTN_NO_BG'),
            'ageverify_btn_no_text'    => Configuration::get('AGEVERIFY_BTN_NO_TEXT'),
            'ageverify_font_size'      => (int)Configuration::get('AGEVERIFY_FONT_SIZE'),
            'ageverify_logo_max_width' => (int)Configuration::get('AGEVERIFY_LOGO_MAX_WIDTH'),
        ]);

        return $this->display(__FILE__, 'views/templates/hook/ageverify.tpl');
    }

    public function getContent()
    {
        $output = '';

        if (Tools::isSubmit('submitAgeVerify')) {
            Configuration::updateValue('AGEVERIFY_MIN_AGE',        (int)Tools::getValue('AGEVERIFY_MIN_AGE'));
            Configuration::updateValue('AGEVERIFY_REDIRECT_URL',   Tools::getValue('AGEVERIFY_REDIRECT_URL'));
            Configuration::updateValue('AGEVERIFY_MESSAGE',        Tools::getValue('AGEVERIFY_MESSAGE'));
            Configuration::updateValue('AGEVERIFY_BTN_YES',        Tools::getValue('AGEVERIFY_BTN_YES'));
            Configuration::updateValue('AGEVERIFY_BTN_NO',         Tools::getValue('AGEVERIFY_BTN_NO'));
            Configuration::updateValue('AGEVERIFY_BG_COLOR',       Tools::getValue('AGEVERIFY_BG_COLOR'));
            Configuration::updateValue('AGEVERIFY_TEXT_COLOR',     Tools::getValue('AGEVERIFY_TEXT_COLOR'));
            Configuration::updateValue('AGEVERIFY_BTN_YES_BG',     Tools::getValue('AGEVERIFY_BTN_YES_BG'));
            Configuration::updateValue('AGEVERIFY_BTN_YES_TEXT',   Tools::getValue('AGEVERIFY_BTN_YES_TEXT'));
            Configuration::updateValue('AGEVERIFY_BTN_NO_BG',      Tools::getValue('AGEVERIFY_BTN_NO_BG'));
            Configuration::updateValue('AGEVERIFY_BTN_NO_TEXT',    Tools::getValue('AGEVERIFY_BTN_NO_TEXT'));
            Configuration::updateValue('AGEVERIFY_FONT_SIZE',      Tools::getValue('AGEVERIFY_FONT_SIZE'));
            Configuration::updateValue('AGEVERIFY_LOGO_MAX_WIDTH', Tools::getValue('AGEVERIFY_LOGO_MAX_WIDTH'));

            $output .= $this->displayConfirmation($this->l('Settings updated'));
        }

        $this->context->smarty->assign([
            'AGEVERIFY_MIN_AGE'        => Configuration::get('AGEVERIFY_MIN_AGE'),
            'AGEVERIFY_REDIRECT_URL'   => Configuration::get('AGEVERIFY_REDIRECT_URL'),
            'AGEVERIFY_MESSAGE'        => Configuration::get('AGEVERIFY_MESSAGE'),
            'AGEVERIFY_BTN_YES'        => Configuration::get('AGEVERIFY_BTN_YES'),
            'AGEVERIFY_BTN_NO'         => Configuration::get('AGEVERIFY_BTN_NO'),
            'AGEVERIFY_BG_COLOR'       => Configuration::get('AGEVERIFY_BG_COLOR'),
            'AGEVERIFY_TEXT_COLOR'     => Configuration::get('AGEVERIFY_TEXT_COLOR'),
            'AGEVERIFY_BTN_YES_BG'     => Configuration::get('AGEVERIFY_BTN_YES_BG'),
            'AGEVERIFY_BTN_YES_TEXT'   => Configuration::get('AGEVERIFY_BTN_YES_TEXT'),
            'AGEVERIFY_BTN_NO_BG'      => Configuration::get('AGEVERIFY_BTN_NO_BG'),
            'AGEVERIFY_BTN_NO_TEXT'    => Configuration::get('AGEVERIFY_BTN_NO_TEXT'),
            'AGEVERIFY_FONT_SIZE'      => Configuration::get('AGEVERIFY_FONT_SIZE'),
            'AGEVERIFY_LOGO_MAX_WIDTH' => Configuration::get('AGEVERIFY_LOGO_MAX_WIDTH'),
        ]);

        return $output.$this->display(__FILE__, 'views/templates/hook/config.tpl');
    }
}
