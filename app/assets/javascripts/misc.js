$(document).ready( function() {
  $(document).tooltip({
    show: 200,
    hide: false,
    position: { my: "left+15 top" }
  });
});

//from DextOr on StackOverflow
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
