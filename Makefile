TARGET                  := arm-none-eabi
CC                      := $(TARGET)-gcc
CXX                     := $(TARGET)-g++
AS                      := $(TARGET)-as
OBJCOPY                 := $(TARGET)-objcopy
SIZE                    := $(TARGET)-size
GDB                     := $(TARGET)-gdb

# Project metadata
PROJECT = LoRaMac-node

# Where build products go
BUILD                   := build
OBJ                      = $(BUILD)/obj
OBJECTS                  = $(addprefix $(OBJ)/, $(C_SRC:.c=.o) $(CXX_SRC:.cc=.o) $(AS_SRC:.s=.o))

# Include paths
IPATH                   +=  ./src/apps/LoRaMac/classA/NAMote72
IPATH                   +=  ./src
IPATH                   +=  ./src/boards/NAMote72
IPATH                   +=  ./src/boards/NAMote72/cmsis
IPATH                   +=  ./src/boards/mcu/stm32
IPATH                   +=  ./src/boards/mcu/stm32/cmsis
IPATH                   +=  ./src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Inc
IPATH                   +=  ./src/mac
IPATH                   +=  ./src/mac/region
IPATH                   +=  ./src/peripherals
IPATH                   +=  ./src/radio
IPATH                   +=  ./src/system
IPATH                   +=  ./src/system/crypto

# Libraries to link against
LIBS                    += nosys
LIBS                    += c
LIBS                    += m
LIBS                    += gcc

# Source files
C_SRC                   += src/apps/LoRaMac/classA/NAMote72/main.c
C_SRC                   += src/boards/NaMote72/adc-board.c
C_SRC                   += src/boards/NaMote72/board.c
C_SRC                   += src/boards/NaMote72/gpio-board.c
C_SRC                   += src/boards/NaMote72/gps-board.c
C_SRC                   += src/boards/NaMote72/i2c-board.c
C_SRC                   += src/boards/NaMote72/rtc-board.c
C_SRC                   += src/boards/NaMote72/spi-board.c
C_SRC                   += src/boards/NaMote72/sx1272-board.c
C_SRC                   += src/boards/NaMote72/uart-board.c
C_SRC                   += src/boards/NaMote72/cmsis/arm-gcc/startup_stm32l152xc.c
C_SRC                   += src/boards/NaMote72/cmsis/system_stm32l1xx.c

C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc_ex.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2c.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc_ex.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi_ex.c
C_SRC                   += src/boards/mcu/stm32/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.c

C_SRC                   += src/boards/mcu/stm32/sysIrqHandlers.c
C_SRC                   += src/boards/mcu/stm32/utilities.c

C_SRC                   += src/mac/LoRaMac.c
C_SRC                   += src/mac/LoRaMacCrypto.c

C_SRC                   += src/peripherals/gpio-ioe.c
C_SRC                   += src/peripherals/mag3110.c
C_SRC                   += src/peripherals/mma8451.c
C_SRC                   += src/peripherals/mpl3115.c
C_SRC                   += src/peripherals/sx1509.c
C_SRC                   += src/peripherals/sx9500.c

C_SRC                   += src/radio/sx1272/sx1272.c

C_SRC                   += src/system/adc.c
C_SRC                   += src/system/delay.c
C_SRC                   += src/system/fifo.c
C_SRC                   += src/system/gpio.c
C_SRC                   += src/system/gps.c
C_SRC                   += src/system/i2c.c
C_SRC                   += src/system/timer.c
C_SRC                   += src/system/uart.c

C_SRC                   += src/system/crypto/aes.c
C_SRC                   += src/system/crypto/cmac.c

C_SRC                   += src/mac/region/Region.c
C_SRC                   += src/mac/region/RegionAS923.c
C_SRC                   += src/mac/region/RegionAU915.c
C_SRC                   += src/mac/region/RegionCN470.c
C_SRC                   += src/mac/region/RegionCN779.c
C_SRC                   += src/mac/region/RegionCommon.c
C_SRC                   += src/mac/region/RegionEU433.c
C_SRC                   += src/mac/region/RegionEU868.c
C_SRC                   += src/mac/region/RegionIN865.c
C_SRC                   += src/mac/region/RegionKR920.c
C_SRC                   += src/mac/region/RegionUS915-Hybrid.c
C_SRC                   += src/mac/region/RegionUS915.c

