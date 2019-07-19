import 'package:resistor_validator/resistor.dart';
import 'package:test/test.dart';      

void main() {
  test("Check 3-band resistor", () {
    var resistor = Resistor([Band.Brown, Band.Black, Band.Red]);
    expect(resistor.resistance, 1000);
    expect(resistor.tolerance, .20);
    expect(resistor.isInRange(1200), true);
    expect(resistor.isInRange(800), true);
    expect(resistor.isInRange(1201), false);
  });

  test("Check 4-band resistor", () {
    var resistor = Resistor([Band.Brown, Band.Black, Band.Red, Band.Gold]);
    expect(resistor.resistance, 1000);
    expect(resistor.tolerance, .05);
    expect(resistor.isInRange(1050), true);
    expect(resistor.isInRange(950), true);
    expect(resistor.isInRange(1051), false);
  });

  test("Check 5-band resistor", () {
    var resistor = Resistor([Band.Red, Band.Green, Band.Yellow, Band.Black, Band.Brown]);
    expect(resistor.resistance, 254);
    expect(resistor.tolerance, .01);
    expect(resistor.isInRange(254 * 1.01), true);
    expect(resistor.isInRange(254 * .99), true);
    expect(resistor.isInRange(254 * 1.02), false);
  });

}