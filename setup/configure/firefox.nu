#!/usr/bin/env nu

let policies = {
  policies: {
    DisablePocket: true
    DontCheckDefaultBrowser: true
    Extensions: {
      Install: [
        'https://addons.mozilla.org/firefox/downloads/file/3940986/bitwarden_password_manager-1.58.0.xpi'
        'https://addons.mozilla.org/firefox/downloads/file/3993826/duckduckgo_for_firefox-2022.8.25.xpi'
      ]
    }
    Handlers: {
      schemes: {
        mailto: {
          action: useHelperApp
          ask: false
          handlers: [{
            name: Gmail
            uriTemplate: 'https://mail.google.com/mail/?extsrc=mailto&url=%s'
          }]
        }
      }
    }
    NoDefaultBookmarks: true
    OfferToSaveLoginsDefault: false
    Permissions: {
      Camera: {
        Allow: []
        Block: []
      }
      Microphone: {
        Allow: []
        Block: []
      }
      Location: {
        Allow: []
        Block: []
      }
      Notifications: {
        Allow: []
        Block: []
      }
      Autoplay: {
        Allow: []
        Block: []
      }
    }
    Preferences: {
      'browser.aboutConfig.showWarning': {
        Value: false
        Status: default
      }
      'browser.startup.homepage': {
        Value: 'about:home'
        Status: default
      }
      'browser.warnOnQuitShortcut': {
        Value: true
        Status: default
      }
    }
  }
}

if not ('/etc/firefox/policies/policies.json' | path exists) {

  echo 'Setting Firefox policies...'

  sudo mkdir /etc/firefox/policies
  sudo sh -c $"echo '($policies | to json)' > /etc/firefox/policies/policies.json"
}

