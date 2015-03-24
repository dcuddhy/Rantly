function updateCountdown() {
    // 140 is the max message length
    var remaining = jQuery('.message').val().length;
    jQuery('.count').text(remaining + ' Characters');
}

jQuery(document).ready(function($) {
    updateCountdown();
    $('.message').change(updateCountdown);
    $('.message').keyup(updateCountdown);
});
