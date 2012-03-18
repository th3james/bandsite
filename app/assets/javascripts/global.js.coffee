$(document).ready () ->
  $('#navigation-bar a').click (e) ->
    elem = e.srcElement

    $('#navigation-bar li').removeClass 'active'
    $(elem).parent().addClass 'active'

    $('div.nav-collapse').collapse('hide')
