using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InputController.DataTypes;
using InputController.Devices;

namespace InputController.Decomposers
{
    /// <summary>
    /// Remarks: This class holds responsibility for decomposing incoming packets and extracting key elements from them.
    ///          
    ///          -> fetchClickType and fetchPositions are used for decomposing incoming mouse action packets
    ///          -> fetchKeyHit and fetchKey are used for decomposing incoming keyboard action packets
    /// </summary>
    
    public class Decomposer
    {

        #region Private Variables
        MouseState _mouseState;
        #endregion

        #region Constructor
        public Decomposer() 
        {
            _mouseState = new MouseState();
        }
        #endregion

        #region Methods
        public ClickType fetchClickType(Byte[] packet)
        {
            int length = packet.Length;
            Byte state = packet[length - 4];
            Byte movement = packet[length - 1];
            BitArray stateInfo = new BitArray(new byte[] { state });
            BitArray zMovement = new BitArray(new byte[] { movement });

            ClickType[] info = new ClickType[4];
            info[0] = _mouseState.updateLeftButton(stateInfo[0]);
            info[1] = _mouseState.updateRightButton(stateInfo[1]);
            info[2] = _mouseState.updateMiddleButton(stateInfo[2]);
            info[3] = _mouseState.updateWheelMovement(zMovement);

            if (info[0].Equals(ClickType.leftClickDown)) return info[0];
            else if (info[0].Equals(ClickType.leftClickUp)) return info[0];
            else if (info[1].Equals(ClickType.rightClickDown)) return info[1];
            else if (info[1].Equals(ClickType.rightClickUp)) return info[1];
            else if (info[2].Equals(ClickType.wheelClickDown)) return info[2];
            else if (info[2].Equals(ClickType.rightClickUp)) return info[2];
            else if (info[3].Equals(ClickType.wheelDown)) return info[3];
            else if (info[3].Equals(ClickType.wheelUp)) return info[3];
            else return info[0];
        }
        public int fetchXPosition(Byte[] packet)
        {
            int length = packet.Length;
            Byte info = packet[length - 4];
            Byte xpos = packet[length - 3];
            BitArray xinfo = new BitArray(new byte[] { info });
            BitArray xValue = new BitArray(new byte[] { xpos });
            return _mouseState.updateXpos(xinfo[4], xinfo[6], xValue);
        }
        public int fetchYPosition(Byte[] packet)
        {
            int length = packet.Length;
            Byte info = packet[length - 4];
            Byte ypos = packet[length - 2];
            BitArray yinfo = new BitArray(new byte[] { info });
            BitArray yValue = new BitArray(new byte[] { ypos });
            return _mouseState.updateYpos(yinfo[5], yinfo[7], yValue);
        }
        public KeyHit fetchKeyHit(Byte[] packet)
        {
            int length = packet.Length;
            if (packet[length - 2].Equals(0xf0))
            {
                return (KeyHit)Enum.Parse(typeof(KeyHit), "singleKeyUp");
            }
            else
            {
                return (KeyHit)Enum.Parse(typeof(KeyHit), "singleKeyDown");
            }
        }
        public int fetchKey(Byte[] packet)
        {
            int length = packet.Length;
            switch (packet[length-1])
            {
                case 0x76: return 9; //Esc
                case 0x16: return 23; //! 1
                case 0x1e: return 24; //@ 2
                case 0x26: return 25; //# 3
                case 0x25: return 26; //$ 4
                case 0x2e: return 27; //% 5
                case 0x36: return 28; //^ 6
                case 0x3d: return 29; //& 7
                case 0x3e: return 30; //* 8
                case 0x46: return 31; //( 9
                case 0x45: return 22; //) 0
                case 0x4e: return 107; //_ -
                case 0x55: return 105; //+ =
                case 0x66: return 1; //Back Space
                case 0x0d: return 2; //Tab
                case 0x15: return 48; //Q
                case 0x1d: return 54; //W
                case 0x24: return 36; //E
                case 0x2d: return 49; //R
                case 0x2c: return 51; //T
                case 0x35: return 56; //Y
                case 0x3c: return 52; //U
                case 0x43: return 40; //I
                case 0x44: return 46; //O
                case 0x4d: return 47; //P
                case 0x54: return 111; //{ [
                case 0x5b: return 113; //} ]
                case 0x5a: return 4; //Enter
                case 0x14: {
                            if (packet[length - 3].Equals(0xe0)) return 94; //Ctrl R
                            else  return 93; //Ctrl L
                           }       
                case 0x1c: return 32; //A
                case 0x1b: return 50; //S
                case 0x23: return 35; //D
                case 0x2b: return 37; //F
                case 0x34: return 38; //G
                case 0x33: return 39; //H
                case 0x3b: return 41; //J
                case 0x42: return 42; //K
                case 0x4b: return 43; //L
                case 0x4c: return 104; //: ;
                case 0x52: return 114; //" '
                case 0x0e: return 110; //~ `
                case 0x12: return 91; //Shift L
                case 0x5d: return 112; //| \
                case 0x1a: return 57; //Z
                case 0x22: return 55; //X
                case 0x21: return 34; //C
                case 0x2a: return 53; //V
                case 0x32: return 33; //B
                case 0x31: return 45; //N
                case 0x3a: return 44; //M
                case 0x41: return 106; //< ,
                case 0x49: return 108; //> .
                case 0x4a: return 109; //? /
                case 0x59: return 92; //Shift R
                case 0x11: {
                            if (packet[length - 3].Equals(0xe0)) return 96; //Alt R
                            else return 95; //Alt L
                           }
                case 0x29: return 10; //Space
                case 0x58: return 8; //Caps Lock
                case 0x05: return 77; //F1
                case 0x06: return 78; //F2
                case 0x04: return 79; //F3
                case 0x0c: return 80; //F4
                case 0x03: return 81; //F5
                case 0x0b: return 82; //F6
                case 0x83: return 83; //F7
                case 0x0a: return 84; //F8
                case 0x01: return 85; //F9
                case 0x09: return 86; //F10
                case 0x78: return 87; //F11 
                case 0x07: return 88; //F12
                case 0x75: return 16; //UP
                case 0x6b: return 15; //Left
                case 0x74: return 17; //Right
                case 0x72: return 72; //Down
                case 0x1f: {
                            if (packet[length - 3].Equals(0xe0)) return 58; //WinL
                            else return 0; ;
                           }           
                default: return 0;
            }
        }
        #endregion
    }
}
