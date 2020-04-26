// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

$( document ).ready(function() {
    $(".loader").hide();
    $("#open_graph_image").hide();

    $('#open_grah_form').submit((event)=>{
        event.preventDefault();
        $(".loader").show();
        const url = $('#open_graph_form_input').val();
        const postObject = {
            url: url,
        };

        $.ajax({
            url: "http://localhost:3000/url",
            data: JSON.stringify(postObject),
            contentType: "application/json; charset=utf-8",
            traditional: true,
            type: "POST",
            success: function() {
                console.log("Successfully posted image");
            },
            error:function(error) {
                $(".loader").hide();
                alert(`There was an error Posting to /url status: ${error.status} message: ${error.responseText}`);
            }
        });
    });
});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
