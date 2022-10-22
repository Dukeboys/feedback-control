# Hardware Design

This is for capturing hardware requirements, part selection, and similar information.

The hardware architecture selected for this project is a modular and extensible one with modules connecting through simple (2-6 wire) interfaces.

The following modules are currently envisioned:
1. Processor
2. Turret
3. Propellor Arm

## Procesor

The processor is the brains of this system. This module is based around an embedded processor and contains additional circuitry and wiring to provide a range of IO.

Parts:
1. [Beaglebone black SBC](https://beagleboard.org/black)
2. [Universal DC Li-Ion/Lo-PO charger board](https://www.adafruit.com/product/4755)
3. [Boost regulator](https://www.amazon.com/Module-Output-Voltage-Converter-Regulator/dp/B08NCM9ZPQ) (Part choice non-critical)
4. [USB A cable](https://www.showmecables.com/usb-2-0-extension-cable-a-male-a-female-6-in?color=94&length=21&gclid=Cj0KCQiAveebBhD_ARIsAFaAvrEorrQQnU8qFvxnLn_cspjKOoTsanmpFg8jB9jZeqhWSiYm5delVv4aAh1NEALw_wcB)
5. [Ethernet patch cable](https://www.amazon.com/Extension-Haokiang-Ethernet-Network-Connector/dp/B07FXJGY91/ref=sr_1_16?keywords=ethernet+cable+male+to+female&qid=1668982396&sr=8-16) (Part choice non-critical, could also make custom if desired)
6. General connector, 6-12 pins? something like 2 i2c, 4+ gpio, 4 USB, 2 Power In (5 VDC min, can be as high as 10 VDC for charger board)
7. 1S Lithium Polymer Battery (TBD specific, optional)
8. Micro SD card (optional)
9. Container (design pending)

## Turret

The turret is the central "gadget" portion of this system. The turret provides a sturdy swiveling base and connectors at the base and on the turret's top to connect to other modules. the turret's primary logical interface is via USB.

Parts:
1. Base (Design Pending)
2. [Ring Bearing](https://www.amazon.com/HONJIE-Aluminum-Rotating-Turntable-120mmx8-5mm/dp/B0887VP379/ref=sr_1_3?crid=25MPRIID7UV2C&keywords=turntable+aluminum&qid=1668983803&s=home-garden&sprefix=turntable+aluminum%2Cgarden%2C116&sr=1-3) (Or similar - if a slew ring gear bearing can be found affordably, that is an excelent choice, otherwise adding a ring gear may help by enabling direct servo control)
3. [Slip Ring Connector](https://www.amazon.com/dp/B07NSPHVTN/?tag=bdtele-20&th=1) (or similar - minimum 4 wires, 1A)
4. Hinge/Axle/Pivot point (selection pending - may be integrated in angle sensor)
5. Angle sensor (selection pending)
6. [EEPROM](https://www.adafruit.com/product/5146?gclid=Cj0KCQiAveebBhD_ARIsAFaAvrErFtn8yg5Amb8GxoTQJ-OP08a90qhKPKFxQHLtL3VqYIGCvSLvFHEaAqzjEALw_wcB)
7. Connector 1: Host USB A
8. Connector 2: Dedicated power, barrel connector (Voltage TBD)
9. Connector 3: Host "General purpose" connector, [12 pin](https://www.amazon.com/Connectors-Waterproof-Electrical-Construction-Agriculture/dp/B09V7X3RP2/ref=sr_1_16?keywords=12%2Bpin%2Bconnector&qid=1669002962&sr=8-16&th=1): 2 dedicated Power (voltage level TBD), 4 pin USB, 2 I2C, 4 GPIO (function described in EEPROM and over USB)
10. Connector 4+: 1 or more "load" connectors, 4 pin, 2 I2C, 2 GPIO (function described in EEPROM) - GPIO pins rated for 12 V 4A continuous [maybe this](https://www.amazon.com/YETOR-Waterproof-Electrical-Connectors-Connections/dp/B07QFW8X9Z/ref=sr_1_2?crid=3W1KC5UJCF2AZ&keywords=4+pin+connector&qid=1669008313&sprefix=4+pin+connect%2Caps%2C851&sr=8-2)
11. [Motor Driver](https://www.pololu.com/product/2990)
12. [Analog Multiplexer](https://www.sparkfun.com/products/9056?gclid=Cj0KCQiAveebBhD_ARIsAFaAvrFTHSWjHjLMJ4JXuAinAIm0MWlmRWhVzZ71kzsF0lE7V1qAPO93Qm0aAmL_EALw_wcB) (option listed supports low speed digital as well)
13. [Microcontroller](https://www.digikey.com/en/products/detail/adafruit-industries-llc/4884/14000603?utm_adgroup=General&utm_source=google&utm_medium=cpc&utm_campaign=PMax:%20Smart%20Shopping_Product_Zombie%20SKUS&utm_term=&utm_content=General&gclid=Cj0KCQiAveebBhD_ARIsAFaAvrEzyIHVkc1qnl2kO_fT6JpncaQ-9ldckuksQhLyMB9qicEjcOqp8U8aAl8_EALw_wcB)

Future Part ideas:
1. boost regulator for stepping up input voltage (5-10 VDC for alingment with processor) up to motor voltage range
2. servo motor and ring gear for turret slewing
3. servo sensor network (current, voltage, position, etc.)

## Propellor Arm

The propeller arm is the first "extension" designed for the turret module. This provides the first "job" of the module, namely to control position.

Parts:
1. Arm (Ideally, aluminum)
2. Motor (selection pending)
2. Propeller (selection pending)
3. [EEPROM](https://www.adafruit.com/product/5146?gclid=Cj0KCQiAveebBhD_ARIsAFaAvrErFtn8yg5Amb8GxoTQJ-OP08a90qhKPKFxQHLtL3VqYIGCvSLvFHEaAqzjEALw_wcB)
4. [IMU](https://www.adafruit.com/product/4517?gclid=Cj0KCQiAveebBhD_ARIsAFaAvrHLdFTFSgH8b8tKquRcBiv74wN-C0xFkofsUCNkObwa8lwll9xLDUMaAsADEALw_wcB) (optional)
5. Connector - same as turret module connector, duh...
