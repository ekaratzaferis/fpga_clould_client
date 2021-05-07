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
static unsigned int ng3[] = {22079U, 0U};
static unsigned int ng4[] = {5U, 0U};
static int ng5[] = {2, 0};
static int ng6[] = {23, 0};
static int ng7[] = {16, 0};
static int ng8[] = {3, 0};
static int ng9[] = {15, 0};
static int ng10[] = {8, 0};
static int ng11[] = {4, 0};
static int ng12[] = {7, 0};
static int ng13[] = {5, 0};
static int ng14[] = {0, 0, 0, 0, 0, 0};
static int ng15[] = {239, 0};
static int ng16[] = {91, 0};



static void Always_50_0(char *t0)
{
    char t13[8];
    char t49[8];
    char t50[8];
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
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    int t48;
    int t51;
    int t52;
    int t53;
    int t54;
    int t55;
    int t56;
    int t57;
    int t58;

LAB0:    t1 = (t0 + 5888U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 6704);
    *((int *)t2) = 1;
    t3 = (t0 + 5920);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(60, ng0);

LAB10:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:
LAB13:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3848);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB14;

LAB15:
LAB16:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3848);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB63;

LAB64:
LAB65:
LAB31:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(52, ng0);

LAB9:    xsi_set_current_line(53, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 15, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 24, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 3208);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t11, 8, t12, 32);
    t14 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 8, 0LL);
    goto LAB13;

LAB14:    xsi_set_current_line(65, ng0);

LAB17:    xsi_set_current_line(67, ng0);
    t11 = (t0 + 2728);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t14);
    t19 = (t18 & t17);
    t20 = (t19 != 0);
    if (t20 > 0)
        goto LAB18;

LAB19:
LAB20:    goto LAB16;

LAB18:    xsi_set_current_line(67, ng0);

LAB21:    xsi_set_current_line(68, ng0);
    t21 = (t0 + 2888);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = ((char*)((ng3)));
    memset(t13, 0, 8);
    t25 = (t23 + 4);
    t26 = (t24 + 4);
    t27 = *((unsigned int *)t23);
    t28 = *((unsigned int *)t24);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t25);
    t31 = *((unsigned int *)t26);
    t32 = (t30 ^ t31);
    t33 = (t29 | t32);
    t34 = *((unsigned int *)t25);
    t35 = *((unsigned int *)t26);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB25;

LAB22:    if (t36 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t13) = 1;

LAB25:    t40 = (t13 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t13);
    t44 = (t43 & t42);
    t45 = (t44 != 0);
    if (t45 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 15, t5, 32);
    t11 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 15, 0LL);

LAB28:    goto LAB20;

LAB24:    t39 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB25;

LAB26:    xsi_set_current_line(68, ng0);
    t46 = ((char*)((ng1)));
    t47 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t47, t46, 0, 0, 15, 0LL);
    goto LAB28;

LAB29:    xsi_set_current_line(75, ng0);

LAB32:    xsi_set_current_line(77, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t27 = (~(t20));
    t28 = (t17 & t27);
    if (t28 != 0)
        goto LAB36;

LAB33:    if (t20 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t13) = 1;

LAB36:    t15 = (t13 + 4);
    t29 = *((unsigned int *)t15);
    t30 = (~(t29));
    t31 = *((unsigned int *)t13);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB37;

LAB38:    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB39:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB40:    t5 = ((char*)((ng2)));
    t48 = xsi_vlog_unsigned_case_compare(t4, 8, t5, 32);
    if (t48 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng5)));
    t48 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t48 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng8)));
    t48 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t48 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng11)));
    t48 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t48 == 1)
        goto LAB47;

LAB48:    t2 = ((char*)((ng13)));
    t48 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t48 == 1)
        goto LAB49;

LAB50:
LAB51:    goto LAB31;

LAB35:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB36;

LAB37:    xsi_set_current_line(80, ng0);
    t21 = ((char*)((ng2)));
    t22 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t22, t21, 0, 0, 1, 0LL);
    goto LAB39;

LAB41:    xsi_set_current_line(84, ng0);

LAB52:    xsi_set_current_line(85, ng0);
    t11 = (t0 + 1848U);
    t12 = *((char **)t11);
    t11 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 8, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 8, t11, 32);
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 8, 0LL);
    goto LAB51;

LAB43:    xsi_set_current_line(89, ng0);

