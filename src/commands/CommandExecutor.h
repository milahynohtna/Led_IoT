#pragma once
#include "components/Led.h"
#include "commands/CommandParser.h"

class CommandExecutor {
public:
    CommandExecutor(Led& led1, Led& led2);

    void execute(CommandType cmd);

private:
    Led& led;
    Led& anotherLed;
};
