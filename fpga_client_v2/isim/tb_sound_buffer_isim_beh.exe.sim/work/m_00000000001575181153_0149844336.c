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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/VHDL/fpga_client_v2/sound_buffering.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {31, 0};
static int ng4[] = {24, 0};
static int ng5[] = {2, 0};
static int ng6[] = {23, 0};
static int ng7[] = {16, 0};
static int ng8[] = {3, 0};
static int ng9[] = {15, 0};
static int ng10[] = {8, 0};
static int ng11[] = {4, 0};
static int ng12[] = {7, 0};
static unsigned int ng13[] = {1U, 0U};
static unsigned int ng14[] = {47999U, 0U};



static void Always_65_0(char *t0)
{
    char t18[8];
    char t20[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    char *t22;
    unsigned int t23;
    int t24;
    char *t25;
    unsigned int t26;
    int t27;
    int t28;
    char *t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    int t37;
    int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;

LAB0:    t1 = (t0 + 5704U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 6272);
    *((int *)t2) = 1;
    t3 = (t0 + 5736);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(65, ng0);

LAB5:    xsi_set_current_line(67, ng0);
    t4 = (t0 + 1344U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(77, ng0);

LAB10:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3664);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB11:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 8, t5, 32);
    if (t13 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t13 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t13 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t13 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t13 == 1)
        goto LAB20;

LAB21:
LAB22:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(67, ng0);

LAB9:    xsi_set_current_line(68, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3344);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3824);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3984);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4144);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4304);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB12:    xsi_set_current_line(79, ng0);
    t11 = (t0 + 1664U);
    t12 = *((char **)t11);
    t11 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t12);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB23;

LAB24:
LAB25:    goto LAB22;

LAB14:    xsi_set_current_line(83, ng0);

LAB27:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 1824U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4304);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB37;

LAB35:    if (*((unsigned int *)t11) == 0)
        goto LAB34;

LAB36:    t12 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t12) = 1;

LAB37:    t14 = (t18 + 4);
    t23 = *((unsigned int *)t14);
    t26 = (~(t23));
    t30 = *((unsigned int *)t18);
    t33 = (t30 & t26);
    t35 = (t33 != 0);
    if (t35 > 0)
        goto LAB38;

LAB39:
LAB40:
LAB30:    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB22;

LAB16:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 1824U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB41;

LAB42:    xsi_set_current_line(96, ng0);

LAB47:    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB43:    goto LAB22;

LAB18:    xsi_set_current_line(100, ng0);
    t3 = (t0 + 1824U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB48;

LAB49:    xsi_set_current_line(104, ng0);

LAB54:    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB50:    goto LAB22;

LAB20:    xsi_set_current_line(108, ng0);
    t3 = (t0 + 1824U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(121, ng0);

LAB85:    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB57:    goto LAB22;

LAB23:    xsi_set_current_line(79, ng0);

LAB26:    xsi_set_current_line(80, ng0);
    t14 = (t0 + 3664);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t16, 8, t17, 32);
    t19 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 8, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4304);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB25;

LAB28:    xsi_set_current_line(84, ng0);

LAB31:    xsi_set_current_line(85, ng0);
    t11 = (t0 + 1984U);
    t12 = *((char **)t11);
    t11 = (t0 + 3344);
    t14 = (t0 + 3344);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng3)));
    t19 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t18, t20, t21, ((int*)(t16)), 2, t17, 32, 1, t19, 32, 1);
    t22 = (t18 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (!(t23));
    t25 = (t20 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    t29 = (t21 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB32;

LAB33:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 3664);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t5, 8, t11, 32);
    t12 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 8, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4304);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB30;

LAB32:    t33 = *((unsigned int *)t21);
    t34 = (t33 + 0);
    t35 = *((unsigned int *)t18);
    t36 = *((unsigned int *)t20);
    t37 = (t35 - t36);
    t38 = (t37 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, t34, *((unsigned int *)t20), t38, 0LL);
    goto LAB33;

LAB34:    *((unsigned int *)t18) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(89, ng0);
    t15 = ((char*)((ng1)));
    t16 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 8, 0LL);
    goto LAB40;

