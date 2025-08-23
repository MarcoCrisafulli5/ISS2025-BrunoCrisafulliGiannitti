%====================================================================================
% cargoservice description   
%====================================================================================
dispatch( msg1, msg1(X) ).
dispatch( msg2, msg2(X) ).
event( cargoevent, cargoevent(INFO) ).
%====================================================================================
context(ctxcargoholdservice, "localhost",  "TCP", "8888").
context(ctxsonarservice, "localhost",  "TCP", "8889").
context(ctxbasicrobot, "localhost",  "TCP", "8020").
context(ctxcargoservice, "localhost",  "TCP", "8111").
 qactor( productservice, ctxcargoservice, "external").
  qactor( cargorobot, ctxbasicrobot, "external").
  qactor( sonar, ctxsonarservice, "external").
  qactor( cargo1, ctxcargoholdservice, "it.unibo.cargo1.Cargo1").
 static(cargo1).
  qactor( cargohold, ctxcargoholdservice, "it.unibo.cargohold.Cargohold").
 static(cargohold).
