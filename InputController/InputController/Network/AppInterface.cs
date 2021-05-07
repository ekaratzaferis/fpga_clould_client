using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using InputController.DataTypes;
using InputController.Decomposers;
using InputController.Devices;
using InputController.Controllers;

namespace InputController.Network
{
    /// <summary>
    /// Remarks: This class implements the app's network interface. It uses it's own thread so the workload of
    ///          port-polling won't slow down the entire app.
    ///          
    ///          Uses a UDPServer instance to send and receive packets to the connected device.
    ///          
    ///          Needs access to the action stacks of the app in order to push incoming actions.
    ///          Synchronization is provided by the stack class, so pop operation from another class
    ///          wont intefere with push operation of this class.
    ///          
    ///          Provided Methods: - Start and Shutdown netowork.
    ///                            - Send message to the connected client.
    ///                            - Change listening port.
    ///                            
    ///          All other methods are automatically used by the interface to establish a valid connection with a
    ///          client and receive actions.
    ///          
    ///          !! Hardware Client will be sending one keyboard character max. We make sure to create a keyboard
    ///          action with second and third keycode = 0 (which doesn't correlate to any key). !!
    /// </summary>

    public class AppInterface
    {
        #region Threads
        Thread _actionServerThread;
        Thread _pollingThread;
        Thread _screenThread;
        Thread _soundThread;
        Thread _connectionThread;
        #endregion

        #region Private Variables
        private ActionQueues _actionStacks;
        private ActionDispatcher _actionDispatcher;
        private Speakers _speakers;
        private ScreenDev _screen;
        private UDPServer _ActionServer;
        private int _udbListeningPort;
        private String _clientAddress;
        private int _clientPort;
        private Decomposer _packetDecomposer;
        private String _username;
        private Boolean _ipReady = false;
        private Boolean _connect = false;
        private Boolean _success = false;
        private Boolean _screenWorking = false;
        private Boolean _soundWorking = false;
        private Boolean _mouseWorking = false;
        private Boolean _keyboardWorking = false;
        #endregion

        #region GUI Methods
        public Boolean Connecting()
        {
            return _connect;
        }
        public Boolean Success()
        {
            return _success;
        }
        public String GetLocalIP()
        {
            while(true) if (_ipReady) return _ActionServer.LocalIP();
        }
        public void UpdateInfo(String username, String address, int port)
        {
            if(username != null) _username = username;
            if(address != null) _clientAddress = address;
            if(port > 0) _clientPort = port;
        }
        public void StartStream()
        {
            if (_connect) return;
            _connect = true;
            _connectionThread.Start();
        }
        public void Dispose()
        {
            _connect = false;
            _success = false;
            _pollingThread.Abort();
            _actionServerThread.Abort();
            _screenThread.Abort();
            _soundThread.Abort();
            _connectionThread.Abort();
            _speakers.shutDown();
            _screen.shutDown();
            _actionDispatcher.stopExecution();
            _ActionServer.close();
        }
        public void StartScreen()
        {
            if (_screenWorking) return;
            else if (_success)
            {
                _screenWorking = true;
                _screen.restart();
            }
        }
        public void StopScreen()
        {
            _screenWorking = false;
            _screen.stop();
        }
        public void changeScreen(Boolean type)
        {
            _screen.StreamType(type);
        }
        public void StartSound()
        {
            if (_soundWorking) return;
            else if (_success)
            {
                _soundWorking = true;
                _speakers.restart();
            }
        }
        public void StopSound()
        {
            _soundWorking = false;
            _speakers.pause();
        }
        public void alterSpeakerVolume(float volume)
        {
            _speakers.Volume(volume);
        }
        public void StartPeripheral(int type)
        {
            if (type == 0) _mouseWorking = true;
            else if (type == 1) _keyboardWorking = true;
        }
        public void StopPeripheral(int type)
        {
            if (type == 0) _mouseWorking = false;
            else if (type == 1) _keyboardWorking = false;
        }
        public int[] GetStats()
        {
            int[] stats = new int[4];
            int[] temp = new int[4];
            if (_ipReady)
            {
                temp = _ActionServer.getStats();
                stats[0] = temp[0];
            }
            else stats[0] = 0;
            if (_screenWorking)
            {
                temp = _screen.getStats();
                stats[1] = temp[1];
                stats[3] = temp[3];
            }
            else stats[1] = 0;
            if (_soundWorking)
            {
                temp = _speakers.getStats();
                stats[2] = temp[2];
            }
            else stats[2] = 0;
            return stats;
        }
        #endregion

