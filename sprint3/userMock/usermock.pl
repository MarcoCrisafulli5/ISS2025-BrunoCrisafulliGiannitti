%====================================================================================
% usermock description   
%====================================================================================
request( requesttoload, requesttoload(PID) ).
reply( replyrequesttoload, replyrequesttoload(X) ).  %%for requesttoload
%====================================================================================
context(ctxcargoholdservice, "localhost",  "TCP", "8888").
context(ctxusermock, "localhost",  "TCP", "8887").
 qactor( cargoservice, ctxcargoholdservice, "external").
  qactor( user, ctxusermock, "it.unibo.user.User").
 static(user).
