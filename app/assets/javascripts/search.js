$(document).on('turbolinks:load', function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "name",
    url: function(phrase){
      return "/search?q=" + phrase;
    },
    categories: [
      {
        listLocation: "locations",
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit("index?location_end_id="+url)
        console.log(url)
      }
    }
  }

  $input.easyAutocomplete(options)
});
