# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



CountDownClass=
  str_to_time: (str) ->
    arr = str.split(":")
    hours = 0
    minutes = 0
    seconds = 0
    if arr.length == 3
      hours = parseInt(arr[0],10)
      minutes = parseInt(arr[1],10)
      seconds = parseInt(arr[2],10)
    else if arr.length == 2
      minutes = parseInt(arr[0],10)
      seconds = parseInt(arr[1],10)
    else
      seconds = parseInt(arr[0],10)
    return 3600*hours + 60*minutes + seconds

  time_to_str: (t) ->
    thours = Math.floor(t / 3600)
    tminutes = Math.floor((t % 3600) / 60)
    tseconds = t % 60

    if thours > 0
      if thours > 9
        hours = thours.toString()
      else hours = '0' + thours
    else hours = "00"

    if tminutes > 0
      if tminutes > 9
        minutes = tminutes.toString()
      else minutes = '0' + tminutes
    else minutes = "00"

    if tseconds > 0
      if tseconds > 9
        seconds = tseconds.toString()
      else seconds = '0' + tseconds
    else seconds = "00"

    hours + ":" + minutes + ":" + seconds

setInterval ->
    $("div[class ~= 'time_to_end']").each (i) ->
      if $(@).text() != "free" and $(@).text() != "" then $(@).html ->
        t = CountDownClass.str_to_time($(@).text())
        res = if t == 0 then "00:00:00" else CountDownClass.time_to_str(t - 1)
        if t == 1
          if $(@).hasClass("own")
            $("#sound").html("<embed src='assets/doorbell.mp3' hidden=true autostart=true loop=false>")
            alert("Your time is over!!!")
          location.reload()
        return res
  ,1000