LAB41:    xsi_set_current_line(92, ng0);

LAB44:    xsi_set_current_line(93, ng0);
    t11 = (t0 + 1984U);
    t12 = *((char **)t11);
    t11 = (t0 + 3344);
    t14 = (t0 + 3344);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng6)));
    t19 = ((char*)((ng7)));
    xsi_vlog_convert_partindices(t18, t20, t21, ((int*)(t16)), 2, t17, 32, 1, t19, 32, 1);
    t22 = (t18 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (!(t23));
    t25 = (t20 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    t29 = (t21 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB45;

LAB46:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 3664);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t5, 8, t11, 32);
    t12 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 8, 0LL);
    goto LAB43;

LAB45:    t33 = *((unsigned int *)t21);
    t34 = (t33 + 0);
    t35 = *((unsigned int *)t18);
    t36 = *((unsigned int *)t20);
    t37 = (t35 - t36);
    t38 = (t37 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, t34, *((unsigned int *)t20), t38, 0LL);
    goto LAB46;

LAB48:    xsi_set_current_line(100, ng0);

LAB51:    xsi_set_current_line(101, ng0);
    t11 = (t0 + 1984U);
    t12 = *((char **)t11);
    t11 = (t0 + 3344);
    t14 = (t0 + 3344);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng9)));
    t19 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t18, t20, t21, ((int*)(t16)), 2, t17, 32, 1, t19, 32, 1);
    t22 = (t18 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (!(t23));
    t25 = (t20 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    t29 = (t21 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB52;

LAB53:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 3664);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t5, 8, t11, 32);
    t12 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 8, 0LL);
    goto LAB50;

LAB52:    t33 = *((unsigned int *)t21);
    t34 = (t33 + 0);
    t35 = *((unsigned int *)t18);
    t36 = *((unsigned int *)t20);
    t37 = (t35 - t36);
    t38 = (t37 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, t34, *((unsigned int *)t20), t38, 0LL);
    goto LAB53;

LAB55:    xsi_set_current_line(108, ng0);

LAB58:    xsi_set_current_line(109, ng0);
    t11 = (t0 + 1984U);
    t12 = *((char **)t11);
    t11 = (t0 + 3344);
    t14 = (t0 + 3344);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng12)));
    t19 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t18, t20, t21, ((int*)(t16)), 2, t17, 32, 1, t19, 32, 1);
    t22 = (t18 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (!(t23));
    t25 = (t20 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    t29 = (t21 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB59;

LAB60:    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 3664);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4144);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB64;

LAB62:    if (*((unsigned int *)t11) == 0)
        goto LAB61;

LAB63:    t12 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t12) = 1;

LAB64:    t14 = (t18 + 4);
    t23 = *((unsigned int *)t14);
    t26 = (~(t23));
    t30 = *((unsigned int *)t18);
    t33 = (t30 & t26);
    t35 = (t33 != 0);
    if (t35 > 0)
        goto LAB65;

LAB66:
LAB67:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng14)));
    memset(t18, 0, 8);
    t12 = (t5 + 4);
    t14 = (t11 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t12);
    t10 = *((unsigned int *)t14);
    t23 = (t9 ^ t10);
    t26 = (t8 | t23);
    t30 = *((unsigned int *)t12);
    t33 = *((unsigned int *)t14);
    t35 = (t30 | t33);
    t36 = (~(t35));
    t39 = (t26 & t36);
    if (t39 != 0)
        goto LAB71;

LAB68:    if (t35 != 0)
        goto LAB70;

LAB69:    *((unsigned int *)t18) = 1;

LAB71:    t16 = (t18 + 4);
    t40 = *((unsigned int *)t16);
    t41 = (~(t40));
    t42 = *((unsigned int *)t18);
    t43 = (t42 & t41);
    t44 = (t43 != 0);
    if (t44 > 0)
        goto LAB72;

LAB73:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 3824);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB82;

LAB83:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 3024);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t5, 16, t11, 32);
    t12 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 16, 0LL);

LAB84:
LAB74:    goto LAB57;

