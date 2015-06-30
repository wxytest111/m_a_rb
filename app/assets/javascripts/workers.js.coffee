# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.coffee.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  $('.field.check_street').delegate('input','click', ->
    values = []
    _.each($('.check_street input:checked'),(input)->

      values.push $(input).val()
    )
    console.log values
    $('.choose_streets').val(values.join(','));
  )
)