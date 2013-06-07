var Wysihtml5 = function(parentEl, options) {
  var ta = $( "<textarea id='wysihtml5-textarea' placeholder='Enter text' autofocus></textarea>" );
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
      toolbar: null,
      parserRules: wysihtml5ParserRules,
      stylesheets: ["/assets/editor.css"],
    });
    return editor;
  },

  initSelection: function() {
    this.editor.on('load', function() {
      var editor = this;

      var showTooltip = function(evt) {
        var selection = editor.composer.selection.getSelection();

        if ($('.tooltip').length > 0) {
          $('.tooltip').hide('slow').remove();
          $('.tooltip-triangle').hide('slow').remove();
        }

        if (selection.toHtml().length > 0) {

          var rect = selection.getBoundingDocumentRect();

          var tooltip = $("<div>");
          tooltip.attr('class', 'tooltip');

          var sep = $("<div>");
          sep.attr('class', 'tooltip-sep');

          var bold = $("<div>");
          bold.attr('class', 'tooltip-bold');

          var ital = $("<div>");
          ital.attr('class', 'tooltip-italic');

          var und = $("<div>");
          und.attr('class', 'tooltip-underline');

          var sml = $("<div>");
          sml.attr('class', 'tooltip-smaller');

          var big = $("<div>");
          big.attr('class', 'tooltip-bigger');

          // tooltip.click( function() {
          //   console.log('yo');
          //   console.log(editor.composer.selection.getSelection());
          //   editor.composer.commands.exec("bold");
          // })

          bold.click( function() {
            editor.composer.commands.exec("bold");
          })

          ital.click( function() {
            editor.composer.commands.exec("italic");
          })

          und.click( function() {
            editor.composer.commands.exec("underline");
          })

          // TODO: implement font size bigger/smaller

          tooltip.append(bold);
          tooltip.append(sep.clone());
          tooltip.append(ital);
          tooltip.append(sep.clone());
          tooltip.append(und);

          //super fearing
          var num_formats = Math.ceil(tooltip.children().length/2);
          var width = num_formats*(12+8*2) + (num_formats-1);
          var adjust = Math.floor(width/2);

          tooltip.css({
            left: (rect.left+Math.floor(rect.width/2)-adjust) + "px",
            top: (rect.top-40) + "px",
          });

          //triangle
          var triangle = $("<div>");
          triangle.attr('class', 'tooltip-triangle');
          triangle.css({
            left: (rect.left+Math.floor(rect.width/2)) + "px",
            top: (rect.top-5) + "px",
          });


          $('#text').append(tooltip);
          tooltip.hide();
          tooltip.fadeIn(200);
          $('#text').append(triangle);
          triangle.hide();
          triangle.fadeIn(200);

        }
      };

      var updateWordCount = function() {
        var text = $('#text').wysihtml5Text();
        var count = text.split(' ').length;
        $('.wordcount').html(count + ' words');
      }

      editor.composer.element.addEventListener('mouseup', showTooltip);
      editor.composer.element.addEventListener('keyup', showTooltip);
      editor.composer.element.addEventListener('keyup', updateWordCount);

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

