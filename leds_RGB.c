#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

#include "xgpio.h"
#include "Leds_RGB.h"
#include "xil_assert.h"
#include "xparameters.h"
#include "xil_exception.h"

XGpio led_RGB;

int Configure_leds_RGB_ctrl()
{
	XGpio_Initialize(&led_RGB, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&led_RGB, 1, 0x0); //set first channel 1 tristate buffer 0x0 outputs
	return 0;
}

int set_LED(int LED_num, int logic_level)
{

	u32 LED_mask;

	switch (LED_num){
	case 0:
		LED_mask = LED0;
		break;
	case 1:
		LED_mask = LED1;
		break;
	case 2:
		LED_mask = LED2;
		break;
	case 3:
		LED_mask = LED3;
		break;
	default:
		LED_mask = ALL_LEDS;
		break;
	}

	if (logic_level == 0){
		// set LED low
		XGpio_DiscreteClear(&led_RGB, 1, LED_mask);
	} else {
		// set LED high
		XGpio_DiscreteSet(&led_RGB, 1, LED_mask);
	}

	return XST_SUCCESS;

}
int clear_LEDs(){

	u32 LED_mask;
	LED_mask = ALL_LEDS;

	XGpio_DiscreteClear(&led_RGB, 1, LED_mask);

	return XST_SUCCESS;
}

int assert_LEDs(){

	u32 LED_mask;
	LED_mask = ALL_LEDS;

	XGpio_DiscreteSet(&led_RGB, 1, LED_mask);

	return XST_SUCCESS;

}
