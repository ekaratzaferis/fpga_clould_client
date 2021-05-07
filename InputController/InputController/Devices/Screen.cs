using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InputController.DataTypes;
using System.Drawing;
using System.Drawing.Imaging;
using InputController.Controllers;
using System.Threading;
using System.IO;
using System.Windows.Forms;
using SlimDX.Direct3D9;
using SlimDX;
using InputController.Network;

namespace InputController.Devices
{
    public class ScreenDev
    {
        #region Private Variables
        private UDPServer _screenServer;
        private DxScreenCapture _sc;
        private Screenshot _scGDI;
        private byte[] _screen;
        private Boolean _stream = false;
        private Boolean _type = true;
        private int _frames = 0;
        #endregion

        #region Constructor
        public ScreenDev()
        {
            // 1024px * 768px * 3Bytes
            _screen = new byte[2359296];
            _sc = new DxScreenCapture();
            _scGDI = new Screenshot();
            _screenServer = new UDPServer(0);
        }
        #endregion

        #region Methods
        public int[] getStats()
        {
            int[] temp = new int[4];
            int[] temp2 = new int[3];
            temp2 = _screenServer.getStats();
            for (int i = 0; i < 3; i++) temp[i] = temp2[i];
            temp[3] = _frames;
            _frames = 0;
            return temp;
        }
        public void restart()
        {
            _stream = true;
        }
        public void stop()
        {
            _stream = false;
        }
        public void initiateScreen()
        {
            int count = 0;
            int s_count = 0;
            byte[] buf = new byte[4];
            Surface s = _sc.CaptureScreen();
            DataRectangle dr = s.LockRectangle(LockFlags.None);
            DataStream data = dr.Data;

            for (int y = 0; y < 768; y++)
            {
                for (int x = 0; x < 1024; x++)
                {
                    data.Position = count;
                    data.Read(buf, 0, 4);
                    _screen[s_count] = buf[0]; //B
                    _screen[s_count + 1] = buf[1]; //G
                    _screen[s_count + 2] = buf[2]; //R
                    count = count + 4;
                    s_count = s_count + 3;
                }
            }
            //saveBMP(dr.Data);
            s.UnlockRectangle();
            s.Dispose();
        }
        public void start(String address, int port)
        {
            _screenServer.endPoint(address, port);
            if (_type) initiateScreen();
            else initiateScreenGDI();
            sendBaseScreen();
            _stream = true;
            stream();
        }
        public void StreamType(Boolean type) 
        { 
            _type = type;
            initiateScreenGDI();
        }
        private void stream()
        {
            Surface s = null;
            DataRectangle dr = null;
            Bitmap screen = null;
            while (true)
            {
                if (_type)
                {
                    s = _sc.CaptureScreen();
                    dr = s.LockRectangle(LockFlags.None);
                    if(_stream) compareData(dr.Data);
                    s.UnlockRectangle();
                    s.Dispose();
                }
                else
                {
                    screen = _scGDI.CaptureScreen();
                    if (_stream) compareDataGDI(screen);
                }
                _frames++;
            }
        }
        private void saveBMP()
        {
            Bitmap asd = new Bitmap(1024, 768, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
            int r = 0;
            int g = 0;
            int b = 0;
            int count = 0;
            for (int y = 0; y < 768; y++)
            {
                for (int x = 0; x < 1024; x++)
                {
                    b = _screen[count];
                    g = _screen[count+1];
                    r = _screen[count+2];
                    asd.SetPixel(x, y, Color.FromArgb(r,g,b));
                    count = count + 3;
                }
            }
            asd.Save("C:\\Users\\Alexandros\\Desktop\\poutana.bmp");
        }
        private void sendBaseScreen()
        {
            byte[] add = new byte[4];
            byte[] packet = new byte[100];
            int counter = 0;
            int a_counter = 0;
            while (counter < _screen.Length)
            {
                add = BitConverter.GetBytes(a_counter);
                for (int i = 0; i < 96; i++)
                {
                    if (i < 4) packet[i] = add[3-i];
                    packet[i + 4] = _screen[counter + i];
                }
                sendPacket(packet);
                counter = counter + 96;
                a_counter = a_counter + 16;
            }
        }
        private void sendPacket(byte[] packet)
        {
            _screenServer.sendScreen(packet);
        }
        private void compareData(DataStream data)
        {
            byte[] add = new byte[4];
            byte[] packet = new byte[100];
            byte[] buffer = new byte[128];
            int counter = 0;
            int s_counter = 0;
            int f1_counter = 0;
            int f2_counter = 0;
            int a_counter = 0;
            Boolean change = false;
            while(s_counter < _screen.Length)
            {
                data.Position = counter;
                data.Read(buffer, 0, 128);
                f1_counter = s_counter;
                f2_counter = 0;
                change = false;
                for (int i = 0; i < 32; i++)
                {
                    if ((buffer[f2_counter] != _screen[f1_counter]))
                    {
                        _screen[f1_counter] = buffer[f2_counter];
                        change = true;
                    }
                    if ((buffer[f2_counter + 1] != _screen[f1_counter + 1]))
                    {
                        _screen[f1_counter + 1] = buffer[f2_counter + 1];
                        change = true;
                    }
                    if ((buffer[f2_counter + 2] != _screen[f1_counter + 2]))
                    {
                        _screen[f1_counter + 2] = buffer[f2_counter + 2];
                        change = true;
                    }
                    f1_counter = f1_counter + 3;
                    f2_counter = f2_counter + 4;
                }
                if (change)
                {
                    add = BitConverter.GetBytes(a_counter);
                    for(int i = 0; i < 96; i++)
                    {
                        if (i < 4) packet[i] = add[3-i];
                        packet[i + 4] = _screen[s_counter + i];
                    }
                    sendPacket(packet);
                }
                counter = counter + 128; //32px * 4Bytes per px
                s_counter = s_counter + 96; //32px * 3Bytes per px
                a_counter = a_counter + 16; //address
            }
        }
        public void shutDown() 
        {
            _sc.close();
            _screenServer.close();
        }
        #endregion

        #region Methods GDI
        private void initiateScreenGDI()
        {
            int counter = 0;
            Bitmap screen = _scGDI.CaptureScreen();
            BitmapData temp = screen.LockBits(new Rectangle(0, 0, screen.Width, screen.Height), System.Drawing.Imaging.ImageLockMode.ReadWrite, screen.PixelFormat);
            unsafe
            {
                if ((temp.Width > 1024) | (temp.Height > 768)) Console.Out.WriteLine("error");
                else
                {
                    for (int y = 0; y < temp.Height; y++)
                    {
                        byte* row = (byte*)temp.Scan0 + (y * temp.Stride);

                        for (int x = 0; x < temp.Width; x++)
                        {
                            _screen[counter] = row[x * 3]; //B
                            _screen[counter + 1] = row[x * 3 + 1]; //G
                            _screen[counter + 2] = row[x * 3 + 2]; //R
                            counter = counter + 3;
                        }
                    }
                }
            }
            screen.UnlockBits(temp);
            //saveBMP();
        }
        public void compareDataGDI(Bitmap data)
        {
            byte[] packet = new byte[100];
            byte[] add = new byte[4];
            int counter = 0;
            int a_counter = 0;
            int p_counter = 0;
            Boolean change = false;

            BitmapData temp = data.LockBits(new Rectangle(0, 0, data.Width, data.Height), System.Drawing.Imaging.ImageLockMode.ReadWrite, data.PixelFormat);
            unsafe
            {
                if ((data.Width > 1024) | (data.Height > 768)) Console.Out.WriteLine("error");
                else
                {
                    for (int y = 0; y < data.Height; y++)
                    {
                        byte* row = (byte*)temp.Scan0 + (y * temp.Stride);

                        for (int x = 0; x < temp.Width; x++)
                        {
                            if (row[x * 3] != _screen[counter])
                            {
                                _screen[counter] = row[x * 3];
                                change = true;
                            }
                            if (row[x * 3 + 1] != _screen[counter + 1])
                            {
                                _screen[counter + 1] = row[x * 3 + 1];
                                change = true;
                            }
                            if (row[x * 3 + 2] != _screen[counter + 1])
                            {
                                _screen[counter] = row[x * 3 + 2];
                                change = true;
                            }
                            packet[p_counter * 3 + 4] = _screen[counter];
                            packet[p_counter * 3 + 5] = _screen[counter + 1];
                            packet[p_counter * 3 + 6] = _screen[counter + 2];
                            p_counter++;
                            if (p_counter == 32)
                            {
                                p_counter = 0;
                                if (change)
                                {
                                    change = false;
                                    add = BitConverter.GetBytes(a_counter);
                                    for (int i = 0; i < 3; i++) packet[i] = add[3 - i];
                                    sendPacket(packet);
                                }
                                a_counter = a_counter + 16;
                            }
                            counter = counter + 3;
                        }
                    }
                }
            }
            data.UnlockBits(temp);
        }
        #endregion

    }
}
