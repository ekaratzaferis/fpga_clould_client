using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Runtime.InteropServices;
using InputController.DataTypes;
using InputController.Devices;

namespace InputController.Controllers
{
    public class Typing
    {
        /// <summary>
        /// Remarks: This class uses the virtul keyboard device class (InputController.Devices.Keyboard) to simulate 
        /// keyboard events.
        /// 
        /// [Threaded Actions]
        /// </summary>

        #region Variables
        private Keyboard _keyboard = null;
        #endregion

        #region Constructor
        public Typing()
        {
            _keyboard = new Keyboard();
        }
        #endregion

        #region Methods
        public void RunAction(KeyboardAction action)
        {
            Thread.Sleep(50); // Fixed interval
            _keyboard.KeyboardEvent(action.FirstKey, action.SecondKey, action.ThirdKey, action.Type);
        }
        #endregion
    }
}
