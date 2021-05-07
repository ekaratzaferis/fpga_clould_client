using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using InputController.DataTypes;

namespace InputController.Devices
{
    class Keyboard
    {
        /// <summary>
        /// Remarks: This class simulates the keyboard device. It uses the keybd_event function from user32.dll library to send
        ///          keyboard events to the actual device.
        ///          
        /// [DLLs : user32.dll]
        /// [Constants: Virtual Keycodes for Windows]
        /// 
        /// !! Every keyhit is an integer argument for KeyboardEvent(). 
        /// !! Check Correlate() for integer code correspodence with virtual key codes.
        /// 
        /// !! Integer arguments greater than 115, lead to "unreserved" keyhit.
        /// !! On single or double keyhit events, use values greater than 115 in arguments. (precaution)
        /// </summary>
        
        #region DLL Imports
        [DllImport("user32.dll", SetLastError = true)]
        static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);
        #endregion

        #region Constants
        private const int KEYEVENTF_EXTENDEDKEY = 0x0001;           // Key down flag
        private const int KEYEVENTF_KEYUP = 0x0002;                 // Key up flag
        private const int VK_BACK = 0x08;                           // Backspace
        private const int VK_TAB = 0x09;                            // Tab
        private const int VK_CLEAR = 0x0C;                          // Clear
        private const int VK_RETURN = 0x0D;                         // Enter
        private const int VK_SHIFT = 0x10;                          // Shift
        private const int VK_CONTROL = 0x11;                        // Control
        private const int VK_MENU = 0x12;                           // Alt
        private const int VK_CAPITAL = 0x14;                        // Caps Lock
        private const int VK_ESCAPE = 0x1B;                         // Esc
        private const int VK_SPACE = 0x20;                          // Spacebar
        private const int VK_PRIOR = 0x21;                          // Page Up
        private const int VK_NEXT = 0x22;                           // Page Down
        private const int VK_END = 0x23;                            // End
        private const int VK_HOME = 0x24;                           // Home
        private const int VK_LEFT = 0x25;                           // Left Arrow
        private const int VK_UP = 0x26;                             // Up Arrow
        private const int VK_RIGHT = 0x27;                          // Right Arrow
        private const int VK_DOWN = 0x28;                           // Down Arrow
        private const int VK_SNAPSHOT = 0x2C;                       // Print Screen
        private const int VK_INSERT = 0x2D;                         // Insert
        private const int VK_DELETE = 0x2D;                         // Delete
        private const int VK_0 = 0x30;                              // 0
        private const int VK_1 = 0x31;                              // 1
        private const int VK_2 = 0x32;                              // 2
        private const int VK_3 = 0x33;                              // 3
        private const int VK_4 = 0x34;                              // 4
        private const int VK_5 = 0x35;                              // 5
        private const int VK_6 = 0x36;                              // 6
        private const int VK_7 = 0x37;                              // 7
        private const int VK_8 = 0x38;                              // 8
        private const int VK_9 = 0x39;                              // 9
        private const int VK_A = 0x41;                              // A
        private const int VK_B = 0x42;                              // B
        private const int VK_C = 0x43;                              // C
        private const int VK_D = 0x44;                              // D
        private const int VK_E = 0x45;                              // E
        private const int VK_F = 0x46;                              // F
        private const int VK_G = 0x47;                              // G
        private const int VK_H = 0x48;                              // H
        private const int VK_I = 0x49;                              // I
        private const int VK_J = 0x4A;                              // J
        private const int VK_K = 0x4B;                              // K
        private const int VK_L = 0x4C;                              // L
        private const int VK_M = 0x4D;                              // M
        private const int VK_N = 0x4E;                              // N
        private const int VK_O = 0x4F;                              // O
        private const int VK_P = 0x50;                              // P
        private const int VK_Q = 0x51;                              // Q
        private const int VK_R = 0x52;                              // R
        private const int VK_S = 0x53;                              // S
        private const int VK_T = 0x54;                              // T
        private const int VK_U = 0x55;                              // U
        private const int VK_V = 0x56;                              // V
        private const int VK_W = 0x57;                              // W
        private const int VK_X = 0x58;                              // X
        private const int VK_Y = 0x59;                              // Y
        private const int VK_Z = 0x5A;                              // Z
        private const int VK_LWIN = 0x5B;                           // Left Windows
        private const int VK_RWIN = 0x5C;                           // Right Windows
        private const int VK_APPS = 0x5D;                           // Applications Key
        private const int VK_NUMPAD0 = 0x60;                        // Numpad 0
        private const int VK_NUMPAD1 = 0x61;                        // Numpad 1
        private const int VK_NUMPAD2 = 0x62;                        // Numpad 2
        private const int VK_NUMPAD3 = 0x63;                        // Numpad 3
        private const int VK_NUMPAD4 = 0x64;                        // Numpad 4
        private const int VK_NUMPAD5 = 0x65;                        // Numpad 5
        private const int VK_NUMPAD6 = 0x66;                        // Numpad 6
        private const int VK_NUMPAD7 = 0x67;                        // Numpad 7
        private const int VK_NUMPAD8 = 0x68;                        // Numpad 8
        private const int VK_NUMPAD9 = 0x69;                        // Numpad 9
        private const int VK_MULTIPLY = 0x6A;                       // Multiply
        private const int VK_ADD = 0x6B;                            // Add
        private const int VK_SEPARATOR = 0x6C;                      // Separator
        private const int VK_SUBTRACT = 0x6D;                       // Subtract
        private const int VK_DEMICAL = 0x6E;                        // Demical
        private const int VK_DIVIDE = 0x6F;                         // Divide
        private const int VK_F1 = 0x70;                             // F1
        private const int VK_F2 = 0x71;                             // F2
        private const int VK_F3 = 0x72;                             // F3
        private const int VK_F4 = 0x73;                             // F4
        private const int VK_F5 = 0x74;                             // F5
        private const int VK_F6 = 0x75;                             // F6
        private const int VK_F7 = 0x76;                             // F7
        private const int VK_F8 = 0x77;                             // F8
        private const int VK_F9 = 0x78;                             // F9
        private const int VK_F10 = 0x79;                            // F10
        private const int VK_F11 = 0x7A;                            // F11
        private const int VK_F12 = 0x7B;                            // F12
        private const int VK_NUMLOCK = 0x90;                        // Numlock
        private const int VK_SCROLL = 0x91;                         // Scroll Lock
        private const int VK_LSHIFT = 0xA0;                         // Left Shift
        private const int VK_RSHIFT = 0xA1;                         // Right Shift
        private const int VK_LCONTROL = 0xA2;                       // Left Control
        private const int VK_RCONTROL = 0xA3;                       // Right Control
        private const int VK_LMENU = 0xA4;                          // Left Menu
        private const int VK_RMENU = 0xA5;                          // Right Menu
        private const int VK_VOLUME_MUTE = 0xAD;                    // Volume Mute
        private const int VK_VOLUME_DOWN = 0xAE;                    // Volume Down
        private const int VK_VOLUME_UP = 0xAF;                      // Volume Up
        private const int VK_MEDIA_NEXT_TRACK = 0xB0;               // Next Track
        private const int VK_MEDIA_PREV_TRACK = 0xB1;               // Previous Track
        private const int VK_MEDIA_STOP = 0xB2;                     // Stop
        private const int VK_MEDIA_PLAY_PAUSE = 0xB3;               // Play / Pause
        private const int VK_OEM_1 = 0xBA;                          // ; :
        private const int VK_OEM_PLUS = 0xBB;                       // +
        private const int VK_OEM_COMMA = 0xBC;                      // ,
        private const int VK_OEM_MINUS = 0xBD;                      // -
        private const int VK_OEM_PERIOD = 0xBE;                     // .
        private const int VK_OEM_2 = 0xBF;                          // ? /
        private const int VK_OEM_3 = 0xC0;                          // ~ `
        private const int VK_OEM_4 = 0xDB;                          // [ {
        private const int VK_OEM_5 = 0xDC;                          // | \
        private const int VK_OEM_6 = 0xDD;                          // ] }
        private const int VK_OEM_7 = 0xDE;                          // ' "
        private const int VK_OEM_8 = 0xDF;                          // Unreserved
        private const int VK_FN = 0xFF;                             // Fn
        #endregion

