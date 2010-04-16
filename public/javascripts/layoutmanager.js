/**
 * RUZEE.LayoutManager 0.1
 * (c) 2006 Steffen Rusitschka <steffen@rusitschka.de>
 *
 * RUZEE.LayoutManager is freely distributable under the terms of 
 * an MIT-style license. For details, see http://www.ruzee.com/
 */
var RUZEE=window.RUZEE || {};

RUZEE.LayoutManager = {
  layout : function(e) {
    var Layout = function(e) {
      var d = function(v1, v2) {
        return v1 - v2 < 0 ? 0 : v1 - v2;
      };

      var px = function(c, s) {
        var m = /^\s*(\d+)\s*px\s*$/.exec(Element.getStyle(c, s));
        var v = m && m.length == 2 ? m[1] : "0";
        return v ? parseInt(v) : 0;
      };

      var pad = function(c, s) {
        return px(c, "padding-" + s) + px(c, "border-" + s + "-width");
      };

      var dim = Element.getDimensions(e);
      var box = { top: pad(e, "top"),
                  bottom: d(dim.height, pad(e, "bottom")),
                  left: pad(e, "left"),
                  right: d(dim.width, pad(e, "right")) };
      var cs = []; // element children
      var lm_cs = []; // children with layout manager class
      var csn = e.childNodes;
      for (var i = 0; i < csn.length; ++i) {
        if (typeof csn[i].className != "undefined") {
          cs.push(csn[i]);
          var re = /^\s*lm_(\w+)\s*$/;
          var classes = csn[i].className.split(" ");
          for (var j = 0; j < classes.length; ++j) {
            var m = re.exec(classes[j]);
            if (m && m.length == 2) {
              lm_cs.push([m[1], csn[i]]);
              break; // done
            }
          }
        }
      }

      var update_dim = function(c, pos) {
        var pady = pad(c, "top") + pad(c, "bottom");
        var padx = pad(c, "left") + pad(c, "right");

        var new_style = null;
        switch (pos) {
        case "top":
          new_style = {
            position: "absolute",
            top: box.top + "px",
            left: box.left + "px",
            width: d(box.right, box.left + padx) + "px" };
          box.top += Element.getDimensions(c).height;
          break;
        case "bottom":
          var h = Element.getDimensions(c).height;
          new_style = {
            position: "absolute",
            top: d(box.bottom, h) + "px",
            left: box.left + "px",
            width: d(box.right, box.left + padx) + "px" };
          box.bottom -= h;
          break;
        case "left":
          new_style = {
            position: "absolute",
            top: box.top + "px",
            left: box.left + "px",
            height: d(box.bottom, box.top + pady) + "px" };
          box.left += Element.getDimensions(c).width;
          break;
        case "right":
          var w = Element.getDimensions(c).width;
          new_style = {
            position: "absolute",
            top: box.top + "px",
            left: d(box.right, w) + "px",
            height: d(box.bottom, box.top + pady) + "px" };
          box.right -= w;
          break;
        case "center":
          new_style = {
            position: "absolute",
            top: box.top + "px",
            left: box.left + "px",
            width: d(box.right, box.left + padx) + "px",
            height: d(box.bottom, box.top + pady) + "px" };
          break;
        }

        return function() {
          if (new_style) {
            Element.setStyle(c, new_style);
          }
        };
      };

      var layout_children = function(pos) {
        var fs = [];
        for (var i = 0; i < lm_cs.length; ++i) {
          if (lm_cs[i][0] == pos) {
            fs.push(update_dim(lm_cs[i][1], pos));
          }
        }
        return fs;
      };

      var fs = [
        layout_children("top"),
        layout_children("bottom"),
        layout_children("left"),
        layout_children("right"),
        layout_children("center")];
      for (var i=0; i<fs.length; ++i) {
        for (var j=0; j<fs[i].length; ++j) if (fs[i][j]) fs[i][j]();
      }

      // recursion
      if (!/^iframe$/i.test(e.tagName)) {
        for (var i = 0; i < cs.length; ++i) {
          new Layout(cs[i]);
        }
      }
    }; // of Layout

    e = e && typeof e.className != 'undefined' ? e : document.body;
    new Layout(e);
    setTimeout(function() { new Layout(e); }, 300);
  }
};

Event.observe(window, "load", RUZEE.LayoutManager.layout);
Event.observe(window, "resize", RUZEE.LayoutManager.layout);