        #region Constructors
        public AppInterface(int port)
        {
            _speakers = new Speakers();
            _screen = new ScreenDev();
            _actionStacks = new ActionQueues();

            _actionDispatcher = new ActionDispatcher(_actionStacks);
            _packetDecomposer = new Decomposer();

            _actionServerThread = new Thread(() => actionServer(port));
            _pollingThread = new Thread(() => PollPort());
            _screenThread = new Thread(() => _screen.start(_clientAddress, _clientPort + 1));
            _soundThread = new Thread(() => _speakers.start(_clientAddress, _clientPort));
            _connectionThread = new Thread(() => EstablishConnection());
        }
        #endregion

        #region Thread Constructors
        private void actionServer(int port)
        {
            _udbListeningPort = port;
            _ActionServer = new UDPServer(_udbListeningPort);
            _ipReady = true;
        }
        #endregion

        #region Methods
        public void NetworkStart()
        {
            _actionServerThread.Start();
        }
        public void NetworkShutDown()
        {
            _ActionServer.close();
            _actionServerThread.Abort();
            _actionDispatcher.stopExecution();
            _speakers.shutDown();
            _screen.shutDown(); //shutdownGDI
        }
        public void ChangeNetworkListeningPort(int port)
        {
            _udbListeningPort = port;
            _ActionServer.changeListeningPort(_udbListeningPort);
        }
        private void EstablishConnection() //needs confirmation
        {
            Byte[] data = null;
            String[] tokens = null;
            while (_connect)
            {
                try
                {
                    data = _ActionServer.recieve();
                }
                catch
                {
                    //Console.Out.WriteLine("Network error!!\n");
                }
                String temp = Encoding.ASCII.GetString(data);
                tokens = temp.Split('_');
                if (tokens[0].Equals("karajizzferis"))
                {
                    _clientAddress = tokens[1];
                    _clientPort = int.Parse(tokens[2]);
                    _success = true;
                    break;
                }                
            }
            if(_success) initiateDevices();
        }
        public void initiateDevices()
        {
            _mouseWorking = true;
            _keyboardWorking = true;
            _pollingThread.Start();
            _screenWorking = true;
            _screenThread.Start();
            _soundWorking = true;
            _soundThread.Start();
        }
        private void PollPort()
        {
            _actionDispatcher.startExecution();
            while (true)
            {
                Byte[] data = Encoding.UTF7.GetBytes("");
                try
                {
                    data = _ActionServer.recieve();
                }
                catch
                {
                    Console.Out.WriteLine("Network error.\n");
                }
                PacketDecode(data);
            }
        }
        private void PacketDecode(Byte[] data)
        {
            String temp = Encoding.ASCII.GetString(data);
            String[] packet = temp.Split('_');

            if (packet[0].Equals("mouse"))
            {
                if(_mouseWorking) _actionStacks.addMouseAction(DataPacketToMouseAction(data));
            }
            else if (packet[0].Equals("keyboard"))
            {
                if(_keyboardWorking) _actionStacks.addKeyboardAction(DataPacketToKeyboardAction(data));
            }
            else if (packet[0].Equals("message"))
            {
                Console.Out.Write("Message:");
                Console.Out.Write(packet[1]+"/n");
            }
        }
        #endregion

        #region Methods (Decomposers)
        private MouseAction DataPacketToMouseAction(Byte[] packet)
        {
            ClickType type = _packetDecomposer.fetchClickType(packet);
            return new MouseAction(_packetDecomposer.fetchXPosition(packet), _packetDecomposer.fetchYPosition(packet), type);
        }
        private KeyboardAction DataPacketToKeyboardAction(Byte[] packet)
        {
            KeyHit type = _packetDecomposer.fetchKeyHit(packet);
            return new KeyboardAction(_packetDecomposer.fetchKey(packet), 0, 0, type);
        }
        #endregion
    }
}
