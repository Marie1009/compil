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

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/peraire/PSI/psi_processor/banc_registre.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_3620187407;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_0926557375_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    unsigned int t19;

LAB0:    t1 = (t0 + 3624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng0);

LAB6:    t2 = (t0 + 4440);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 4440);
    *((int *)t6) = 0;
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)2);
    if (t5 != 0)
        goto LAB11;

LAB13:    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)3);
    if (t5 != 0)
        goto LAB16;

LAB17:
LAB12:    goto LAB2;

LAB5:    t4 = (t0 + 1952U);
    t5 = xsi_signal_has_event(t4);
    if (t5 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t6 = (t0 + 1992U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t3 = t9;
    goto LAB10;

LAB11:    xsi_set_current_line(69, ng0);
    t2 = xsi_get_transient_memory(128U);
    memset(t2, 0, 128U);
    t6 = t2;
    t10 = (8U * 1U);
    t7 = t6;
    memset(t7, (unsigned char)2, t10);
    t8 = (t10 != 0);
    if (t8 == 1)
        goto LAB14;

LAB15:    t12 = (t0 + 4552);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 128U);
    xsi_driver_first_trans_fast(t12);
    goto LAB12;

LAB14:    t11 = (128U / t10);
    xsi_mem_set_data(t6, t6, t10, t11);
    goto LAB15;

LAB16:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t2 = (t0 + 7200U);
    t17 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t7, t2);
    t18 = (t17 - 0);
    t10 = (t18 * 1);
    t11 = (8U * t10);
    t19 = (0U + t11);
    t12 = (t0 + 4552);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 8U);
    xsi_driver_first_trans_delta(t12, t19, 8U, 0LL);
    goto LAB12;

}

static void work_a_0926557375_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 7168U);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 7200U);
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t5, t4);
    if (t6 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t16 = (t0 + 2472U);
    t17 = *((char **)t16);
    t16 = (t0 + 1032U);
    t18 = *((char **)t16);
    t16 = (t0 + 7168U);
    t19 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t18, t16);
    t20 = (t19 - 0);
    t21 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t19);
    t22 = (8U * t21);
    t23 = (0 + t22);
    t24 = (t17 + t23);
    t25 = (t0 + 4616);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t24, 8U);
    xsi_driver_first_trans_fast_port(t25);

LAB2:    t30 = (t0 + 4456);
    *((int *)t30) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 1672U);
    t11 = *((char **)t7);
    t7 = (t0 + 4616);
    t12 = (t7 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB5:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    t1 = t10;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_0926557375_3212880686_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7184U);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 7200U);
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t5, t4);
    if (t6 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t16 = (t0 + 2472U);
    t17 = *((char **)t16);
    t16 = (t0 + 1192U);
    t18 = *((char **)t16);
    t16 = (t0 + 7184U);
    t19 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t18, t16);
    t20 = (t19 - 0);
    t21 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t19);
    t22 = (8U * t21);
    t23 = (0 + t22);
    t24 = (t17 + t23);
    t25 = (t0 + 4680);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t24, 8U);
    xsi_driver_first_trans_fast_port(t25);

LAB2:    t30 = (t0 + 4472);
    *((int *)t30) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 1672U);
    t11 = *((char **)t7);
    t7 = (t0 + 4680);
    t12 = (t7 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB5:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    t1 = t10;
    goto LAB7;

LAB9:    goto LAB2;

}


extern void work_a_0926557375_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0926557375_3212880686_p_0,(void *)work_a_0926557375_3212880686_p_1,(void *)work_a_0926557375_3212880686_p_2};
	xsi_register_didat("work_a_0926557375_3212880686", "isim/processor_test_isim_beh.exe.sim/work/a_0926557375_3212880686.didat");
	xsi_register_executes(pe);
}