LAB59:    t33 = *((unsigned int *)t21);
    t34 = (t33 + 0);
    t35 = *((unsigned int *)t18);
    t36 = *((unsigned int *)t20);
    t37 = (t35 - t36);
    t38 = (t37 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, t34, *((unsigned int *)t20), t38, 0LL);
    goto LAB60;

LAB61:    *((unsigned int *)t18) = 1;
    goto LAB64;

LAB65:    xsi_set_current_line(112, ng0);
    t15 = ((char*)((ng2)));
    t16 = (t0 + 4144);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 1, 0LL);
    goto LAB67;

LAB70:    t15 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB71;

LAB72:    xsi_set_current_line(114, ng0);

LAB75:    xsi_set_current_line(115, ng0);
    t17 = (t0 + 3984);
    t19 = (t17 + 56U);
    t22 = *((char **)t19);
    memset(t20, 0, 8);
    t25 = (t22 + 4);
    t45 = *((unsigned int *)t25);
    t46 = (~(t45));
    t47 = *((unsigned int *)t22);
    t48 = (t47 & t46);
    t49 = (t48 & 1U);
    if (t49 != 0)
        goto LAB79;

LAB77:    if (*((unsigned int *)t25) == 0)
        goto LAB76;

LAB78:    t29 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t29) = 1;

LAB79:    t50 = (t20 + 4);
    t51 = (t22 + 4);
    t52 = *((unsigned int *)t22);
    t53 = (~(t52));
    *((unsigned int *)t20) = t53;
    *((unsigned int *)t50) = 0;
    if (*((unsigned int *)t51) != 0)
        goto LAB81;

LAB80:    t58 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t58 & 1U);
    t59 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t59 & 1U);
    t60 = (t0 + 3984);
    xsi_vlogvar_wait_assign_value(t60, t20, 0, 0, 1, 0LL);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB74;

LAB76:    *((unsigned int *)t20) = 1;
    goto LAB79;

LAB81:    t54 = *((unsigned int *)t20);
    t55 = *((unsigned int *)t51);
    *((unsigned int *)t20) = (t54 | t55);
    t56 = *((unsigned int *)t50);
    t57 = *((unsigned int *)t51);
    *((unsigned int *)t50) = (t56 | t57);
    goto LAB80;

LAB82:    xsi_set_current_line(118, ng0);
    t12 = ((char*)((ng1)));
    t14 = (t0 + 3824);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, 0, 1, 0LL);
    goto LAB84;

}

static void Always_134_1(char *t0)
{
    char t13[8];
    char t51[8];
    char t55[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t52;
    char *t53;
    char *t54;
    char *t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;
    char *t88;

LAB0:    t1 = (t0 + 5952U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 6288);
    *((int *)t2) = 1;
    t3 = (t0 + 5984);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(134, ng0);

LAB5:    xsi_set_current_line(136, ng0);
    t4 = (t0 + 1344U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 4144);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4784);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t12);
    t8 = (t6 & t7);
    *((unsigned int *)t13) = t8;
    t14 = (t4 + 4);
    t15 = (t12 + 4);
    t16 = (t13 + 4);
    t9 = *((unsigned int *)t14);
    t10 = *((unsigned int *)t15);
    t17 = (t9 | t10);
    *((unsigned int *)t16) = t17;
    t18 = *((unsigned int *)t16);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB10;

LAB11:
LAB12:    t40 = (t13 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t13);
    t44 = (t43 & t42);
    t45 = (t44 != 0);
    if (t45 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(145, ng0);

LAB17:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 4464);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB18:    t5 = ((char*)((ng1)));
    t32 = xsi_vlog_unsigned_case_compare(t4, 8, t5, 32);
    if (t32 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng2)));
    t32 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t32 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng5)));
    t32 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t32 == 1)
        goto LAB23;

LAB24:
LAB25:
LAB15:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(136, ng0);

LAB9:    xsi_set_current_line(137, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4464);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4624);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4784);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    t20 = *((unsigned int *)t13);
    t21 = *((unsigned int *)t16);
    *((unsigned int *)t13) = (t20 | t21);
    t22 = (t4 + 4);
    t23 = (t12 + 4);
    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t22);
    t27 = (~(t26));
    t28 = *((unsigned int *)t12);
    t29 = (~(t28));
    t30 = *((unsigned int *)t23);
    t31 = (~(t30));
    t32 = (t25 & t27);
    t33 = (t29 & t31);
    t34 = (~(t32));
    t35 = (~(t33));
    t36 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t36 & t34);
    t37 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t37 & t35);
    t38 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t38 & t34);
    t39 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t39 & t35);
    goto LAB12;

