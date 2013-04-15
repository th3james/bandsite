$(document).ready () ->
  $('#navigation-bar a').click (e) ->
    elem = e.currentTarget

    target = $(elem).attr('href')
    

    $('div.nav-collapse').collapse('hide')

    # Are we dealing with an anchor link?
    if target[0] == '#'
      $('html, body').animate({
         scrollTop: $(target).offset().top
      }, 500)
      $(target).effect("highlight", {color: '#FF7826'}, 1500)
      return false
    else
      $('#navigation-bar li').removeClass 'active'
      $(elem).parent().addClass 'active'

    $('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])').pjax('[data-pjax-container]')