LAB53:    xsi_set_current_line(90, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 3368);
    t5 = (t0 + 3368);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng6)));
    t15 = ((char*)((ng7)));
    xsi_vlog_convert_partindices(t13, t49, t50, ((int*)(t12)), 2, t14, 32, 1, t15, 32, 1);
    t21 = (t13 + 4);
    t6 = *((unsigned int *)t21);
    t48 = (!(t6));
    t22 = (t49 + 4);
    t7 = *((unsigned int *)t22);
    t51 = (!(t7));
    t52 = (t48 && t51);
    t23 = (t50 + 4);
    t8 = *((unsigned int *)t23);
    t53 = (!(t8));
    t54 = (t52 && t53);
    if (t54 == 1)
        goto LAB54;

LAB55:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 8, t11, 32);
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 8, 0LL);
    goto LAB51;

LAB45:    xsi_set_current_line(94, ng0);

LAB56:    xsi_set_current_line(95, ng0);
    t3 = (t0 + 1848U);
    t5 = *((char **)t3);
    t3 = (t0 + 3368);
    t11 = (t0 + 3368);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t15 = ((char*)((ng9)));
    t21 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t13, t49, t50, ((int*)(t14)), 2, t15, 32, 1, t21, 32, 1);
    t22 = (t13 + 4);
    t6 = *((unsigned int *)t22);
    t51 = (!(t6));
    t23 = (t49 + 4);
    t7 = *((unsigned int *)t23);
    t52 = (!(t7));
    t53 = (t51 && t52);
    t24 = (t50 + 4);
    t8 = *((unsigned int *)t24);
    t54 = (!(t8));
    t55 = (t53 && t54);
    if (t55 == 1)
        goto LAB57;

LAB58:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 8, t11, 32);
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 8, 0LL);
    goto LAB51;

LAB47:    xsi_set_current_line(98, ng0);

LAB59:    xsi_set_current_line(99, ng0);
    t3 = (t0 + 1848U);
    t5 = *((char **)t3);
    t3 = (t0 + 3368);
    t11 = (t0 + 3368);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t15 = ((char*)((ng12)));
    t21 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t13, t49, t50, ((int*)(t14)), 2, t15, 32, 1, t21, 32, 1);
    t22 = (t13 + 4);
    t6 = *((unsigned int *)t22);
    t51 = (!(t6));
    t23 = (t49 + 4);
    t7 = *((unsigned int *)t23);
    t52 = (!(t7));
    t53 = (t51 && t52);
    t24 = (t50 + 4);
    t8 = *((unsigned int *)t24);
    t54 = (!(t8));
    t55 = (t53 && t54);
    if (t55 == 1)
        goto LAB60;

LAB61:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 8, t11, 32);
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 8, 0LL);
    goto LAB51;

LAB49:    xsi_set_current_line(102, ng0);

LAB62:    xsi_set_current_line(103, ng0);
    t3 = (t0 + 1848U);
    t5 = *((char **)t3);
    t3 = (t0 + 3368);
    t11 = (t3 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t13, 32, 32, 2U, t12, 24, t5, 8);
    t14 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 32, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB51;

LAB54:    t9 = *((unsigned int *)t50);
    t55 = (t9 + 0);
    t10 = *((unsigned int *)t13);
    t16 = *((unsigned int *)t49);
    t56 = (t10 - t16);
    t57 = (t56 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, t55, *((unsigned int *)t49), t57, 0LL);
    goto LAB55;

LAB57:    t9 = *((unsigned int *)t50);
    t56 = (t9 + 0);
    t10 = *((unsigned int *)t13);
    t16 = *((unsigned int *)t49);
    t57 = (t10 - t16);
    t58 = (t57 + 1);
    xsi_vlogvar_wait_assign_value(t3, t5, t56, *((unsigned int *)t49), t58, 0LL);
    goto LAB58;

LAB60:    t9 = *((unsigned int *)t50);
    t56 = (t9 + 0);
    t10 = *((unsigned int *)t13);
    t16 = *((unsigned int *)t49);
    t57 = (t10 - t16);
    t58 = (t57 + 1);
    xsi_vlogvar_wait_assign_value(t3, t5, t56, *((unsigned int *)t49), t58, 0LL);
    goto LAB61;

LAB63:    xsi_set_current_line(109, ng0);

LAB66:    xsi_set_current_line(110, ng0);
    t12 = ((char*)((ng1)));
    t14 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, 0, 8, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 24, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB65;

}

