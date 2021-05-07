using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using InputController.DataTypes;

namespace InputController.Devices
{
    class Mouse
    {
        /// <summary>
        /// Remarks: This class simulates the mouse device. It uses the mouse_event function from user32.dll library to send
        ///          mouse events to the actual device, and SetCursorPos from the same library to move the cursor along
        ///          the screen.
        ///          
        /// [DLLs : user32.dll]
        /// [Constants: Virtual Keycodes for Windows]
        /// </summary>
        
        #region DLL Imports
        [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
        public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);

        [DllImport("user32")] //to idio me ton grafa user32.dll
        public static extern int SetCursorPos(int x, int y);
        #endregion

        #region Struct
        public struct MouseState
        {
            public bool _leftClick;
            public bool _rightClick;
            public bool _wheelClick;
        }
        #endregion

        #region Constants
        private const int MOUSEEVENTF_MOVE = 0x0001;             // mouse move
        private const int MOUSEEVENTF_LEFTDOWN = 0x0002;         // left button down
        private const int MOUSEEVENTF_LEFTUP = 0x0004;           // left button up
        private const int MOUSEEVENTF_RIGHTDOWN = 0x0008;        // right button down
        private const int MOUSEEVENTF_RIGHTUP = 0x0010;          // right button up
        private const int MOUSEEVENTF_MIDDLEDOWN = 0x0020;       // middle button down
        private const int MOUSEEVENTF_MIDDLEUP = 0x0040;         // middle button up
        private const int MOUSEEVENTF_XDOWN = 0x0080;            // middle button down
        private const int MOUSEEVENTF_XUP = 0x0100;              // middle button up
        private const int MOUSEEVENTF_WHEEL = 0x0800;            // wheel button rolled
        private const int MOUSEEVENTF_VIRTUALDESK = 0x4000;      // map to entire virtual desktop
        private const int MOUSEEVENTF_ABSOLUTE = 0x8000;         // absolute move
        private const int WHEEL_DELTA = 0x70;                    // one wheel click is 120
        #endregion

        #region Methods
        public void MouseEvent(int xCoordinate, int yCoordinate, ClickType type)
        {
            SetCursorPos(xCoordinate, yCoordinate);
            switch (type)
            {
                case ClickType.leftClickDown:
                    mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
                    break;
                case ClickType.leftClickUp:
                    mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
                    break;
                case ClickType.rightClickDown:
                    mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
                    break;
                case ClickType.rightClickUp:
                    mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
                    break;
                case ClickType.wheelClickDown:
                    //mouse_event(MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0);
                    break;
                case ClickType.wheelClickUp:
                    //mouse_event(MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0);
                    break;
                case ClickType.wheelDown:
                    mouse_event(MOUSEEVENTF_WHEEL, 0, 0, -WHEEL_DELTA, 0);
                    break;
                case ClickType.wheelUp:
                    mouse_event(MOUSEEVENTF_WHEEL, 0, 0, WHEEL_DELTA, 0);
                    break;
                default: // ClickType.noClick
                    break;
            }
        }
        #endregion
    }
}
