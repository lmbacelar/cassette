# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  # Endless page on measurements
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more measurements...")
        $.getScript(url)
    $(window).scroll()

  # Morris js chart create and update
  if $('measurements_chart').length
    Morris.Line
      element: 'measurements_chart'
      data: $('#measurements_chart').data('measurements')
      xkey: 'timestamp'
      ykeys: ['value']
      labels: ['Value']
