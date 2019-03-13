// review_form
$('#micropost_picture').bind('change', function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 5) {
    alert('I18n.t("picture.alert")');
  }
});

// like_button
$(document).foundation();

$(function() {
  $('.button-like')
    .bind('click', function(event) {
      $(".button-like").toggleClass("liked");
    })
});

// ratting
// $(document).on('turbolinks:load', function() {
//   $('.review-rating').raty({
//       readOnly: true,
//       path: '/assets/',
//       score: function(){
//         return $(this).attr('data-score');
//       },

//   });

//   $('#review-rating-form').raty({
//       path: '/assets',
//       scoreName: 'review[rating]',
//   });
// })
