var config = {
  "head": document.documentElement || document.head || document.querySelector("head"),
  "tab": {
    "href": document.location.href
  },
  "general": {
    "link": document.getElementById("dark-mode-general-link")
  },
  "custom": {
    "link": document.getElementById("dark-mode-custom-link"),
    "style": document.getElementById("dark-mode-custom-style"),
  },
  "init": function (e) {
    if (e) config.tab.href = e;
    config.update();
  },
  "edit": function (href_a, href_b, txt) {    
    config.custom.style.textContent = txt;
    /*  */
    href_b ? config.custom.link.setAttribute("href", href_b) : config.custom.link.removeAttribute("href");
    href_a ? config.general.link.setAttribute("href", href_a) : config.general.link.removeAttribute("href");
  },
  "host": {
    "name": function (url) {
      url = url.replace("www.", '');
      var s = url.indexOf("//") + 2;
      if (s > 1) {
        var o = url.indexOf('/', s);
        if (o > 0) return url.substring(s, o);
        else {
          o = url.indexOf('?', s);
          if (o > 0) return url.substring(s, o);
          else return url.substring(s);
        }
      } else return url;
    }
  },
  "load": function () {
    if (!config.general.link) {
      config.general.link = document.createElement("link");
      config.general.link.setAttribute("type", "text/css");
      config.general.link.setAttribute("rel", "stylesheet");
      config.general.link.setAttribute("id", "dark-mode-general-link");
      if (config.head) config.head.appendChild(config.general.link);
    }
    /*  */
    if (!config.custom.link) {
      config.custom.link = document.createElement("link");
      config.custom.link.setAttribute("type", "text/css");
      config.custom.link.setAttribute("rel", "stylesheet");
      config.custom.link.setAttribute("id", "dark-mode-custom-link");
      if (config.head) config.head.appendChild(config.custom.link);
    }
    /*  */
    if (!config.custom.style) {
      config.custom.style = document.createElement("style");
      config.custom.style.setAttribute("type", "text/css");
      config.custom.style.setAttribute("id", "dark-mode-custom-style");
      if (config.head) config.head.appendChild(config.custom.style);
    }
    /*  */
    var observer = new MutationObserver(function () {
      var tmp = document.getElementById("dark-mode-general-link");
      if (!tmp) {
        if (config.head) {
          config.head.appendChild(config.general.link);
        }
      }
      observer.disconnect();
    });
    /*  */
    observer.observe(document, {"childList": true, "subtree": true});
  },
  "update": function () {
    chrome.storage.local.get(null, function (e) {
      var id = null;
      var host = config.host.name(config.tab.href);
      /* disable dark mode for chrome newtab page */
      if (config.tab.href.indexOf("/chrome/newtab") !== -1) return config.edit('', '', '');
      for (var i = 0; i < e.whitelist.length; i++) {
        if (e.whitelist[i] === host) return config.edit('', '', '');
      }
      /*  */
      for (var i = 1; i <= website.total.themes.number; i++) {
        if (e["dark_" + i]) {
          id = i;
          break;
        }
      }
      /*  */
      for (var name in website.custom.regex.rules) {
        if (e[name]) {
          var rule = new RegExp(website.custom.regex.rules[name]);
          if (rule.test(decodeURIComponent(config.tab.href))) {
            var href_a = e.state === "dark" ? chrome.runtime.getURL("data/content_script/custom/dark.css") : '';
            var href_b = e.state === "dark" ? chrome.runtime.getURL("data/content_script/custom/" + name + ".css") : '';
            /*  */
            href_a = website.exclude.from.custom.dark.mode.indexOf(name) === -1 ? href_a : '';
            config.edit(href_a, href_b, '');
            return;
          }
        }
      }
      /*  */
      if (e.state === "dark") {
        if (id) {
          var href = chrome.runtime.getURL("data/content_script/general/dark_" + id + ".css");
          if (id === website.customized.theme.number) {
            chrome.storage.local.get(null, function (e) {config.edit('', '', e.custom)});
          } else config.edit(href, '', '');
        } else config.edit('', '', '');
      } else config.edit('', '', '');
    });
  }
};

if (window === window.top) config.update();
else chrome.runtime.sendMessage({"message": "top"}, config.init);

config.load();
chrome.storage.onChanged.addListener(config.update);