using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace InputController.DataTypes
{
    /// <summary>
    /// Remarks: This class contains 2 action stacks, one filled with mouse actions and one with keyboard actions.
    ///          Access to stacks is given only through methods which are protected with synchronization blocks.
    ///          
    ///          Add and Remove methods are protected from each other by locking the entire stack while an action
    ///          is performed (push or pop).
    ///          
    /// [Reader flags make sure that there's something in the stack before we attempt a pop action.]
    /// </summary>
    
    public class ActionQueues
    {
        #region Private Variables
        private Queue _mouseActions;
        private Queue _keyboardAtions;
        private bool _mouseReaderFlag = false;
        private bool _keyboradReaderFlag = false;
        #endregion

        #region Constructor
        public ActionQueues()
        {
            _mouseActions = new Queue();
            _keyboardAtions = new Queue();
        }
        #endregion

        #region Methods
        public bool addMouseAction(MouseAction action)
        {
            lock (_mouseActions)
            {
                if (_mouseReaderFlag)
                {
                    try
                    {
                        Monitor.Wait(_mouseActions);
                    }
                    catch (SynchronizationLockException e)
                    {
                        Console.Out.Write(e);
                        return false;
                    }
                    catch (ThreadInterruptedException e)
                    {
                        Console.Out.Write(e);
                        return false;
                    }
                }
                _mouseActions.Enqueue(action);
                _mouseReaderFlag = true;
                Monitor.Pulse(_mouseActions);
            }
            return true;
        }
        public bool addKeyboardAction(KeyboardAction action)
        {
            lock (_keyboardAtions)
            {
                if (_keyboradReaderFlag)
                {
                    try
                    {
                        Monitor.Wait(_keyboardAtions);
                    }
                    catch (SynchronizationLockException e)
                    {
                        Console.Out.Write(e);
                        return false;
                    }
                    catch (ThreadInterruptedException e)
                    {
                        Console.Out.Write(e);
                        return false;
                    }
                }
                _keyboardAtions.Enqueue(action);
                _keyboradReaderFlag = true;
                Monitor.Pulse(_keyboardAtions);
            }
            return true;
        }
        public MouseAction removeMouseAction()
        {
            MouseAction temp;
            lock (_mouseActions)
            {
                if (!_mouseReaderFlag)
                {
                    try
                    {
                        Monitor.Wait(_mouseActions);
                    }
                    catch (SynchronizationLockException e)
                    {
                        Console.Out.Write(e);
                        return null;
                    }
                    catch (ThreadInterruptedException e)
                    {
                        Console.Out.Write(e);
                        return null;
                    }
                }
                temp = _mouseActions.Dequeue() as MouseAction;
                _mouseReaderFlag = false;
                Monitor.Pulse(_mouseActions);
            }
            return temp;
        }
        public KeyboardAction removeKeyboardAction()
        {
            KeyboardAction temp;
            lock (_keyboardAtions)
            {
                if (!_keyboradReaderFlag)
                {
                    try
                    {
                        Monitor.Wait(_keyboardAtions);
                    }
                    catch (SynchronizationLockException e)
                    {
                        Console.Out.Write(e);
                        return null;
                    }
                    catch (ThreadInterruptedException e)
                    {
                        Console.Out.Write(e);
                        return null;
                    }
                }
                temp = _keyboardAtions.Dequeue() as KeyboardAction;
                _keyboradReaderFlag = false;
                Monitor.Pulse(_keyboardAtions);
            }
            return temp;
        }
        #endregion
    }
}