        #region Methods
        private byte Correlate(int key)
        {
            switch (key)
            {
                case 001: return VK_BACK;
                case 002: return VK_TAB;
                case 003: return VK_CLEAR;
                case 004: return VK_RETURN;
                case 005: return VK_RSHIFT;
                case 006: return VK_CONTROL;
                case 007: return VK_MENU;
                case 008: return VK_CAPITAL;
                case 009: return VK_ESCAPE;
                case 010: return VK_SPACE;
                case 011: return VK_PRIOR;
                case 012: return VK_NEXT;
                case 013: return VK_END;
                case 014: return VK_HOME;
                case 015: return VK_LEFT;
                case 016: return VK_UP;
                case 017: return VK_RIGHT;
                case 018: return VK_DOWN;
                case 019: return VK_SNAPSHOT;
                case 020: return VK_INSERT;
                case 021: return VK_DELETE;
                case 022: return VK_0;
                case 023: return VK_1;
                case 024: return VK_2;
                case 025: return VK_3;
                case 026: return VK_4;
                case 027: return VK_5;
                case 028: return VK_6;
                case 029: return VK_7;
                case 030: return VK_8;
                case 031: return VK_9;
                case 032: return VK_A;
                case 033: return VK_B;
                case 034: return VK_C;
                case 035: return VK_D;
                case 036: return VK_E;
                case 037: return VK_F;
                case 038: return VK_G;
                case 039: return VK_H;
                case 040: return VK_I;
                case 041: return VK_J;
                case 042: return VK_K;
                case 043: return VK_L;
                case 044: return VK_M;
                case 045: return VK_N;
                case 046: return VK_O;
                case 047: return VK_P;
                case 048: return VK_Q;
                case 049: return VK_R;
                case 050: return VK_S;
                case 051: return VK_T;
                case 052: return VK_U;
                case 053: return VK_V;
                case 054: return VK_W;
                case 055: return VK_X;
                case 056: return VK_Y;
                case 057: return VK_Z;
                case 058: return VK_LWIN;
                case 059: return VK_RWIN;
                case 060: return VK_APPS;
                case 061: return VK_NUMPAD0;
                case 062: return VK_NUMPAD1;
                case 063: return VK_NUMPAD2;
                case 064: return VK_NUMPAD3;
                case 065: return VK_NUMPAD4;
                case 066: return VK_NUMPAD5;
                case 067: return VK_NUMPAD6;
                case 068: return VK_NUMPAD7;
                case 069: return VK_NUMPAD8;
                case 070: return VK_NUMPAD9;
                case 071: return VK_MULTIPLY;
                case 072: return VK_ADD;
                case 073: return VK_SEPARATOR;
                case 074: return VK_SUBTRACT;
                case 075: return VK_DEMICAL;
                case 076: return VK_DIVIDE;
                case 077: return VK_F1;
                case 078: return VK_F2;
                case 079: return VK_F3;
                case 080: return VK_F4;
                case 081: return VK_F5;
                case 082: return VK_F6;
                case 083: return VK_F7;
                case 084: return VK_F8;
                case 085: return VK_F9;
                case 086: return VK_F10;
                case 087: return VK_F11;
                case 088: return VK_F12;
                case 089: return VK_NUMLOCK;
                case 090: return VK_SCROLL;
                case 091: return VK_RSHIFT;
                case 092: return VK_RSHIFT;
                case 093: return VK_LCONTROL;
                case 094: return VK_RCONTROL;
                case 095: return VK_MENU;
                case 096: return VK_MENU;
                case 097: return VK_VOLUME_MUTE;
                case 098: return VK_VOLUME_DOWN;
                case 099: return VK_VOLUME_UP;
                case 100: return VK_MEDIA_NEXT_TRACK;
                case 101: return VK_MEDIA_PREV_TRACK;
                case 102: return VK_MEDIA_STOP;
                case 103: return VK_MEDIA_PLAY_PAUSE;
                case 104: return VK_OEM_1;
                case 105: return VK_OEM_PLUS;
                case 106: return VK_OEM_COMMA;
                case 107: return VK_OEM_MINUS;
                case 108: return VK_OEM_PERIOD;
                case 109: return VK_OEM_2;
                case 110: return VK_OEM_3;
                case 111: return VK_OEM_4;
                case 112: return VK_OEM_5;
                case 113: return VK_OEM_6;
                case 114: return VK_OEM_7;
                case 115: return VK_OEM_8;
                case 116: return VK_FN;
                default: return VK_OEM_8; // return unreserved key [trash]
            }
        }