static void Always_130_1(char *t0)
{
    char t13[24];
    char t15[8];
    char t35[8];
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
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;

LAB0:    t1 = (t0 + 6136U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 6720);
    *((int *)t2) = 1;
    t3 = (t0 + 6168);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(130, ng0);

LAB5:    xsi_set_current_line(132, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(142, ng0);

LAB10:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng14)));
    xsi_vlog_unsigned_not_equal(t13, 92, t4, 92, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB13:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 4648);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 4968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng15)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB28;

LAB25:    if (t20 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t15) = 1;

LAB28:    t23 = (t15 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t15);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB29;

LAB30:
LAB31:
LAB16:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB33;

LAB34:
LAB35:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(132, ng0);

LAB9:    xsi_set_current_line(133, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 15, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(144, ng0);
    t12 = ((char*)((ng2)));
    t14 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, 0, 1, 0LL);
    goto LAB13;

LAB14:    xsi_set_current_line(147, ng0);

LAB17:    xsi_set_current_line(148, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 4968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB21;

LAB18:    if (t20 != 0)
        goto LAB20;

LAB19:    *((unsigned int *)t15) = 1;

LAB21:    t23 = (t15 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t15);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB22;

LAB23:
LAB24:    goto LAB16;

LAB20:    t14 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB21;

LAB22:    xsi_set_current_line(149, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 1, 0LL);
    goto LAB24;

LAB27:    t14 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB28;

LAB29:    xsi_set_current_line(151, ng0);

LAB32:    xsi_set_current_line(153, ng0);
    t29 = ((char*)((ng2)));
    t30 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 1, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB31;

LAB33:    xsi_set_current_line(157, ng0);

LAB36:    xsi_set_current_line(160, ng0);
    t11 = (t0 + 3688);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    t23 = (t0 + 3688);
    t29 = (t23 + 72U);
    t30 = *((char **)t29);
    t31 = (t0 + 4808);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    xsi_vlog_generic_get_index_select_value(t15, 1, t14, t30, 2, t33, 8, 2);
    t34 = (t15 + 4);
    t16 = *((unsigned int *)t34);
    t17 = (~(t16));
    t18 = *((unsigned int *)t15);
    t19 = (t18 & t17);
    t20 = (t19 != 0);
    if (t20 > 0)
        goto LAB37;

LAB38:    xsi_set_current_line(164, ng0);

LAB41:    xsi_set_current_line(165, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);

LAB39:    xsi_set_current_line(170, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB42;

LAB43:
LAB44:    goto LAB35;

LAB37:    xsi_set_current_line(160, ng0);

LAB40:    xsi_set_current_line(161, ng0);
    t36 = (t0 + 2008U);
    t37 = *((char **)t36);
    memset(t35, 0, 8);
    t36 = (t35 + 4);
    t38 = (t37 + 4);
    t21 = *((unsigned int *)t37);
    t22 = (t21 >> 16);
    *((unsigned int *)t35) = t22;
    t24 = *((unsigned int *)t38);
    t25 = (t24 >> 16);
    *((unsigned int *)t36) = t25;
    t26 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t26 & 65535U);
    t27 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t27 & 65535U);
    t39 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t39, t35, 0, 0, 16, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    memset(t15, 0, 8);
    t2 = (t15 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t15) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t10 & 65535U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 65535U);
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t15, 0, 0, 16, 0LL);
    goto LAB39;

LAB42:    xsi_set_current_line(170, ng0);

LAB45:    xsi_set_current_line(172, ng0);
    t4 = (t0 + 4168);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng3)));
    memset(t15, 0, 8);
    t14 = (t11 + 4);
    t23 = (t12 + 4);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t23);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t24 = *((unsigned int *)t14);
    t25 = *((unsigned int *)t23);
    t26 = (t24 | t25);
    t27 = (~(t26));
    t28 = (t22 & t27);
    if (t28 != 0)
        goto LAB49;

LAB46:    if (t26 != 0)
        goto LAB48;

LAB47:    *((unsigned int *)t15) = 1;

LAB49:    t30 = (t15 + 4);
    t40 = *((unsigned int *)t30);
    t41 = (~(t40));
    t42 = *((unsigned int *)t15);
    t43 = (t42 & t41);
    t44 = (t43 != 0);
    if (t44 > 0)
        goto LAB50;

LAB51:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t4, 15, t5, 32);
    t11 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t11, t15, 0, 0, 15, 0LL);

