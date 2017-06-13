App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      $('.message_area').append '<div class="message-row">' +
        '<div class="name">' + data.email + '</div>' +
        '<div class="message">' + data.content + '</div>' + '</div>'
