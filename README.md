# fpga_clould_client
Remote cloud control using a thin FPGA client

FPGA Project
- Captures all user-generated events (mouse, keyboard) and sends them to the client (through the ethernet port) to be simulated
- Recieves an audio/video stream through the ethernet port, buffers to RAM, and finally outputs them to the connected speakers/DVI screen

C# Project
- Simulates incoming events (mouse movements, keyboard strokes) to the server OS
- Captures and streams audio and screen from the server to the client (FPGA), throught an ethernet connection

The combinations of these two projects, allows an FPGA to be used as a thin client that remotely controls a server that's running the C# project. Resembles common screen sharing/remote desktop programs, but with the niche that the client does not have be a functional computer, but a cheap, low energy consumption FPGA.

|Entity|Purpose|
|---|---|
|USER|Remotely controls the server using the common PC peripherals (mouse, keyboard, screen, audio)|
|FPGA CLIENT|Captures user events & displays video stream from the server|
|ETHERNET|Handles the communication between the FPGA and the C# App|
|C# APP|Captures the server's audio and screen streams & simulates incoming user events|
|SERVER|A PC in the cloud that's able to execute the C# APP, thus remotely controlled by the user|
