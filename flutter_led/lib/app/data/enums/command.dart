enum Command { ledOn, ledOff }

extension CommandByteExtension on Command {
  int get byteCode {
    switch (this) {
      case Command.ledOn:
        return 0x01;
      case Command.ledOff:
        return 0x02;
    }
  }
}
