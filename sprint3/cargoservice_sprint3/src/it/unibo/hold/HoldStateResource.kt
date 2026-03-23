package it.unibo.hold

import org.eclipse.californium.core.CoapResource
import org.eclipse.californium.core.server.resources.CoapExchange
import org.eclipse.californium.core.coap.CoAP
import org.json.JSONArray
import org.json.JSONObject
import it.unibo.ctxcargoholdservice.WsServer


object HoldStateResource : CoapResource("holdstate") {

    data class Slot(val id: Int, var occupied: Boolean, var pid: Int, var weight: Int)

    private val slots = Array(4) { i -> Slot(i, false, 0, 0) }

    init {
        isObservable = true  // abilita RFC 7641 observe
    }

    override fun handleGET(exchange: CoapExchange) {
        exchange.respond(CoAP.ResponseCode.CONTENT, toJson())
    }

    fun updateSlot(idx: Int, occupied: Boolean, pid: Int = 0, weight: Int = 0) {
        slots[idx].occupied = occupied
        slots[idx].pid = pid
        slots[idx].weight = weight
        changed()  // notifica push a tutti gli observer
		WsServer.broadcast(toJson())    
		}

    fun toJson(): String {
        val arr = JSONArray()
        slots.forEach { s ->
            arr.put(JSONObject()
                .put("id", s.id)
                .put("occupied", s.occupied)
                .put("pid", s.pid)
                .put("weight", s.weight))
        }
        return arr.toString()
    }
}