using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InputController.DataTypes;
using System.Threading;

namespace InputController.Controllers
{
    /// <summary>
    /// Remarks: This class manages the two basic controllers of our app, clicking and typing.
    ///          
    ///          The workload runs in two different threads, one for mouse actions and one for keyboard actions.
    ///          The two thread run constantly (while true) BUT synchronization is achieved by the stack class.
    ///          Because it's protected with lock plus monitor functionality, our two threads are constantly waiting
    ///          for a monitor pulse so they can pop from the stack and then execute the action using the controllers.
    /// </summary>
    
    public class ActionDispatcher //synch by action stacks with monitor + lock
    {
        #region Private Variables
        private ActionQueues _stacks;
        private Clicking _clicker;
        private Typing _typer;
        private Thread _mouseThread;
        private Thread _keyboardThread;
        #endregion

        #region Constructor
        public ActionDispatcher(ActionQueues stacks)
        {
            _stacks = stacks;
            _clicker = new Clicking();
            _typer = new Typing();
            _mouseThread = new Thread(initMouseThread);
            _keyboardThread = new Thread(initKeyboardThread);
        }
        #endregion
        
        #region Methods
        private void initMouseThread()
        {
            while (true)
            {
                _clicker.RunAction(_stacks.removeMouseAction());
            }
        }
        private void initKeyboardThread()
        {
            while (true)
            {
                _typer.RunAction(_stacks.removeKeyboardAction());
            }
        }
        public void startExecution()
        {
            _mouseThread.Start();
            _keyboardThread.Start();
        }
        public void stopExecution()
        {
            _mouseThread.Abort();
            _keyboardThread.Abort();
        }
        #endregion
    }
}
