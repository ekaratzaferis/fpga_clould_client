using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InputController.DataTypes
{
    /// <summary>
    /// Remarks: This class contains all the information of an occured mouse event.
    ///          Every instance contains the following:
    ///                 1) Cursor x coordinate
    ///                 2) Cursor y coordinate
    ///                           
    /// [Enumaration identifies the encapsulated event.]
    /// </summary>

    public enum ClickType
    {
        leftClickDown = 0,
        leftClickUp = 1,
        rightClickDown = 2,
        rightClickUp = 3,
        wheelClickDown = 4,
        wheelClickUp = 5,
        wheelUp = 6,
        wheelDown = 7,
        noClick = 8
    }

    public class MouseAction
    {
        #region Private Variables
        private int _x;
        private int _y;
        private ClickType _type;
        #endregion

        #region Constuctors
        public MouseAction()
        {
            _x = 0;
            _y = 0;
            _type = ClickType.noClick;
        }
        public MouseAction(int x, int y, ClickType type)
        {
            _x = x;
            _y = y;
            _type = type;
        }
        #endregion

        #region Getters/Setters
        public int X
        {
            set { _x = value; }
            get { return _x; }
        }
        public int Y
        {
            set { _y = value; }
            get { return _y; }
        }
        public ClickType Type
        {
            set { _type = value; }
            get { return _type; }
        }
        #endregion
    }
}
