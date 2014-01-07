$(document).ready(function() {
  (function Editor() {

    var editor = ace.edit("editor");
    editor.setReadOnly(true);
    editor.setTheme("ace/theme/github");
    editor.getSession().setMode("ace/mode/ruby");
    this.editor = editor;

    this.typeCode = function(text, finalPause) {
      var deferred = new $.Deferred();
      var i = 0;
      var timer = setInterval(function () {
        this.editor.insert(text[i++]);
        if (i > text.length) {
          clearInterval(timer);
          setTimeout(function() {
            deferred.resolve();
          }, finalPause);
        }
      }, 50);
      return deferred;
    };

    var demoEditor = this;
    typing = demoEditor.typeCode("# Welcome to Pacto\n# We're going to show you some basic usage here", 1000).promise();
    typing.done(function() {
      editor.setValue("");
      demoEditor.typeCode("# First, add Pacto to your Gemfile\n\ngem 'pacto'\n", 1000).promise().done(function() {
        panel = $("<div class=\"bubble\"></div>");
        panel.height($("#editor-section").height());
        panel.append("<h4>And then...</h4>");
        panel.append("<p>bundle install</p>");
        $("#comments-container").append(panel).addClass('animated slideInRight');;
      });
    });

  })();
});