LAB13:    xsi_set_current_line(141, ng0);

LAB16:    xsi_set_current_line(142, ng0);
    t46 = ((char*)((ng1)));
    t47 = (t0 + 4784);
    xsi_vlogvar_wait_assign_value(t47, t46, 0, 0, 1, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 4464);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB15;

LAB19:    xsi_set_current_line(147, ng0);

LAB26:    xsi_set_current_line(148, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 16, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 3184);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 3024);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memset(t13, 0, 8);
    t15 = (t5 + 4);
    t16 = (t14 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t14);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB28;

LAB27:    if (t21 != 0)
        goto LAB29;

LAB30:    t23 = (t13 + 4);
    t26 = *((unsigned int *)t23);
    t27 = (~(t26));
    t28 = *((unsigned int *)t13);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB31;

LAB32:
LAB33:    goto LAB25;

LAB21:    xsi_set_current_line(152, ng0);
    t3 = (t0 + 1504U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB34;

LAB35:
LAB36:    goto LAB25;

LAB23:    xsi_set_current_line(157, ng0);

LAB38:    xsi_set_current_line(159, ng0);
    t3 = (t0 + 4624);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3984);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memset(t13, 0, 8);
    t16 = (t11 + 4);
    t22 = (t15 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t15);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t16);
    t10 = *((unsigned int *)t22);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t16);
    t20 = *((unsigned int *)t22);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB42;

LAB39:    if (t21 != 0)
        goto LAB41;

LAB40:    *((unsigned int *)t13) = 1;

LAB42:    t40 = (t0 + 3184);
    t46 = (t40 + 56U);
    t47 = *((char **)t46);
    t48 = (t0 + 3024);
    t49 = (t48 + 56U);
    t50 = *((char **)t49);
    memset(t51, 0, 8);
    t52 = (t47 + 4);
    t53 = (t50 + 4);
    t26 = *((unsigned int *)t47);
    t27 = *((unsigned int *)t50);
    t28 = (t26 ^ t27);
    t29 = *((unsigned int *)t52);
    t30 = *((unsigned int *)t53);
    t31 = (t29 ^ t30);
    t34 = (t28 | t31);
    t35 = *((unsigned int *)t52);
    t36 = *((unsigned int *)t53);
    t37 = (t35 | t36);
    t38 = (~(t37));
    t39 = (t34 & t38);
    if (t39 != 0)
        goto LAB46;

LAB43:    if (t37 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t51) = 1;

LAB46:    t41 = *((unsigned int *)t13);
    t42 = *((unsigned int *)t51);
    t43 = (t41 & t42);
    *((unsigned int *)t55) = t43;
    t56 = (t13 + 4);
    t57 = (t51 + 4);
    t58 = (t55 + 4);
    t44 = *((unsigned int *)t56);
    t45 = *((unsigned int *)t57);
    t59 = (t44 | t45);
    *((unsigned int *)t58) = t59;
    t60 = *((unsigned int *)t58);
    t61 = (t60 != 0);
    if (t61 == 1)
        goto LAB47;

LAB48:
LAB49:    t81 = (t55 + 4);
    t82 = *((unsigned int *)t81);
    t83 = (~(t82));
    t84 = *((unsigned int *)t55);
    t85 = (t84 & t83);
    t86 = (t85 != 0);
    if (t86 > 0)
        goto LAB50;

LAB51:    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 4464);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB52:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 3184);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng14)));
    memset(t13, 0, 8);
    t12 = (t5 + 4);
    t14 = (t11 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t12);
    t10 = *((unsigned int *)t14);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t12);
    t20 = *((unsigned int *)t14);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB56;

LAB53:    if (t21 != 0)
        goto LAB55;

LAB54:    *((unsigned int *)t13) = 1;

