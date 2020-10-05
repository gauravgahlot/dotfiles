var config = {};

config.page = {
  "test": "https://webbrowsertools.com/darkmode/",
  "newtab": "https://mybrowseraddon.com/blank-new-tab.html"
};

config.addon = {
  set state (val) {app.storage.write("state", val)},
  get state () {return app.storage.read("state") !== undefined ? app.storage.read("state") : "light"}
};

config.welcome = {
  set open (val) {app.storage.write("support", val)},
  set lastupdate (val) {app.storage.write("lastupdate", val)},
  get open () {return app.storage.read("support") !== undefined ? app.storage.read("support") : true},
  get lastupdate () {return app.storage.read("lastupdate") !== undefined ? app.storage.read("lastupdate") : 0}
};
