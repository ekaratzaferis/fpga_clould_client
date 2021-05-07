using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using InputController;
using InputController.Devices;
using InputController.DataTypes;

namespace InputController.Controllers
{
    public class Clicking
    {
        /// <summary>
        /// Remarks: This class uses the virtul mouse device class (InputController.Devices.Mouse) to simulate mouse events.
        /// 
        /// [Threaded Actions]
        /// </summary>
        
        #region Variables
        private Mouse _mouse = null;
        #endregion

        #region Constructor
        public Clicking()
        {
            _mouse = new Mouse();
        }
        #endregion

        #region Methods
        public void RunAction(MouseAction action)
        {
            //Thread.Sleep(5); // Fixed interval
            _mouse.MouseEvent(action.X, action.Y, action.Type);
        }
        #endregion
    }
}
