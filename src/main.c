#include <stdint.h>
#include <stdbool.h>

#include "inc/hw_memmap.h"

#include "driverlib/gpio.h"
#include "driverlib/sysctl.h"

int main(void)
{
    // set clock speed to 80 MHz
    SysCtlClockSet(SYSCTL_SYSDIV_2_5 | SYSCTL_USE_PLL | SYSCTL_XTAL_16MHZ | SYSCTL_OSC_MAIN);

    // Initialize the GPIO pin attached to the Green LED
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_3);

    while(1)
    {
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, GPIO_PIN_3);
        SysCtlDelay(SysCtlClockGet() / 6); // ~1s delay

        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 0x0);
        SysCtlDelay(SysCtlClockGet() / 6); // ~1s delay
    }

}
