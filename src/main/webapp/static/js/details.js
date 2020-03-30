$(function () {
    $('.nav_left_texts').on('click', function () {
        var asd = $(this).find('.jiaorjian').html();
        if (asd == '+') {
            $(this).find('.jiaorjian').html('-')
            $(this).parents('.nav_left_text').find('.nav_left_textss').show();
        } else if (asd == '-') {
            $(this).find('.jiaorjian').html('+')
            $(this).parents('.nav_left_text').find('.nav_left_textss').hide();
        }
    })
})