using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NAudio.Wave;
using NAudio.CoreAudioApi;
using InputController.DataTypes;
using InputController.Network;

namespace InputController.Devices
{
    /// <summary>
    /// Remarks: This class is responsible for recording the sound card output stream, converting it to packets and finally
    ///          adding them to a stack.
    ///          We're using the WasapiLoopbackCapture to record audio at 44.100KHz sample rate and 16bit data width.
    ///          
    ///          # The obeject is disposable.
    /// </summary>

    public class Speakers
    {

        #region Private Variables
        private WasapiLoopbackCapture _waveInStream;
        private WaveInProvider _waveTemp;
        private WaveFloatTo16Provider _waveIn16Stream;
        private int _maxPacketSize = 960;
        private UDPServer _soundServer;
        private Boolean _recording = false;
        #endregion

        #region Constructor
        public Speakers()
        {
            _recording = false;
            _soundServer = new UDPServer(0);
            _waveInStream = new WasapiLoopbackCapture();
            _waveTemp = new WaveInProvider(_waveInStream);
            _waveIn16Stream = new WaveFloatTo16Provider(_waveTemp);
            //Console.Out.WriteLine("Sample rate: " + _waveInStream.WaveFormat.SampleRate);
            /*Console.Out.WriteLine("\nEnconding: " + _waveInStream.WaveFormat.Encoding);
            Console.Out.WriteLine("Sample rate: " + _waveInStream.WaveFormat.SampleRate);
            Console.Out.WriteLine("Bits per sample: " + _waveInStream.WaveFormat.BitsPerSample);
            Console.Out.WriteLine("Channels: " + _waveInStream.WaveFormat.Channels);*/
        }
        #endregion

        #region Overloads
        unsafe void InputBufferToFileCallback(object sender, WaveInEventArgs e)
        {
            Byte[] temp = new Byte[e.BytesRecorded/2];
            try
            {
                _waveIn16Stream.Read(temp, 0, e.BytesRecorded / 2);
            }
            catch { }
            int sizeLimitCounter = 0;
            Byte[] buffer = new Byte[_maxPacketSize];

            // Cut sound packet to fit max UDP size.
            for (int i = 0; i < e.BytesRecorded / 2; i++)
            {
                buffer[sizeLimitCounter] = temp[i];
                sizeLimitCounter++;
                if (sizeLimitCounter == _maxPacketSize) // Send packet when reach max size.
                {
                    sizeLimitCounter = 0;
                    initiatePacket(buffer);
                }
            }
        }
        #endregion

        #region Methods
        public int[] getStats()
        {
            return _soundServer.getStats();
        }
        public void Volume(float volume)
        {
            _waveIn16Stream.Volume = volume;
        }
        private void initiatePacket(Byte[] buffer)
        {
            if(_recording) _soundServer.sendSound(buffer);
        }
        public void start(String address, int port)
        {
            _recording = true;
            _soundServer.endPoint(address, port);
            _waveInStream.DataAvailable += InputBufferToFileCallback;
            _waveInStream.StartRecording();
        }
        public void restart()
        {
            _recording = true;
        }
        public void pause()
        {
            _recording = false;
        }
        public void stop()
        {
            _waveInStream.StopRecording();
        }
        public void shutDown()
        {
            _waveInStream.StopRecording();
            _waveIn16Stream = null;
            _waveTemp = null;
            _waveInStream.Dispose();
            _waveInStream = null;
        }
        #endregion
    }
}