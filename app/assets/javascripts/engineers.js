$(function() {
    $('.status').each(function(i, e) {
        if ($(e).text().indexOf("E") > -1) {
            $(e).css('color', '#090');
        } else if ($(e).text().indexOf("D") > -1) {
            $(e).css('color', '#990');
        } else if ($(e).text().indexOf("C") > -1) {
            $(e).css('color', '#B70');
        } else if ($(e).text().indexOf("B") > -1) {
            $(e).css('color', '#B00');
        } else if ($(e).text().indexOf("A") > -1) {
            $(e).css('color', '#A59');
        }
    });
});
