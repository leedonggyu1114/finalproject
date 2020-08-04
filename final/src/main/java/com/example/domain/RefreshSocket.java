package com.example.domain;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class RefreshSocket extends TextWebSocketHandler{

    Set<WebSocketSession> clients=new HashSet<WebSocketSession>();
    @Override 
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { 
        
        super.afterConnectionClosed(session, status); 
       // session.close();
        System.out.println("closed" +" | "+ session +" | "+ status); 
    }
    @Override 
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception { 
        super.handleMessage(session, message); 
        String strMessage = (String)message.getPayload(); 
        System.out.println(strMessage); 
        for(WebSocketSession client:clients){ 
            if(!client.equals(session)){ 
                client.sendMessage(new TextMessage(strMessage)); 
            } 
        } 
    }
    @Override 
    public void afterConnectionEstablished(WebSocketSession session) throws Exception { 
        super.afterConnectionEstablished(session); 
        clients.add(session); 
        System.out.println("connect"+session); 
    }
	
	
}
