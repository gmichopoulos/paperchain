$(document).ready( function() {
  $(document).tooltip({
    show: 200,
    hide: false,
    position: { my: "left+15 top" },
    content: function() {
      return $(this).prop('title');
    }
  });
});

//from DextOr on StackOverflow
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
