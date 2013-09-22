jQuery.post("/location/add", {
  "name": "London",
  "description": "All about the details. Of course it's black.",
}, function (data, textStatus, jqXHR) {
    console.log("Post resposne:"); console.dir(data); console.log(textStatus); console.dir(jqXHR);
});