LAB52:    xsi_set_current_line(176, ng0);
    t2 = (t0 + 4968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng15)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB56;

LAB53:    if (t20 != 0)
        goto LAB55;

LAB54:    *((unsigned int *)t15) = 1;

LAB56:    t23 = (t15 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t15);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB57;

LAB58:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 4968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t4, 8, t5, 32);
    t11 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t11, t15, 0, 0, 8, 0LL);

LAB59:    goto LAB44;

LAB48:    t29 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB49;

LAB50:    xsi_set_current_line(172, ng0);
    t31 = ((char*)((ng1)));
    t32 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t32, t31, 0, 0, 15, 0LL);
    goto LAB52;

LAB55:    t14 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB56;

LAB57:    xsi_set_current_line(176, ng0);

LAB60:    xsi_set_current_line(178, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 8, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 4808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng16)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB64;

LAB61:    if (t20 != 0)
        goto LAB63;

LAB62:    *((unsigned int *)t15) = 1;

LAB64:    t23 = (t15 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t15);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB65;

LAB66:    xsi_set_current_line(180, ng0);
    t2 = (t0 + 4808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t4, 8, t5, 32);
    t11 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t11, t15, 0, 0, 8, 0LL);

LAB67:    goto LAB59;

LAB63:    t14 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB64;

LAB65:    xsi_set_current_line(179, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 8, 0LL);
    goto LAB67;

}

static void Always_192_2(char *t0)
{
    char t10[8];
    char t54[8];
    char t78[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    char *t77;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    char *t85;
    unsigned int t86;
    int t87;

LAB0:    t1 = (t0 + 6384U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(192, ng0);
    t2 = (t0 + 6736);
    *((int *)t2) = 1;
    t3 = (t0 + 6416);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(192, ng0);

LAB5:    xsi_set_current_line(193, ng0);
    t4 = (t0 + 4008);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 4488);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t9);
    t13 = (t11 & t12);
    *((unsigned int *)t10) = t13;
    t14 = (t6 + 4);
    t15 = (t9 + 4);
    t16 = (t10 + 4);
    t17 = *((unsigned int *)t14);
    t18 = *((unsigned int *)t15);
    t19 = (t17 | t18);
    *((unsigned int *)t16) = t19;
    t20 = *((unsigned int *)t16);
    t21 = (t20 != 0);
    if (t21 == 1)
        goto LAB6;

LAB7:
LAB8:    t42 = (t10 + 4);
    t43 = *((unsigned int *)t42);
    t44 = (~(t43));
    t45 = *((unsigned int *)t10);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(200, ng0);

LAB27:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 4488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t11 = *((unsigned int *)t5);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t17 = (t13 & t12);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB28;

LAB29:
LAB30:    xsi_set_current_line(202, ng0);
    t2 = (t0 + 4008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t11 = *((unsigned int *)t5);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t17 = (t13 & t12);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB33;

LAB34:
LAB35:
LAB11:    goto LAB2;

LAB6:    t22 = *((unsigned int *)t10);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t10) = (t22 | t23);
    t24 = (t6 + 4);
    t25 = (t9 + 4);
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t24);
    t29 = (~(t28));
    t30 = *((unsigned int *)t9);
    t31 = (~(t30));
    t32 = *((unsigned int *)t25);
    t33 = (~(t32));
    t34 = (t27 & t29);
    t35 = (t31 & t33);
    t36 = (~(t34));
    t37 = (~(t35));
    t38 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t38 & t36);
    t39 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t39 & t37);
    t40 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t40 & t36);
    t41 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t41 & t37);
    goto LAB8;

LAB9:    xsi_set_current_line(193, ng0);

LAB12:    xsi_set_current_line(194, ng0);
    t48 = (t0 + 4808);
    t49 = (t48 + 56U);
    t50 = *((char **)t49);
    t51 = (t0 + 3528);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memset(t54, 0, 8);
    t55 = (t50 + 4);
    t56 = (t53 + 4);
    t57 = *((unsigned int *)t50);
    t58 = *((unsigned int *)t53);
    t59 = (t57 ^ t58);
    t60 = *((unsigned int *)t55);
    t61 = *((unsigned int *)t56);
    t62 = (t60 ^ t61);
    t63 = (t59 | t62);
    t64 = *((unsigned int *)t55);
    t65 = *((unsigned int *)t56);
    t66 = (t64 | t65);
    t67 = (~(t66));
    t68 = (t63 & t67);
    if (t68 != 0)
        goto LAB16;

