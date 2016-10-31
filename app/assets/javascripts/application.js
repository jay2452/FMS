// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require ckeditor/init
//= require_tree .


$(document).ready(function() {
  $('select').material_select();
});



function validateDocument(docID) {
  $("#" + docID).validate({
    onkeyup: false,
    onfocusout: function (element, event) {
      this.element(element);
    },
    invalidHandler: function () {
      $(this).find(":input.error:first").focus();
    },
    rules: {
      "program": {
        required: true,
      },
      "document[group_id]": {
        required: true,
      },
      "document[file]": {
        required: true,
      }
    },
    messages: {
      "program": {
        required: "Please select program ",
      },
      "document[group_id]": {
        required: "Please select a Project"
      },
      "document[file]": {
        required: "Please upload a file"
      }
    },
    submitHandler: function (form) {
      form.submit();
    }
  });
}
