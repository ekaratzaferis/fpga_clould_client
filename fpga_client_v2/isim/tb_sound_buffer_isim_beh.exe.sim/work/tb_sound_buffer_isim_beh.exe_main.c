/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_3778488130_init();
    xilinxcorelib_ver_m_00000000001687936702_2444198090_init();
    xilinxcorelib_ver_m_00000000002134612282_0689831712_init();
    xilinxcorelib_ver_m_00000000001603977570_2467178142_init();
    work_m_00000000003617559063_1902521243_init();
    work_m_00000000000362969546_0149844336_init();
    work_m_00000000001548610986_2390529740_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001548610986_2390529740");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