CPP_SRC                 += 
AS_SRC                  += $(wildcard src/*.s)

# CPU Flags
CPUFLAGS                += -mcpu=cortex-m3
CPUFLAGS                += -mthumb

# Compiler flags
CFLAGS                  += -DRTE_
CFLAGS                  += -DSTM32L152xC
CFLAGS                  += -DUSE_HAL_DRIVER
CFLAGS                  += -DREGION_US915
CFLAGS                  += -std=gnu99
CFLAGS                  += -lm
CFLAGS                  += -Wall
CFLAGS                  += -Wextra
CFLAGS                  += -Wno-unused-parameter
CFLAGS                  += -Wno-missing-field-initializers
ifdef DEBUG
CFLAGS                  += -DDEBUG
CFLAGS                  += -g
else
CFLAGS                  += -DNDEBUG
CFLAGS                  += -O3
CFLAGS                  += -flto
endif
CFLAGS                  += -fmessage-length=0
CFLAGS                  += -fno-exceptions
CFLAGS                  += -fno-builtin
CFLAGS                  += -ffunction-sections
CFLAGS                  += -fdata-sections
CFLAGS                  += -funsigned-char
CFLAGS                  += -MMD
CFLAGS                  += -fno-delete-null-pointer-checks
CFLAGS                  += -fomit-frame-pointer
CFLAGS                  += -Os
CFLAGS                  += $(CPUFLAGS)
CFLAGS                  += $(addprefix -I,$(IPATH))


CPPFLAGS                += -DRTE_
CPPFLAGS                += -DSTM32L152xC
CPPFLAGS                += -DUSE_HAL_DRIVER
CPPFLAGS                += -DUSE_BAND_915
CPPFLAGS                += -std=gnu++98
CPPFLAGS                += -fno-rtti
CPPFLAGS                += -Wvla
CPPFLAGS                += -c
CPPFLAGS                += -Wall
CPPFLAGS                += -Wextra
ifdef DEBUG
CPPFLAGS                += -DDEBUG
CPPFLAGS                += -g
else
CPPFLAGS                += -DNDEBUG
CPPFLAGS                += -O3
CPPFLAGS                += -flto
endif
CPPFLAGS                += -Wno-unused-parameter
CPPFLAGS                += -Wno-missing-field-initializers
CPPFLAGS                += -fmessage-length=0
CPPFLAGS                += -fno-exceptions
CPPFLAGS                += -fno-builtin
CPPFLAGS                += -ffunction-sections
CPPFLAGS                += -fdata-sections
CPPFLAGS                += -funsigned-char
CPPFLAGS                += -MMD
CPPFLAGS                += -fno-delete-null-pointer-checks
CPPFLAGS                += -fomit-frame-pointer
CPPFLAGS                += -Os
CPPFLAGS                += $(CPUFLAGS)
CPPFLAGS                += $(addprefix -I,$(IPATH))

ASFLAGS                 += $(CPUFLAGS)

# Linker flags
LDFLAGS                 += --specs=nano.specs
LDFLAGS                 += --specs=nosys.specs
LDFLAGS                 += $(CPUFLAGS)
LDFLAGS                 += -T ./src/boards/NAMote72/cmsis/arm-gcc/stm32l152xc_flash.ld

# Build directories
DIRS                    += $(BUILD)
DIRS                    += $(sort $(dir $(OBJECTS)))

clean :
	@rm -rf $(BUILD)

$(DIRS) :
	@echo Creating $(@)
	@mkdir -p $(@)

all: $(DIRS) | $(BUILD)/$(PROJECT).bin

$(BUILD)/$(PROJECT).bin: $(BUILD)/$(PROJECT).elf
	@echo Converting $(<) to $(@)
	@$(OBJCOPY) -O binary $(<) $(@)

$(BUILD)/$(PROJECT).elf : $(OBJECTS)
	@echo Linking $(@)
	@$(CC) $(LDFLAGS) $^ -o $@ -lm
	@$(SIZE) $(@)

$(OBJ)/%.o : %.c
	@echo Compiling $(<F)
	@$(CC) $(CFLAGS) -c $< -o $(@)

$(OBJ)/%.o : %.cpp
	@echo Compiling $(<F)
	@$(CXX) $(CXXFLAGS) -c $< -o $(@)

$(OBJ)/%.o : %.s
	@echo Assembling $(<F)
	@$(AS) $(ASFLAGS) $< -o $(@)

debug :
	$(GDB) $(BUILD)/$(PROJECT).elf

.PHONY : all clean default debug

