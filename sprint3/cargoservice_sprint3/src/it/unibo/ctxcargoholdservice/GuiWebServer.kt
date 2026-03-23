package it.unibo.ctxcargoholdservice

import com.sun.net.httpserver.HttpServer
import java.net.InetSocketAddress
import it.unibo.hold.HoldStateResource


object GuiWebServer {

    private var server: HttpServer? = null
    private const val PORT = 8095

    fun start() {
        server = HttpServer.create(InetSocketAddress(PORT), 0)

        // Serve i file statici (hold.html)
        server!!.createContext("/") { exchange ->
            val path = exchange.requestURI.path.trimStart('/').ifEmpty { "hold.html" }
            val stream = GuiWebServer::class.java.classLoader
                .getResourceAsStream("static/$path")

            if (stream != null) {
                val bytes = stream.readBytes()
                val ct = when {
                    path.endsWith(".html") -> "text/html; charset=utf-8"
                    path.endsWith(".js")   -> "application/javascript"
                    path.endsWith(".css")  -> "text/css"
                    else                   -> "application/octet-stream"
                }
                exchange.responseHeaders.add("Content-Type", ct)
                exchange.responseHeaders.add("Access-Control-Allow-Origin", "*")
                exchange.sendResponseHeaders(200, bytes.size.toLong())
                exchange.responseBody.use { it.write(bytes) }
            } else {
                val msg = "404".toByteArray()
                exchange.sendResponseHeaders(404, msg.size.toLong())
                exchange.responseBody.use { it.write(msg) }
            }
        }


        server!!.executor = null
        server!!.start()
        println("[GuiWebServer] GUI disponibile su http://localhost:$PORT/hold.html")
    }

    fun stop() = server?.stop(0)
}