        public void KeyboardEvent(int firstkey, int secondKey, int thirdKey, KeyHit type)
        {
            //Console.Out.WriteLine(Correlate(firstkey));
            switch(type)
            {
                case KeyHit.singleKeyDown:
                    keybd_event(Correlate(firstkey), 0, KEYEVENTF_EXTENDEDKEY, 0);
                    break;
                case KeyHit.singleKeyUp:
                    keybd_event(Correlate(firstkey), 0, KEYEVENTF_KEYUP, 0);
                    break;
                case KeyHit.doubleKeyDown:
                    keybd_event(Correlate(firstkey), 0, KEYEVENTF_EXTENDEDKEY, 0);
                    keybd_event(Correlate(secondKey), 0, KEYEVENTF_EXTENDEDKEY, 0);
                    break;
                case KeyHit.doubleKeyUp:
                    keybd_event(Correlate(firstkey), 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(Correlate(secondKey), 0, KEYEVENTF_KEYUP, 0);
                    break;
                case KeyHit.tripleKeyDown:
                    keybd_event(Correlate(firstkey), 0, KEYEVENTF_EXTENDEDKEY, 0);
                    keybd_event(Correlate(secondKey), 0, KEYEVENTF_EXTENDEDKEY, 0);
                    keybd_event(Correlate(thirdKey), 0, KEYEVENTF_EXTENDEDKEY, 0);
                    break;
                case KeyHit.tripleKeyUp:
                    keybd_event(Correlate(firstkey), 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(Correlate(secondKey), 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(Correlate(thirdKey), 0, KEYEVENTF_KEYUP, 0);
                    break;
                default:
                    break;
            }
        }
        #endregion
    }
}
