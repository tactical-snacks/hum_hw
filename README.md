# hum

Hour Utilization Monitor: a coin-cell data logger that timestamps machine run time using an accelerometer and RTC.

## Hardware

| Function | Part |
|---|---|
| MCU | STM32U031K8U6 (Cortex-M0+, UFQFPN-32) |
| RTC clock | 32.768 kHz crystal, ABS07-120 |
| Accelerometer | LIS2DTW12 (I²C, INT1 → PA0, INT2 → PA2) |
| Storage | 24FC512, 64 KB I²C EEPROM |
| Power | CR2032 in Keystone 3034 holder |
| UI | Button (PA1), green LED (PA8) |
| Debug | SWD, ARM 10-pin header |
| Comms | UART, PA9 TX / PA10 RX |

## Operation

- MCU sleeps in Stop 2 with the RTC running.
- The accelerometer detects activity on its own and wakes the MCU.
- Run start/stop events are logged to EEPROM as epoch timestamps, in a wear-levelled ring buffer.
- Clock set and log download over UART.
- Target battery life: 5+ years.

## Jumpers

- **J4:** in series with the battery. Remove it to measure current.
- **J1:** 3.3 V bench input. **Open J4 first.** Never use 5 V.

## Tools

KiCad, STM32CubeMX / STM32CubeIDE.

See [POWER_BUDGET.md](POWER_BUDGET.md).