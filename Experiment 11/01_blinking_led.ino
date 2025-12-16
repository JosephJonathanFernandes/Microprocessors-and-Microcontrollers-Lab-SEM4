// Design an Arduino program to display a blinking LED

const int LED = 13;

void setup()
{
  pinMode(LED, OUTPUT);
}

void loop()
{
  digitalWrite(LED, HIGH);
  delay(2000); // Wait for 1000 millisecond(s)
  digitalWrite(LED, LOW);
  delay(2000); // Wait for 1000 millisecond(s)
}