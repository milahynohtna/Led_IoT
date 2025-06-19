#ifndef LED_H
#define LED_H

class Led {
public:
    explicit Led(int pin);
    void on();
    void off();
private:
    int pin;
};

#endif
