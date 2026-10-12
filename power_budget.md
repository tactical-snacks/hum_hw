# Power budget

Estimates at 3 V, 25 °C. Verify on hardware with a µA meter across J4.

## Average current

| Item | Condition | Current |
|---|---|---|
| STM32U031 | Stop 2, RTC on LSE | 0.74 µA |
| LIS2DTW12 | Low-power, activity detection | ~1 µA |
| 24FC512 | Standby (typ / max) | 0.1 / 1 µA |
| MCU wakeups | ~1 ms at ~1 mA, once per minute | ~0.02 µA |
| EEPROM commits | 5 mA × 5 ms, every 10 min | ~0.04 µA |
| LED blink | 0.5 mA × 10 ms, once per minute | ~0.08 µA |
| **Total** | Typical / worst case | **~2 / ~3 µA** |

## Battery life

CR2032 ≈ 220 mAh.

| Case | Life |
|---|---|
| Typical (2 µA) | ~12 years |
| Worst case (3 µA) | ~8 years |

Cell shelf life (~10 years) sets the practical limit.

## Risks

- Pins left floating instead of in analog mode
- Debug-in-Stop (DBGMCU) left enabled
- Long or frequent UART sessions
- Heat, which raises leakage
- Aged-cell voltage sag during pulse loads (LED, EEPROM writes)