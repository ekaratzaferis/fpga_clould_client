using InputController.Network;
using MetroFramework.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace InputController
{
    /// <summary>
    /// This class draws the GUI for our app. Every call to our console app happens through this class.
    /// 
    /// Optical Mods region includes only visual effects and not any calls to our console app.
    /// </summary>
    
    public partial class GUI : MetroForm
    {

        #region Variables
        private AppInterface _app;
        private Boolean _started = false;
        private Boolean _running = true;
        private Boolean _draw = false;
        delegate void SetLocalIPCallback();
        delegate void CheckStatusCallback();
        delegate void DrawStatsCallback();
        System.IO.StreamWriter file;
        #endregion

        #region Delegate Methods
        private void CheckStatus()
        {
            if (metroTile2.InvokeRequired)
            {
                CheckStatusCallback d = new CheckStatusCallback(CheckStatus);
                try { this.Invoke(d, new object[] { }); }
                catch { }
            }
            else if(_running)
            {
                if (_app.Success())
                {
                    metroTile2.Style = MetroFramework.MetroColorStyle.Green;
                    metroTile2.Text = "Streaming";
                    metroProgressSpinner1.Style = MetroFramework.MetroColorStyle.Green;
                    metroProgressSpinner1.Show();

                    metroTile4.Style = MetroFramework.MetroColorStyle.Red;
                    metroTile4.Text = "Stop";
                    metroTile4.Show();
                }
                else if (_app.Connecting())
                {
                    metroTile2.Style = MetroFramework.MetroColorStyle.Orange;
                    metroTile2.Text = "Establishing Connection";
                    metroProgressSpinner1.Style = MetroFramework.MetroColorStyle.Orange;
                    metroProgressSpinner1.Show();

                    metroTile4.Style = MetroFramework.MetroColorStyle.Red;
                    metroTile4.Text = "Stop";
                    metroTile4.Show();
                }
                else
                {
                    metroTile2.Style = MetroFramework.MetroColorStyle.Blue;
                    metroTile2.Text = "Start Streaming";
                    metroProgressSpinner1.Hide();

                    metroTile4.Hide();
                }
            }
        }
        private void SetLocalIP()
        {
            if (metroLabel6.InvokeRequired)
            {
                SetLocalIPCallback d = new SetLocalIPCallback(SetLocalIP);
                this.Invoke(d, new object[] { });
            }
            else
            {
                metroLabel6.Text = _app.GetLocalIP();
            }
        }
        private void DrawStats()
        {
            double average = 0;
            int[] stats = _app.GetStats();

            if (metroLabel38.InvokeRequired)
            {
                DrawStatsCallback d = new DrawStatsCallback(DrawStats);
                try { this.Invoke(d, new object[] { }); }
                catch { }
            }
            else
            {
                //Screen Packets
                metroLabel38.Text = stats[1].ToString();

                //Screen Bitrate
                average = (((double)stats[1]) * 100) / (1024);
                metroLabel39.Text = average.ToString("0.00");

                //Screen FPS
                metroLabel40.Text = stats[3].ToString();

                //Sound Packets
                metroLabel41.Text = stats[2].ToString(); ;

                //Sound Bitrate
                average = (((double)stats[2]) * 960) / (1024);
                metroLabel42.Text = average.ToString("0.00");

                //Ethernet Packets
                int i = stats[1] + stats[2] + stats[0];
                metroLabel44.Text = i.ToString();

                //Ethernet Bitrate
                average = ((((double)stats[1]) * 100) + (((double)stats[2]) * 960) + (((double)stats[0]) * 24)) /(1024);
                metroLabel45.Text = average.ToString("0.00");

                //Peripheral Packets
                metroLabel46.Text = stats[0].ToString();

                //Peripheral Bitrate
                average = (((double)stats[0]) * 24) / (1024);
                metroLabel47.Text = average.ToString("0.00");
            }
        }
        #endregion

        public GUI()
        {
            InitializeComponent();
        }

        protected override void OnFormClosing(FormClosingEventArgs e)
        {
            _running = false;
            file.Close();
            backgroundWorker2.Dispose();
            if(_started) _app.Dispose();
            base.OnFormClosing(e);
            if (e.CloseReason == CloseReason.WindowsShutDown) return;
        }

        #region ProgressBar / Initiation
        //Launch Progress Bar
        private void metroTile3_Click(object sender, EventArgs e)
        {
            metroLabel3.Hide();
            metroTile3.Hide();

            metroLabel4.Show();
            metroProgressBar1.Show();
            metroProgressBar1.Style = MetroFramework.MetroColorStyle.Purple;
            metroProgressBar1.Maximum = 1000;
            metroProgressBar1.Value = 0;
            metroProgressBar1.Step = 1;
            backgroundWorker1.RunWorkerAsync();
        }
        //Initiate the app while launching
        private void backgroundWorker1_DoWork_1(object sender, DoWorkEventArgs e)
        {
            for (int i = 1; i <= 1000; i++)
            {
                // Wait 100 milliseconds.
                if ((i<350)|(i>700))System.Threading.Thread.Sleep(1);
                // Report progress.
                backgroundWorker1.ReportProgress(i);
                if (i == 899) _started = true;
                if (i == 900) _app = new AppInterface(4568);
                if (i == 901) _app.NetworkStart();
                if (i == 902) SetLocalIP();
                if (i == 903) backgroundWorker2.RunWorkerAsync();
                if (i == 904) _draw = true;
                if (i == 905) file = new System.IO.StreamWriter(@"C:\Users\Alexandros\Desktop\stats.txt", true);
            }
        }
        //Report progress
        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            // Change the value of the ProgressBar to the BackgroundWorker progress.
            metroProgressBar1.Value = e.ProgressPercentage;
        }
        //Hide starting screen
        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            metroProgressBar1.Hide();
            metroLabel4.Hide();
            metroTabControl1.Show();
        }
        #endregion

        #region Optical Mods
        private void metroTile3_Mouse_Enter(object sender, EventArgs e)
        {
            metroTile3.Style = MetroFramework.MetroColorStyle.Green;
        }
        private void metroTile3_Mouse_Leave(object sender, EventArgs e)
        {
            metroTile3.Style = MetroFramework.MetroColorStyle.Teal;
        }
        private void metroTile5_MouseEnter(object sender, EventArgs e)
        {
            metroTile5.Style = MetroFramework.MetroColorStyle.Lime;
        }
        private void metroTile5_MouseLeave(object sender, EventArgs e)
        {
            metroTile5.Text = "Save Changes";
            metroTile5.Style = MetroFramework.MetroColorStyle.Green;
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            if (_draw) DrawStats();
        }
        private void timer2_Tick(object sender, EventArgs e)
        {
            if (_draw)
            {
                file.Write(metroLabel38.Text+"_");
                file.Write(metroLabel41.Text+"_");
                file.Write(metroLabel46.Text+"_");
                file.WriteLine("\n");
            }
        }
        #endregion

        #region General Setting

        //Update Button Color/Text
        private void backgroundWorker2_DoWork(object sender, DoWorkEventArgs e)
        {
            backgroundWorker2.WorkerSupportsCancellation = true;
            while (true) CheckStatus();
        }
        
        //Start Stream Button
        private void metroTile2_Click(object sender, EventArgs e)
        {
            _app.StartStream();
        }

        //Stop Stream Button
        private void metroTile4_Click(object sender, EventArgs e)
        {
            _app.Dispose();
            _app = new AppInterface(4568);
            _app.NetworkStart();
        }

        //Save changes button
        private void metroTile5_Click(object sender, EventArgs e)
        {
            int x = 0;
            Int32.TryParse(metroTextBox3.Text, out x);
            _app.UpdateInfo(metroTextBox1.Text, metroTextBox2.Text, x);
            metroTextBox1.Clear();
            metroTextBox2.Clear();
            metroTextBox3.Clear();
            metroTile5.Text = "Success";
        }

        #endregion

        #region Screen Settings
        private void metroToggle2_CheckStateChanged(object sender, EventArgs e)
        {
            if (metroToggle2.Checked) _app.StartScreen();
            else _app.StopScreen();
        }

        private void metroRadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Boolean type = false;
            if (metroRadioButton1.Checked) type = true;
            _app.changeScreen(type);
        }
        #endregion

        #region Sound Settings
        private void metroToggle1_CheckedChanged(object sender, EventArgs e)
        {
            if (metroToggle1.Checked) _app.StartSound();
            else _app.StopSound();
        }
        private void metroTrackBar1_Scroll(object sender, ScrollEventArgs e)
        {
            float x = (float)(metroTrackBar1.Value)/100;
            _app.alterSpeakerVolume(x);
        }
        #endregion

        #region Peripherals Settings
        private void metroToggle3_CheckedChanged(object sender, EventArgs e)
        {
            if (metroToggle3.Checked) _app.StartPeripheral(0);
            else _app.StopPeripheral(0);
        }
        private void metroToggle4_CheckedChanged(object sender, EventArgs e)
        {
            if (metroToggle4.Checked) _app.StartPeripheral(1);
            else _app.StopPeripheral(1);
        }
        #endregion

    }
}
