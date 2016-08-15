$(function() {

  // `rhizome.start` is the first function that should be called.
  // The function inside is executed once the client managed to connect.
  rhizome.start(function(err) {
    if (err) {
      $('body').html('client failed starting : ' + err)
      throw err
    }

    $('#send').submit(function(event) {
      event.preventDefault()
      var address = $('#address').val()
        , args = $('#args').val()
      if (args.length)
        args = args.split(' ').map(function(arg) { return JSON.parse(arg) })
      else args = []
      rhizome.send(address, args)
    })

    // We want to receive all the messages, so we subscribe to '/'
    rhizome.send('/sys/subscribe', ['/'])
  })


  rhizome.on('connected', function() {
    alert('connected!')
  })

  rhizome.on('connection lost', function() {
    alert('connection lost!')
  })

  rhizome.on('server full', function() {
    alert('server is full!')
  })

})
