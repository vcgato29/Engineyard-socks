$ ->
  socket = new WebSocket("ws://#{window.location.host}/chat")
  console.log(socket)
  $form = $("form#chat")
  $form.on "submit", (event) ->
    event.preventDefault()
    $input = $form.find("input#message")
    message = $input.val()
    socket.send(JSON.stringify(message: message))
    $input.val("")

  $output = $("#output")

  socket.onmessage = (event) ->
    $output.append(JSON.parse(event.data).message + "\n")