#ifndef __Leds_RGB_H_
#define __Leds_RGB_H_


int Configure_leds_RGB_ctrl();
int set_LED(int LED_num, int logic_level);
int clear_LEDs();
int assert_LEDs();

#define led_RGB_DeviceID    XPAR_AXI_GPIO_0_DEVICE_ID
#define LED0                0x00000001
#define LED1                0x00000002
#define LED2                0x00000004
#define LED3                0x00000008
#define ALL_LEDS            0x0000000f


#endif /* Leds_RGB_H_ */
