using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InputController.DataTypes
{
    /// <summary>
    /// Remarks: This class contains all the information of an occured keyboard event.
    ///          Every instance contains the following:
    ///                 1) Integer codes of keyhits (up to three)
    ///                 2) Single, double or triple event information
    ///                           
    /// [Enumaration identifies the encapsulated event.]
    /// </summary>
    /// 

    public enum KeyHit
    {
        singleKeyDown = 1,
        singleKeyUp = 2,
        doubleKeyDown = 3,
        doubleKeyUp = 4,
        tripleKeyDown = 5,
        tripleKeyUp = 6
    }

    public class KeyboardAction
    {

        #region Private Variables
        int _firstKey;
        int _secondKey;
        int _thirdKey;
        KeyHit _type;
        #endregion

        #region Constructor
        public KeyboardAction(int firstKey, int secondKey, int thirdKey, KeyHit type)
        {
            _firstKey = firstKey;
            _secondKey = secondKey;
            _thirdKey = thirdKey;
            _type = type;
        }
        #endregion

        #region Getters / Setters
        public int FirstKey
        {
            set { _firstKey = value; }
            get { return _firstKey; }
        }
        public int SecondKey
        {
            set { _secondKey = value; }
            get { return _secondKey; }
        }
        public int ThirdKey
        {
            set { _thirdKey = value; }
            get { return _thirdKey; }
        }
        public KeyHit Type
        {
            set { _type = value; }
            get { return _type; }
        }
        #endregion

    }
}
