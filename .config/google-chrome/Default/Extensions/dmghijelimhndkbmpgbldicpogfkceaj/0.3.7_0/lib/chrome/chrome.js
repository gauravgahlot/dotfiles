app.tab = {
  "open": function (url) {
    chrome.tabs.create({"url": url, "active": true});
  }
};

app.button = {
  set icon (e) {chrome.browserAction.setIcon(e)},
  set title (title) {chrome.browserAction.setTitle({"title": title})},
  "clicked": function (callback) {
    chrome.browserAction.onClicked.addListener(callback);
  }
};

app.contextmenus = {
  "create": function (e) {
    chrome.contextMenus.create(e);
  },
  "clicked": function (callback) {
    chrome.contextMenus.onClicked.addListener(callback);
  }
};

app.options = (function () {
  var tmp = {};
  chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
    for (var id in tmp) {
      if (tmp[id] && (typeof tmp[id] === "function")) {
        if (request.path === "options-to-background") {
          if (request.method === id) tmp[id](request.data);
        }
      }
    }
  });
  /*  */
  return {
    "receive": function (id, callback) {tmp[id] = callback},
    "send": function (id, data, tabId) {
      chrome.runtime.sendMessage({"path": "background-to-options", "method": id, "data": data});
    }
  }
})();

app.storage = (function () {
  var objs = {};
  chrome.storage.onChanged.addListener(function () {
    chrome.storage.local.get(null, function (e) {
      objs = e;
    });
  });
  /*  */
  window.setTimeout(function () {
    chrome.storage.local.get(null, function (e) {
      objs = e;
      var script = document.createElement("script");
      script.src = "../common.js";
      document.body.appendChild(script);
    });
  }, 0);
  /*  */
  return {
    "read": function (id) {return objs[id]},
    "write": function (id, data) {
      var tmp = {};
      tmp[id] = data;
      objs[id] = data;
      chrome.storage.local.set(tmp, function () {});
    }
  }
})();