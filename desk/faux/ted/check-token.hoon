/-  spider
/-  *resource
/+  *strandio
/+  faux-discord
/+  server
=,  strand=strand:spider
=,  strand-fail=strand-fail:libstrand:spider
  ^-  thread:spider
  |=  arg=vase
  =/  m  (strand ,vase)
  =+  !<  [~ bot-token=tape]  arg
  =/  =request:http
    :*  %'GET'
        (crip check-token-url:faux-discord)
        (headers:faux-discord bot-token)
        ~
    ==
  ~&  >  request
  ;<  ~  bind:m  (send-request request)
  ;<  =client-response:iris  bind:m  take-client-response
  ?>  ?=(%finished -.client-response)
  ~&  client-response
  =/  raw-body
    ?~  full-file.client-response  !!
    q.data.u.full-file.client-response
  =/  json-body  (need (de-json:html raw-body))
  ::  TODO messages are out of order
  (pure:m !>(json-body))
