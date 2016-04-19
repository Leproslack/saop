# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(document).on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val '1'
    $(this).closest('fieldset').fadeOut 200
    event.preventDefault()
  $(document).on 'click', '.add_fields', (event) ->
    regexp = undefined
    time = undefined
    time = (new Date).getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).after $(this).data('fields').replace(regexp, time)
    event.preventDefault()