LAB13:    if (t66 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t54) = 1;

LAB16:    t70 = (t54 + 4);
    t71 = *((unsigned int *)t70);
    t72 = (~(t71));
    t73 = *((unsigned int *)t54);
    t74 = (t73 & t72);
    t75 = (t74 != 0);
    if (t75 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(195, ng0);

LAB22:    xsi_set_current_line(196, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    t4 = (t0 + 3688);
    t5 = (t4 + 72U);
    t6 = *((char **)t5);
    t7 = (t0 + 4808);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_generic_convert_bit_index(t10, t6, 2, t9, 8, 2);
    t14 = (t10 + 4);
    t11 = *((unsigned int *)t14);
    t34 = (!(t11));
    if (t34 == 1)
        goto LAB23;

LAB24:    xsi_set_current_line(197, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3688);
    t4 = (t0 + 3688);
    t5 = (t4 + 72U);
    t6 = *((char **)t5);
    t7 = (t0 + 3528);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_generic_convert_bit_index(t10, t6, 2, t9, 8, 2);
    t14 = (t10 + 4);
    t11 = *((unsigned int *)t14);
    t34 = (!(t11));
    if (t34 == 1)
        goto LAB25;

LAB26:
LAB19:    goto LAB11;

LAB15:    t69 = (t54 + 4);
    *((unsigned int *)t54) = 1;
    *((unsigned int *)t69) = 1;
    goto LAB16;

LAB17:    xsi_set_current_line(194, ng0);
    t76 = ((char*)((ng2)));
    t77 = (t0 + 3688);
    t79 = (t0 + 3688);
    t80 = (t79 + 72U);
    t81 = *((char **)t80);
    t82 = (t0 + 3528);
    t83 = (t82 + 56U);
    t84 = *((char **)t83);
    xsi_vlog_generic_convert_bit_index(t78, t81, 2, t84, 8, 2);
    t85 = (t78 + 4);
    t86 = *((unsigned int *)t85);
    t87 = (!(t86));
    if (t87 == 1)
        goto LAB20;

LAB21:    goto LAB19;

LAB20:    xsi_vlogvar_wait_assign_value(t77, t76, 0, *((unsigned int *)t78), 1, 0LL);
    goto LAB21;

LAB23:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t10), 1, 0LL);
    goto LAB24;

LAB25:    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t10), 1, 0LL);
    goto LAB26;

LAB28:    xsi_set_current_line(201, ng0);
    t6 = ((char*)((ng1)));
    t7 = (t0 + 3688);
    t8 = (t0 + 3688);
    t9 = (t8 + 72U);
    t14 = *((char **)t9);
    t15 = (t0 + 4808);
    t16 = (t15 + 56U);
    t24 = *((char **)t16);
    xsi_vlog_generic_convert_bit_index(t10, t14, 2, t24, 8, 2);
    t25 = (t10 + 4);
    t19 = *((unsigned int *)t25);
    t34 = (!(t19));
    if (t34 == 1)
        goto LAB31;

LAB32:    goto LAB30;

LAB31:    xsi_vlogvar_wait_assign_value(t7, t6, 0, *((unsigned int *)t10), 1, 0LL);
    goto LAB32;

LAB33:    xsi_set_current_line(202, ng0);
    t6 = ((char*)((ng2)));
    t7 = (t0 + 3688);
    t8 = (t0 + 3688);
    t9 = (t8 + 72U);
    t14 = *((char **)t9);
    t15 = (t0 + 3528);
    t16 = (t15 + 56U);
    t24 = *((char **)t16);
    xsi_vlog_generic_convert_bit_index(t10, t14, 2, t24, 8, 2);
    t25 = (t10 + 4);
    t19 = *((unsigned int *)t25);
    t34 = (!(t19));
    if (t34 == 1)
        goto LAB36;

LAB37:    goto LAB35;

LAB36:    xsi_vlogvar_wait_assign_value(t7, t6, 0, *((unsigned int *)t10), 1, 0LL);
    goto LAB37;

}


extern void work_m_00000000003030129904_0149844336_init()
{
	static char *pe[] = {(void *)Always_50_0,(void *)Always_130_1,(void *)Always_192_2};
	xsi_register_didat("work_m_00000000003030129904_0149844336", "isim/sound_buffering_isim_beh.exe.sim/work/m_00000000003030129904_0149844336.didat");
	xsi_register_executes(pe);
}
