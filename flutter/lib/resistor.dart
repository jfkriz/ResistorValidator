enum Band {
  Black,
  Brown,
  Red,
  Orange,
  Yellow,
  Green,
  Blue,
  Violet,
  Gray,
  White,
  Gold,
  Silver,
  None
}

class Resistor {
  Map<Band, int> _digitBands = {
    Band.Black: 0,
    Band.Brown: 1,
    Band.Red: 2,
    Band.Orange: 3,
    Band.Yellow: 4,
    Band.Green: 5,
    Band.Blue: 6,
    Band.Violet: 7,
    Band.Gray: 8,
    Band.White: 9
  };

  Map<Band, double> _multiplierBands = {
    Band.Black: 1e0,
    Band.Brown: 1e1,
    Band.Red: 1e2,
    Band.Orange: 1e3,
    Band.Yellow: 1e4,
    Band.Green: 1e5,
    Band.Blue: 1e6,
    Band.Violet: 1e7,
    Band.Gray: 1e8,
    Band.White: 1e9,
    Band.Gold: 1e-1,
    Band.Silver: 1e-2
  };

  Map<Band, double> _toleranceBands = {
    Band.Brown: .01,
    Band.Red: .02,
    Band.Gold: .05,
    Band.Silver: .10,
    Band.None: .20
  };

  List<Band> _bands;
  double _resistance;
  double _tolerance;
  double _resistanceHigh;
  double _resistanceLow;

  Resistor(List<Band> bands) {
    // TODO Need to verify band count, and validate colors in each band
    this._bands = bands;

    int resistanceDigits;
    double multiplier;
    switch (_bands.length) {
      case 3:
        multiplier = _multiplierBands[_bands[2]];
        _tolerance = _toleranceBands[Band.None];
        resistanceDigits = (_digitBands[_bands[0]] * 10) + _digitBands[_bands[1]];
        break;
      case 4:
        multiplier = _multiplierBands[_bands[2]];
        _tolerance = _toleranceBands[_bands[3]];
        resistanceDigits = (_digitBands[_bands[0]] * 10) + _digitBands[_bands[1]];
        break;
      case 5:
        multiplier = _multiplierBands[_bands[3]];
        _tolerance = _toleranceBands[_bands[4]];
        resistanceDigits = (_digitBands[_bands[0]] * 100) + (_digitBands[_bands[1]] * 10) + _digitBands[_bands[2]];
        break;
      default:
        break;
    }

    _resistance = resistanceDigits * multiplier;
    _resistanceHigh = _resistance * (1 + _tolerance);
    _resistanceLow = _resistance * (1 - _tolerance);
  }

  double get resistance {
    return _resistance;
  }

  double get resistanceHigh {
    return _resistanceHigh;
  }

  double get resistanceLow {
    return _resistanceLow;
  }

  double get tolerance {
    return _tolerance;
  }

  bool isInRange(double resistance) {
    return resistance >= _resistanceLow && resistance <= _resistanceHigh;
  }
}