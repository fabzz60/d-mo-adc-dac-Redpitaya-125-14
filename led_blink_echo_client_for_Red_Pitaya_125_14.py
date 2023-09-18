# -*- coding: utf-8 -*-
import tkinter         # import de tkinter
import socket
import time
#import sys


HOST = "169.254.17.45"  # Standard loopback interface address (localhost)
PORT = 7  # Port to listen on (non-privileged ports are > 1023)

print('Create a socket on the host PC client.')
lwIP_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

print('Connect to the socket of the lwIP server listening on the SP701.')
lwIP_server_address = (HOST, PORT)
lwIP_socket.connect(lwIP_server_address)

def echo_packet(lwIP_socket, message):
    message_byte = message.encode()

    lwIP_socket.sendall(message_byte)

    bytes_buffer_size = 32
    bytes_received = 0
    bytes_total = len(message)

    while bytes_received < bytes_total:
        message_recvd = lwIP_socket.recv(bytes_buffer_size)
        bytes_received += len(message_recvd)
        print(message_recvd)

try:
  
  while True:
            message = 'LED0 on'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
                
            message = 'LED1 on'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
                            
            message = 'LED2 on'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
            
            message = 'LED3 on'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
            
            message = 'LED0 off'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
                    
            message = 'LED1 off'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
            
            message = 'LED2 off'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
           
            message = 'LED3 off'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
            
            message = 'All LEDs on'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
            
            message = 'All LEDs off'
            echo_packet(lwIP_socket, message)
            time.sleep(1)
           
            
finally: 
    print('Closing the socket from the host PC client side...')
    lwIP_socket.close()

#         message = 'LED4 on'
#         echo_packet(lwIP_socket, message)
#         time.sleep(0.5)
#         
#         message = 'LED4 off'
#         echo_packet(lwIP_socket, message)
#         time.sleep(0.5)
#         
#         message = 'LED5 on'
#         echo_packet(lwIP_socket, message)
#         time.sleep(0.5)
#         
#         message = 'LED5 off'
#         echo_packet(lwIP_socket, message)
#         time.sleep(0.5)
        
   

