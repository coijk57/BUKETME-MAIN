/**
 * 
 */
 
 $(function() {
    $(".dropdown-item").on("click", function() {
        let selected = $(this).text();
        $(".btn").text(selected);
    });
});