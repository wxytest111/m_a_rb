/**
 * An Angular module that gives you access to the browsers local storage
 * @version v0.1.5 - 2015-03-21
 * @link https://github.com/grevory/angular-local-storage
 * @author grevory <greg@gregpike.ca>
 * @license MIT License, http://www.opensource.org/licenses/MIT
 */!function (a, b) {
    "use strict";
    function c(a) {
        return /^-?\d+\.?\d*$/.test(a.replace(/["']/g, ""))
    }

    var d = b.isDefined, e = b.isUndefined, f = b.isNumber, g = b.isObject, h = b.isArray, i = b.extend, j = b.toJson, k = b.fromJson, l = b.module("LocalStorageModule", []);
    l.provider("localStorageService", function () {
        this.prefix = "ls", this.storageType = "localStorage", this.cookie = {
            expiry: 30,
            path: "/"
        }, this.notify = {setItem: !0, removeItem: !1}, this.setPrefix = function (a) {
            return this.prefix = a, this
        }, this.setStorageType = function (a) {
            return this.storageType = a, this
        }, this.setStorageCookie = function (a, b) {
            return this.cookie.expiry = a, this.cookie.path = b, this
        }, this.setStorageCookieDomain = function (a) {
            return this.cookie.domain = a, this
        }, this.setNotify = function (a, b) {
            return this.notify = {setItem: a, removeItem: b}, this
        }, this.$get = ["$rootScope", "$window", "$document", "$parse", function (a, b, l, m) {
            var n, o = this, p = o.prefix, q = o.cookie, r = o.notify, s = o.storageType;
            l ? l[0] && (l = l[0]) : l = document, "." !== p.substr(-1) && (p = p ? p + "." : "");
            var t = function (a) {
                return p + a
            }, u = function () {
                try {
                    var c = s in b && null !== b[s], d = t("__" + Math.round(1e7 * Math.random()));
                    return c && (n = b[s], n.setItem(d, ""), n.removeItem(d)), c
                } catch (e) {
                    return s = "cookie", a.$broadcast("LocalStorageModule.notification.error", e.message), !1
                }
            }(), v = function (b, c) {
                if (e(c) ? c = null : (g(c) || h(c) || f(+c || c)) && (c = j(c)), !u || "cookie" === o.storageType)return u || a.$broadcast("LocalStorageModule.notification.warning", "LOCAL_STORAGE_NOT_SUPPORTED"), r.setItem && a.$broadcast("LocalStorageModule.notification.setitem", {
                    key: b,
                    newvalue: c,
                    storageType: "cookie"
                }), B(b, c);
                try {
                    n && n.setItem(t(b), c), r.setItem && a.$broadcast("LocalStorageModule.notification.setitem", {
                        key: b,
                        newvalue: c,
                        storageType: o.storageType
                    })
                } catch (d) {
                    return a.$broadcast("LocalStorageModule.notification.error", d.message), B(b, c)
                }
                return !0
            }, w = function (b) {
                if (!u || "cookie" === o.storageType)return u || a.$broadcast("LocalStorageModule.notification.warning", "LOCAL_STORAGE_NOT_SUPPORTED"), C(b);
                var d = n ? n.getItem(t(b)) : null;
                return d && "null" !== d ? "{" === d.charAt(0) || "[" === d.charAt(0) || c(d) ? k(d) : d : null
            }, x = function (b) {
                if (!u || "cookie" === o.storageType)return u || a.$broadcast("LocalStorageModule.notification.warning", "LOCAL_STORAGE_NOT_SUPPORTED"), r.removeItem && a.$broadcast("LocalStorageModule.notification.removeitem", {
                    key: b,
                    storageType: "cookie"
                }), D(b);
                try {
                    n.removeItem(t(b)), r.removeItem && a.$broadcast("LocalStorageModule.notification.removeitem", {
                        key: b,
                        storageType: o.storageType
                    })
                } catch (c) {
                    return a.$broadcast("LocalStorageModule.notification.error", c.message), D(b)
                }
                return !0
            }, y = function () {
                if (!u)return a.$broadcast("LocalStorageModule.notification.warning", "LOCAL_STORAGE_NOT_SUPPORTED"), !1;
                var b = p.length, c = [];
                for (var d in n)if (d.substr(0, b) === p)try {
                    c.push(d.substr(b))
                } catch (e) {
                    return a.$broadcast("LocalStorageModule.notification.error", e.Description), []
                }
                return c
            }, z = function (b) {
                var c = p ? new RegExp("^" + p) : new RegExp, d = b ? new RegExp(b) : new RegExp;
                if (!u || "cookie" === o.storageType)return u || a.$broadcast("LocalStorageModule.notification.warning", "LOCAL_STORAGE_NOT_SUPPORTED"), E();
                var e = p.length;
                for (var f in n)if (c.test(f) && d.test(f.substr(e)))try {
                    x(f.substr(e))
                } catch (g) {
                    return a.$broadcast("LocalStorageModule.notification.error", g.message), E()
                }
                return !0
            }, A = function () {
                try {
                    return b.navigator.cookieEnabled || "cookie"in l && (l.cookie.length > 0 || (l.cookie = "test").indexOf.call(l.cookie, "test") > -1)
                } catch (c) {
                    return a.$broadcast("LocalStorageModule.notification.error", c.message), !1
                }
            }(), B = function (b, c, d) {
                if (e(c))return !1;
                if ((h(c) || g(c)) && (c = j(c)), !A)return a.$broadcast("LocalStorageModule.notification.error", "COOKIES_NOT_SUPPORTED"), !1;
                try {
                    var i = "", k = new Date, m = "";
                    if (null === c ? (k.setTime(k.getTime() + -864e5), i = "; expires=" + k.toGMTString(), c = "") : f(d) && 0 !== d ? (k.setTime(k.getTime() + 24 * d * 60 * 60 * 1e3), i = "; expires=" + k.toGMTString()) : 0 !== q.expiry && (k.setTime(k.getTime() + 24 * q.expiry * 60 * 60 * 1e3), i = "; expires=" + k.toGMTString()), b) {
                        var n = "; path=" + q.path;
                        q.domain && (m = "; domain=" + q.domain), l.cookie = t(b) + "=" + encodeURIComponent(c) + i + n + m
                    }
                } catch (o) {
                    return a.$broadcast("LocalStorageModule.notification.error", o.message), !1
                }
                return !0
            }, C = function (b) {
                if (!A)return a.$broadcast("LocalStorageModule.notification.error", "COOKIES_NOT_SUPPORTED"), !1;
                for (var c = l.cookie && l.cookie.split(";") || [], d = 0; d < c.length; d++) {
                    for (var e = c[d]; " " === e.charAt(0);)e = e.substring(1, e.length);
                    if (0 === e.indexOf(t(b) + "=")) {
                        var f = decodeURIComponent(e.substring(p.length + b.length + 1, e.length));
                        try {
                            var g = JSON.parse(f);
                            return k(g)
                        } catch (h) {
                            return f
                        }
                    }
                }
                return null
            }, D = function (a) {
                B(a, null)
            }, E = function () {
                for (var a = null, b = p.length, c = l.cookie.split(";"), d = 0; d < c.length; d++) {
                    for (a = c[d]; " " === a.charAt(0);)a = a.substring(1, a.length);
                    var e = a.substring(b, a.indexOf("="));
                    D(e)
                }
            }, F = function () {
                return s
            }, G = function (a, b, c, e) {
                e = e || b;
                var f = w(e);
                return null === f && d(c) ? f = c : g(f) && g(c) && (f = i(c, f)), m(b).assign(a, f), a.$watch(b, function (a) {
                    v(e, a)
                }, g(a[b]))
            }, H = function () {
                for (var a = 0, c = b[s], d = 0; d < c.length; d++)0 === c.key(d).indexOf(p) && a++;
                return a
            };
            return {
                isSupported: u,
                getStorageType: F,
                set: v,
                add: v,
                get: w,
                keys: y,
                remove: x,
                clearAll: z,
                bind: G,
                deriveKey: t,
                length: H,
                cookie: {isSupported: A, set: B, add: B, get: C, remove: D, clearAll: E}
            }
        }]
    })
}(window, window.angular);