package it.unibo.ctxcargoholdservice

import it.unibo.ctxcargoholdservice.HoldWebSocketServer
import java.net.InetSocketAddress

object WsServer {
    private var instance: HoldWebSocketServer? = null

    fun start() {
        instance = HoldWebSocketServer()
        instance!!.start()
    }

    fun broadcast(json: String) {
        instance?.broadcast(json)
    }

    fun stop() = instance?.stop()
}