$ ->
  $(document).on 'click', 'a[data-popup]', (e)->
    url = $(@).attr('href')
    height = $(@).data('popup-height')
    width = $(@).data('popup-width')
    new_window = window.open(url,'Share NP',"height=#{height},width=#{width},toolbar=0,menubar=0,location=0,left=200,top=200")
    new_window.focus() if window.focus
    e.preventDefault() if !!new_window
