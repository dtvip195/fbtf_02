function myFunction() {
  var price = <%= @tour_details.price %>;
  var x = document.getElementById("booking_quantity").value;
  document.getElementById("price").innerHTML = x*price;
}
  myFunction();
  var price = document.getElementById("price").innerHTML;
  console.log(price);
