%====================================================================================
% cargoservice description   
%====================================================================================
dispatch( msg1, msg1(X) ).
event( cargoevent, cargoevent(INFO) ).
event( sonardata, distance(D) ).
request( requesttoload, requesttoload(PID) ).
reply( replyrequesttoload, replyrequesttoload(X) ).  %%for requesttoload
request( productrequest, productrequest(PID) ).
reply( productreply, productreply(PESO) ).  %%for productrequest
reply( productreplyfailed, productreplyfailed(ARG) ).  %%for productrequest
request( getProduct, product(ID) ).
reply( getProductAnswer, product(JSonString) ).  %%for getProduct
request( holdrequest, holdrequest(PESO,PID) ).
reply( holdreply, holdreply(SLOT,PID) ).  %%for holdrequest
reply( holdreplyfailed, holdreplyfailed(ARG) ).  %%for holdrequest
request( moverobot, moverobot(TARGETX,TARGETY) ).
reply( moverobotdone, moverobotok(ARG) ).  %%for moverobot
reply( moverobotfailed, moverobotfailed(PLANDONE,PLANTODO) ).  %%for moverobot
request( moverobotinternal, moverobot(SLOT) ).
reply( moverobotdone, moverobotok(ARG) ).  %%for moverobotinternal
reply( moverobotfailed, moverobotfailed(PLANDONE,PLANTODO) ).  %%for moverobotinternal
request( engage, engage(OWNER,STEPTIME) ).
reply( engagedone, engagedone(ARG) ).  %%for engage
reply( engagerefused, engagerefused(ARG) ).  %%for engage
dispatch( disengage, disengage(ARG) ).
%====================================================================================
context(ctxcargoholdservice, "localhost",  "TCP", "8888").
context(ctxbasicrobot, "discoverable",  "TCP", "8020").
context(ctxcargoservice, "discoverable",  "TCP", "8111").
context(ctxusermock, "discoverable",  "TCP", "8887").
 qactor( productservice, ctxcargoservice, "external").
  qactor( basicrobot, ctxbasicrobot, "external").
  qactor( user, ctxusermock, "external").
  qactor( cargoservice, ctxcargoholdservice, "it.unibo.cargoservice.Cargoservice").
 static(cargoservice).
  qactor( productpolice, ctxcargoholdservice, "it.unibo.productpolice.Productpolice").
dynamic(productpolice). %%Oct2023 
  qactor( cargorobot, ctxcargoholdservice, "it.unibo.cargorobot.Cargorobot").
 static(cargorobot).
  qactor( hold, ctxcargoholdservice, "it.unibo.hold.Hold").
 static(hold).
