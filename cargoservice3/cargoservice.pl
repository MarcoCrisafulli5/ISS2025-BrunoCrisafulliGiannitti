%====================================================================================
% cargoservice description   
%====================================================================================
dispatch( msg1, msg1(X) ).
event( cargoevent, cargoevent(INFO) ).
event( sonardata, distance(D) ).
request( isonline, isonline(X) ).
reply( onlinereply, onlinereply(ARG,STATE) ).  %%for isonline
request( requesttoload, requesttoload(PID) ).
reply( replyrequesttoload, replyrequesttoload(X) ).  %%for requesttoload
request( getProduct, product(ID) ).
reply( getProductAnswer, product(JSonString) ).  %%for getProduct
request( holdrequest, holdrequest(PESO,PID) ).
reply( holdreply, holdreply(SLOT,PID) ).  %%for holdrequest
reply( holdreplyfailed, holdreplyfailed(ARG) ).  %%for holdrequest
request( moverobot, moverobot(TARGETX,TARGETY) ).
reply( moverobotdone, moverobotok(ARG) ).  %%for moverobot
reply( moverobotfailed, moverobotfailed(PLANDONE,PLANTODO) ).  %%for moverobot
%====================================================================================
context(ctxusermock, "localhost",  "TCP", "8999").
context(ctxcargoholdservice, "localhost",  "TCP", "8888").
context(ctxsonarled2025, "localhost",  "TCP", "8128").
context(ctxbasicrobot, "localhost",  "TCP", "8020").
context(ctxcargoservice, "localhost",  "TCP", "8111").
 qactor( productservice, ctxcargoservice, "external").
  qactor( cargorobot, ctxbasicrobot, "external").
  qactor( sonardevice, ctxsonarled2025, "external").
  qactor( user, ctxusermock, "external").
  qactor( cargoservice, ctxcargoholdservice, "it.unibo.cargoservice.Cargoservice").
 static(cargoservice).
  qactor( hold, ctxcargoholdservice, "it.unibo.hold.Hold").
 static(hold).
