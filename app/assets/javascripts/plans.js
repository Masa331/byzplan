# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function updateCountdown() {
    // 140 is the max message length
    var remaining = 140 - jQuery('.counted').val().length;
    jQuery('.countdown') .text(remaining + ' characters remaining.');
}

jQuery(document).ready(function($) {
    updateCountdown();
    $('.counted').change(updateCountdown);
    $('.counted').keyup(updateCountdown);
});