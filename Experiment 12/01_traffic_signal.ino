// Design an Arduino program to simulate traffic signal

void setup()
{
  pinMode(2, OUTPUT); // STOP
  pinMode(3, OUTPUT); // SLOW
  pinMode(4, OUTPUT); // GO
  Serial.begin(9600);
}

void loop()
{
  digitalWrite(4, LOW);
  digitalWrite(2, HIGH);
  Serial.println("STOP");
  delay(1000);
  digitalWrite(2, LOW);
  digitalWrite(3, HIGH);
  Serial.println("SLOW DOWN");
  delay(1000);
  digitalWrite(3, LOW);
  digitalWrite(4, HIGH);
  Serial.println("GO");
  delay(1000);
}