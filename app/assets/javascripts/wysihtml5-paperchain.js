var Wysihtml5 = function(parentEl, options) {
  var ta = $( "<textarea id='wysihtml5-textarea' placeholder='Title' autofocus></textarea>" );
  this.el = ta;
  this.parentEl = parentEl;

  this.el.html(this.parentEl.html()); //fills editor with current text

  this.parentEl.html(''),
  console.log(this.parentEl);
  this.parentEl.append(ta);

  this.editor = this.createEditor();
  this.initSelection();
  window.editor = this.editor;

};

Wysihtml5.prototype = {

  constructor: Wysihtml5,

  createEditor: function() {
    var editor = new wysihtml5.Editor(this.el[0], {
      toolbar: "wysihtml5-toolbar",
      parserRules: wysihtml5ParserRules,
      stylesheets: ["/assets/editor.css"],
    });
  },

  initSelection: function() {
    this.parentEl.mouseup( function() {
      console.log('select!');
    });
  }

};

(function($) {
  $.fn.wysihtml5 = function() {
    var wysi = new Wysihtml5($(this), {});
  };

  $.fn.wysihtml5Text = function() {
    var parentEl = $(this);
    var text = parentEl.children('textarea').val();
    console.log(text);
    return text;
  };

}(jQuery));

