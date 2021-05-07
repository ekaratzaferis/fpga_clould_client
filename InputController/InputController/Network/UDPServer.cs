using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Sockets;
using System.Net;
using System.Net.NetworkInformation;

namespace InputController.Network
{
    /// <summary>
    /// Remarks: This class simulates a UDP Server. It uses UdpClient class to impent its methods.
    ///                 Methods:    1) send
    ///                             2) receive
    ///                             3) close
    ///                             + Constructors where user can choose the default port number.
    ///                             
    /// [Default Listening(!!!!) Port = 4567]
    /// 
    /// { IPEndPoint forms a connection point to a service. } 
    /// { IPHostEntry associates a Domain Name System (DNS) host name with an array of aliases and an 
    ///   array of matching IP addresses.}
    /// </summary>
    
    public class UDPServer
    {
        #region Private Variables
        private int _udpListeningPort = 4567;
        private IPEndPoint _IpEndPoint;
        private IPHostEntry _ipHostEntry; 
        private UdpClient _udpClient;
        private Socket _soundSocket;
        private Socket _screenSocket;
        private int _soundPackets = 0;
        private int _screenPackets = 0;
        private int _peripheralPackets = 0;
        #endregion

        #region Constructor
        public UDPServer(int port)
        {
            _udpListeningPort = port;
            _udpClient = new UdpClient(_udpListeningPort);
            _IpEndPoint = new IPEndPoint(IPAddress.Any, _udpListeningPort);
            _ipHostEntry = Dns.GetHostEntry(Dns.GetHostName());
            _soundSocket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
            _screenSocket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
        }
        #endregion

        #region Methods
        public int[] getStats()
        {
            int[] stats = new int[3];
            stats[0] = _peripheralPackets;
            stats[1] = _screenPackets;
            stats[2] = _soundPackets;
            _peripheralPackets = 0;
            _screenPackets = 0;
            _soundPackets = 0;
            return stats;
        }
        public void changeListeningPort(int newPort)
        {
            _udpListeningPort = newPort;
        }
        public void endPoint(String serverName, int port)
        {
            _IpEndPoint = new IPEndPoint(IPAddress.Parse(serverName), port);
            _screenSocket.Connect(_IpEndPoint);
        }
        public bool sendSound(Byte[] data)
        {
            try
            {
                _soundPackets++;
                _soundSocket.SendTo(data, _IpEndPoint);
                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
                return false;
            }
        }
        public bool sendScreen(Byte[] data)
        {
            try
            {
                _screenPackets++;
                _screenSocket.Send(data);
                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
                return false;
            }
        }
        public void close()
        {
            _udpClient.Close();
        }
        public Byte[] recieve()
        {
            Byte[] receiveBytes = _udpClient.Receive(ref _IpEndPoint);
            _peripheralPackets++;
            return receiveBytes;
        }
        public String LocalIP()
        {
            IPHostEntry host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            return null;
        }
        public String[] GlobalIP()
        {
            String[] list = new String[4];
            IPGlobalProperties ipProperties = IPGlobalProperties.GetIPGlobalProperties();
            Console.WriteLine(ipProperties.HostName);
            
            foreach (NetworkInterface networkCard in NetworkInterface.GetAllNetworkInterfaces())
            {
                foreach (GatewayIPAddressInformation gatewayAddr in networkCard.GetIPProperties().GatewayAddresses)
                {
                    list[0] = networkCard.Name;
                    list[1] = networkCard.Id;
                    list[2] = gatewayAddr.Address.ToString();
                    list[3] = networkCard.GetPhysicalAddress().ToString();
                    return list;
                }
            }
            return null;
        }
        #endregion

    }
}
