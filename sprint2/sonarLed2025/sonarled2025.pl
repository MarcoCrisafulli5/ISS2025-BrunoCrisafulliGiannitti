%====================================================================================
% sonarled2025 description   
%====================================================================================
mqttBroker("localhost", "1883", "sonardata").
event( sonardata, distance(D) ).
event( unibologprolog, unibologprolog(SOURCE,CATEG,CONTENT) ).
dispatch( doblink, doblink(X) ).
dispatch( ledOn, ledOn(X) ).
%====================================================================================
context(ctxsonarled2025, "localhost",  "TCP", "8128").
 qactor( mind, ctxsonarled2025, "it.unibo.mind.Mind").
 static(mind).
  qactor( sonardevice, ctxsonarled2025, "it.unibo.sonardevice.Sonardevice").
 static(sonardevice).
  qactor( sonarsimul, ctxsonarled2025, "it.unibo.sonarsimul.Sonarsimul").
 static(sonarsimul).
