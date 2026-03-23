package it.unibo.ctxcargoholdservice

import org.eclipse.californium.core.CoapServer
import it.unibo.hold.HoldStateResource

object CoapServerSetup {

    private val coapServer = CoapServer(5683)

    fun start() {
        coapServer.add(HoldStateResource)
        coapServer.start()
        println("[CoapServerSetup] CoAP server started on coap://localhost:5683/holdstate")
    }

    fun stop() = coapServer.stop()
}