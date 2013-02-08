# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
  $('.announcement .header').bind('click', ->
    $(this).parent('.announcement').find('.content').toggle()
    $(this).find('i').toggleClass('icon-eye-open').toggleClass('icon-eye-close')
  )
)