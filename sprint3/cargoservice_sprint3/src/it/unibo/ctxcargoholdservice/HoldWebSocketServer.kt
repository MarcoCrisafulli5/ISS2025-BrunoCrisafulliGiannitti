package it.unibo.ctxcargoholdservice

import org.java_websocket.WebSocket
import org.java_websocket.handshake.ClientHandshake
import org.java_websocket.server.WebSocketServer
import java.net.InetSocketAddress
import it.unibo.hold.HoldStateResource

class HoldWebSocketServer : WebSocketServer(InetSocketAddress(8096)) {

    override fun onOpen(conn: WebSocket, handshake: ClientHandshake) {
        conn.send(HoldStateResource.toJson())
        println("[WebSocket] client connesso: ${conn.remoteSocketAddress}")
    }

    override fun onClose(conn: WebSocket, code: Int, reason: String, remote: Boolean) {
        println("[WebSocket] client disconnesso: ${conn.remoteSocketAddress}")
    }

    override fun onMessage(conn: WebSocket, message: String) {}

    override fun onError(conn: WebSocket?, ex: Exception) {
        println("[WebSocket] errore: ${ex.message}")
    }

    override fun onStart() {
        println("[WebSocket] server avviato su ws://localhost:8096")
    }
}
