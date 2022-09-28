
function ender3_read_512k {
    openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c init -c "reset halt" -c "flash read_bank 0 ender3_firmware_$(date).bin 0 0x10000000" -c "reset" -c shutdown
}

function ender3_read_256k {
    openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c init -c "reset halt" -c "flash read_bank 0 ender3_firmware_$(date).bin 0 0x1000000" -c "reset" -c shutdown
}

####
#ender3_write <file.bin>
function ender3_write {
    if [ -f "$1" ]
    then
        openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c init -c "reset halt" -c "flash write_image erase $1 0x08000000" -c "reset" -c shutdown
    fi
}