LAB56:    t16 = (t13 + 4);
    t26 = *((unsigned int *)t16);
    t27 = (~(t26));
    t28 = *((unsigned int *)t13);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB57;

LAB58:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 3184);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 16, t11, 32);
    t12 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 16, 0LL);

LAB59:    goto LAB25;

LAB28:    *((unsigned int *)t13) = 1;
    goto LAB30;

LAB29:    t22 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB30;

LAB31:    xsi_set_current_line(150, ng0);
    t40 = ((char*)((ng13)));
    t46 = (t0 + 4464);
    xsi_vlogvar_wait_assign_value(t46, t40, 0, 0, 8, 0LL);
    goto LAB33;

LAB34:    xsi_set_current_line(152, ng0);

LAB37:    xsi_set_current_line(153, ng0);
    t11 = (t0 + 3504);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memset(t13, 0, 8);
    t15 = (t13 + 4);
    t16 = (t14 + 4);
    t17 = *((unsigned int *)t14);
    t18 = (t17 >> 16);
    *((unsigned int *)t13) = t18;
    t19 = *((unsigned int *)t16);
    t20 = (t19 >> 16);
    *((unsigned int *)t15) = t20;
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 65535U);
    t24 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t24 & 65535U);
    t22 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t22, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 3504);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t13, 0, 8);
    t11 = (t13 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 65535U);
    t17 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t17 & 65535U);
    t14 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 4464);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 8, t11, 32);
    t12 = (t0 + 4464);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 8, 0LL);
    goto LAB36;

LAB41:    t23 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB42;

LAB45:    t54 = (t51 + 4);
    *((unsigned int *)t51) = 1;
    *((unsigned int *)t54) = 1;
    goto LAB46;

LAB47:    t62 = *((unsigned int *)t55);
    t63 = *((unsigned int *)t58);
    *((unsigned int *)t55) = (t62 | t63);
    t64 = (t13 + 4);
    t65 = (t51 + 4);
    t66 = *((unsigned int *)t13);
    t67 = (~(t66));
    t68 = *((unsigned int *)t64);
    t69 = (~(t68));
    t70 = *((unsigned int *)t51);
    t71 = (~(t70));
    t72 = *((unsigned int *)t65);
    t73 = (~(t72));
    t33 = (t67 & t69);
    t74 = (t71 & t73);
    t75 = (~(t33));
    t76 = (~(t74));
    t77 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t77 & t75);
    t78 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t78 & t76);
    t79 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t79 & t75);
    t80 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t80 & t76);
    goto LAB49;

LAB50:    xsi_set_current_line(159, ng0);
    t87 = ((char*)((ng1)));
    t88 = (t0 + 4464);
    xsi_vlogvar_wait_assign_value(t88, t87, 0, 0, 8, 0LL);
    goto LAB52;

LAB55:    t15 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB56;

LAB57:    xsi_set_current_line(163, ng0);

LAB60:    xsi_set_current_line(164, ng0);
    t22 = ((char*)((ng1)));
    t23 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 16, 0LL);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t13, 0, 8);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB64;

LAB62:    if (*((unsigned int *)t11) == 0)
        goto LAB61;

LAB63:    t12 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t12) = 1;

LAB64:    t14 = (t13 + 4);
    t15 = (t5 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (~(t17));
    *((unsigned int *)t13) = t18;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB66;

LAB65:    t25 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t25 & 1U);
    t26 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t26 & 1U);
    t16 = (t0 + 4624);
    xsi_vlogvar_wait_assign_value(t16, t13, 0, 0, 1, 0LL);
    goto LAB59;

LAB61:    *((unsigned int *)t13) = 1;
    goto LAB64;

LAB66:    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t15);
    *((unsigned int *)t13) = (t19 | t20);
    t21 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t21 | t24);
    goto LAB65;

}


extern void work_m_00000000001575181153_0149844336_init()
{
	static char *pe[] = {(void *)Always_65_0,(void *)Always_134_1};
	xsi_register_didat("work_m_00000000001575181153_0149844336", "isim/tb_sound_buffer_isim_beh.exe.sim/work/m_00000000001575181153_0149844336.didat");
	xsi_register_executes(pe);
}
