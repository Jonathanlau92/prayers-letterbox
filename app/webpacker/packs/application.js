// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("selectize")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Import images
const images = require.context('../src/images', true)

// Import bootstrap
import 'bootstrap/dist/js/bootstrap';

// Custom javascript from src file
import '../src/javascripts/direct_upload';

// For bootstrap popover and tooltip
document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
    $("#prayer_categories").selectize({
        maxItems: 10
    });

    $('#prayer_status').selectize({
        create: true,
        sortField: 'text'
    });

    $('#prayer_status').change(function() {
        if ($("#curr_status").val() !== $(this).val()) {
            $("#change_status_prompt").addClass("mb-3");
            $("#change_status_prompt").html("<i class='text-warning'>Click submit if you confirm the change of prayer status.</i>");
        } else {
            $("#change_status_prompt").removeClass();
            $("#change_status_prompt").html("");
        }
    });
})

// Import font-awesome icons
import "@fortawesome/fontawesome-free/js/all";

// Use jquery in js erb
import $ from 'jquery';
global.$ = jQuery;

// Import custom js
import '../src/javascripts/add_friend';
