#![no_std]
#![no_main]

use arduino_hal::prelude::_unwrap_infallible_UnwrapInfallible;
use panic_halt as _;
use ufmt::uWrite;

#[arduino_hal::entry]
fn main() -> ! {
    let dp = arduino_hal::Peripherals::take().unwrap();
    let pins = arduino_hal::pins!(dp);
    let mut serial=arduino_hal::default_serial!(dp, pins, 57600);

    serial.write_str("starting...").unwrap();

    let mut out = pins.d8.into_output();
    out.set_high();

    let mut adc=arduino_hal::Adc::new(dp.ADC, Default::default());
    let input=pins.a0.into_analog_input(&mut adc);

    loop {
        //led.toggle();
        let voltage=input.analog_read(&mut adc);
        ufmt::uwrite!(serial, "{}\n", voltage).unwrap_infallible();
        arduino_hal::delay_ms(1000);
    }
}
