$(document).ready(function() {
    $("div#add_note_form").hide();
    $("a#show_form").click(function(event) {
        event.preventDefault();
        $("div#add_note_form").toggle();
    });
});

