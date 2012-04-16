$(document).ready () ->
  $('#navigation-bar a').click (e) ->
    elem = e.srcElement

    target = $(elem).attr('href')
    

    $('div.nav-collapse').collapse('hide')

    # Are we dealing with an anchor link?
    if target[0] == '#'
      $('html, body').animate({
         scrollTop: $(target).offset().top
      }, 500)
      $(target).effect("pulsate", { times:1 }, 2000)
      return false
    else
      $('#navigation-bar li').removeClass 'active'
      $(elem).parent().addClass 'active'

