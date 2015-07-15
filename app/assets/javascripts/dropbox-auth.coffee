window.App ||= {}

class App.DropboxAuth
  constructor: ->
    xhr = new XMLHttpRequest()
    xhr.open('POST', '/users')
    data = new FormData()
    data.append('dropbox_token', @getQueryParam('#access_token'))
    data.append('dropbox_uid', @getQueryParam('uid'))
    xhr.send(data)

  getQueryParam: (paramKey) ->
    params = window.location.hash
      .split('&')
      .map((item, index, collection) -> item.split('='))
      .reduce((reduced, item, index, collection) ->
        reduced[item[0]] = item[1]
        reduced
      , {})[paramKey]
