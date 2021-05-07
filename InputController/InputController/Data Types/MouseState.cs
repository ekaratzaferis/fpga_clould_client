using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InputController.Devices;
using InputController.DataTypes;
using System.Collections;

namespace InputController.DataTypes
{

    /// <summary>
    /// Remarks: This class holds responsibility for saving the mouse's current state.
    ///          
    ///          That includes: Cursor position at X,Y axes, Left,Right, Wheel and Middle Button states.
    /// </summary>
    
    public class MouseState
    {
        #region Private Variables
        private int _xpos = 0;
        private int _ypos = 0;
        private Mouse.MouseState _mouseState;
        #endregion

        #region Constructor
        public MouseState()
        {
            _xpos = 500;
            _ypos = 500;
            _mouseState = new Mouse.MouseState();
            _mouseState._leftClick = false;
            _mouseState._rightClick = false;
            _mouseState._wheelClick = false;
        }
        #endregion

        #region Methods
        public int updateXpos(bool sign, bool overflow, BitArray value)
        {
            if (overflow && sign) _xpos = _xpos - 30;
            else if (overflow) _xpos = _xpos + 30;
            else if (sign)
            {
                int[] array = new int[1];
                value.CopyTo(array, 0);
                int xValue = array[0];
                xValue = ~xValue;
                xValue = xValue + 257;
                _xpos = _xpos - xValue;
            }
            else
            {
                int[] array = new int[1];
                value.CopyTo(array, 0);
                int xValue = array[0];
                _xpos = _xpos + xValue;
            }
            if (_xpos > 1366) _xpos = 1366;
            if (_xpos < 0) _xpos = 0;
            return _xpos;
        }
        public int updateYpos(bool sign, bool overflow, BitArray value)
        {
            if (overflow && sign) _ypos = _ypos - 30;
            else if (overflow) _ypos = _ypos + 30;
            else if (sign)
            {
                int[] array = new int[1];
                value.CopyTo(array, 0);
                int yValue = array[0];
                yValue = ~yValue;
                yValue = yValue + 257;
                _ypos = _ypos + yValue;
            }
            else
            {
                int[] array = new int[1];
                value.CopyTo(array, 0);
                int yValue = array[0];
                _ypos = _ypos - yValue;
            }
            if (_ypos > 768) _ypos = 768;
            if (_ypos < 0) _ypos = 0;
            return _ypos;
        }
        public ClickType updateLeftButton(bool input)
        {
            if (input)
            {
                if (_mouseState._leftClick) return ClickType.noClick;
                else
                {
                    _mouseState._leftClick = true;
                    return ClickType.leftClickDown;
                }
            }
            else
            {
                if (_mouseState._leftClick)
                {
                    _mouseState._leftClick = false;
                    return ClickType.leftClickUp;
                }
                else return ClickType.noClick;
            }
        }
        public ClickType updateRightButton(bool input)
        {
            if (input)
            {
                if (_mouseState._rightClick) return ClickType.noClick;
                else
                {
                    _mouseState._rightClick = true;
                    return ClickType.rightClickDown;
                }
            }
            else
            {
                if (_mouseState._rightClick)
                {
                    _mouseState._rightClick = false;
                    return ClickType.rightClickUp;
                }
                else return ClickType.noClick;
            }
        }
        public ClickType updateMiddleButton(bool input)
        {
            if (input)
            {
                if (_mouseState._wheelClick) return ClickType.noClick;
                else
                {
                    _mouseState._wheelClick = true;
                    return ClickType.wheelClickDown;
                }
            }
            else
            {
                if (_mouseState._wheelClick)
                {
                    _mouseState._wheelClick = false;
                    return ClickType.wheelClickUp;
                }
                else return ClickType.noClick;
            }
        }
        public ClickType updateWheelMovement(BitArray input)
        {
            int[] array = new int[1];
            input.CopyTo(array, 0);
            int value = array[0];
            value = ~value;
            value = value + 1;
            if (value == -255) return ClickType.wheelUp;
            else if (value == -1) return ClickType.wheelDown;
            else return ClickType.noClick;
        }
        #endregion

    }
}
