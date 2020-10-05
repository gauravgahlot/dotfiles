var app = {};

app.version = function () {return chrome.runtime.getManifest().version};
app.homepage = function () {return chrome.runtime.getManifest().homepage_url};

chrome.runtime.onMessage.addListener(function (e, sender, response) {
  if (e.message === "top") {
    response(sender.tab.url);
  }
});

if (!navigator.webdriver) {
  chrome.runtime.setUninstallURL(app.homepage() + "?v=" + app.version() + "&type=uninstall", function () {});
  chrome.runtime.onInstalled.addListener(function (e) {
    chrome.management.getSelf(function (result) {
      if (result.installType === "normal") {
        window.setTimeout(function () {
          var previous = config.welcome.open && e.previousVersion !== undefined && e.previousVersion !== app.version();
          var doupdate = previous && parseInt((Date.now() - config.welcome.lastupdate) / (24 * 3600 * 1000)) > 365;
          if (e.reason === "install" || (e.reason === "update" && doupdate)) {
            var parameter = (e.previousVersion ? "&p=" + e.previousVersion : '') + "&type=" + e.reason;
            app.tab.open(app.homepage() + "?v=" + app.version() + parameter);
            config.welcome.lastupdate = Date.now();
          }
        }, 3000);
      }
    });
  });
}

chrome.runtime.onInstalled.addListener(function (e) {
  var index = e.reason === "install" ? 40 : 1;
  /*  */
  chrome.storage.local.get(null, function (data) {
    var tmp = {};
    var key = "dark_" + index;
    /*  */
    tmp["custom"] = data.custom !== undefined ? data.custom : '';
    tmp["state"] = data.state !== undefined ? data.state : "light";
    tmp["whitelist"] = data.whitelist !== undefined ? data.whitelist : [];
    tmp["support"] = data.support !== undefined ? data.support : navigator.userAgent.toLowerCase().indexOf("firefox") === -1;
    /*  */
    tmp["section-1"] = data["section-1"] !== undefined ? data["section-1"] : true;
    tmp["section-2"] = data["section-2"] !== undefined ? data["section-2"] : false;
    tmp["section-3"] = data["section-3"] !== undefined ? data["section-3"] : false;
    tmp["section-4"] = data["section-4"] !== undefined ? data["section-4"] : false;
    /*  */
    for (var i = 1; i <= website.total.themes.number; i++) tmp["dark_" + i] = data["dark_" + i] !== undefined ? data["dark_" + i] : false;
    for (var name in website.custom.regex.rules) tmp[name] = data[name] !== undefined ? data[name] : true;
    tmp[key] = data[key] !== undefined ? data[key] : true;
    /*  */
    chrome.storage.local.set(tmp, function () {});
  });
});