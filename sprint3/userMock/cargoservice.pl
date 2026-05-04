%====================================================================================
% cargoservice description   
%====================================================================================
request( requesttoload, requesttoload(PID) ).
reply( replyrequesttoload, replyrequesttoload(X) ).  %%for requesttoload
%====================================================================================
context(ctxusermock, "localhost",  "TCP", "8887").
context(ctxcargoholdservice, "discoverable",  "TCP", "8888").
 qactor( cargoservice, ctxcargoholdservice, "external").
  qactor( user, ctxusermock, "it.unibo.user.User").
 static(user).
