Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;
Flower myFlower4;

int _pc=#FFA000; //Bladenes farve
int _petals=7; //Hvormange blade blomsten har.

int num = 20; //num er blomstens størrelse. Den er equal til _r2, som er 20.
float[] x = new float[num]; //myFlower4's x-værdi i arrayet.
float[] y = new float[num]; //myFlower4's y-værdi i arrayet.
Flower[] myFlowerArray = new Flower [num];

void setup() {
  size(1000, 1000);
  background(#43AF76);

  int _r1= 60; //Blomsternes størrelse.
  int _r2=20; // Størrelsen på myFlower4
  float _x=width/2; //Start værdi for x.
  float _y=height/2; //Start værdi for y.

  myFlower1 = new Flower(_r1, _petals, _x+200, _y, _pc); //myFlower1 bliver lavet til et object, når new bliver lavet. New er en command, der tildeler objektet hukommelse.
  myFlower2 = new Flower(_r1, _petals, _x-200, _y, _pc);
  myFlower3 = new Flower(_r1, _petals, _x, _y, _pc);
  myFlower4 = new Flower(_r2, _petals, _x, _y, _pc);
}

void draw() {
  background(#43AF76);//Background for at fjerne trail.
  myFlower1.display(); //Tegner blomsten hvert frame.
  myFlower2.display();
  myFlower3.display();

  myFlower1.movement();//Bevæger blomsten.
  myFlower2.movement();
  myFlower3.movement();

  myFlower1.collition(myFlower2); //myFlower1 collition with 2 and 3
  myFlower1.collition(myFlower3);
  myFlower2.collition(myFlower1); //myFlower2 collition with 1 and 3
  myFlower2.collition(myFlower3);
  myFlower3.collition(myFlower2); //myFlower3 collition with 1 and 2
  myFlower3.collition(myFlower1);

  myFlower4.follow();

  for (int i = num-1; i > 0; i--) { //Laver et for loop hvor 'num' bliver mindre og mindre. Den går fra 20 og ned. 'i' skal altid være større end 0 for at det virker.

    x[i] = x[i-1]; //Refererer til positionen af x i et array. Tæller fra [20, 19, 18 ,17 osv.]
    y[i] = y[i-1]; // Refererer til positionen af y i et array. Tæller fra [20, 19, 18 ,17 osv.]
  }
  x[0] = myFlower4.x; // Sætter første positionen af arrayen til myFlower4's x. Arrayet starter altid i 0.
  y[0] = myFlower4.y; // Sætter første positionen af arrayen til myFlower4's y. Arrayet starter altid i 0.

  // Her bliver blomstens hale (trail) tegnet.
  for (int i = 0; i < num; i++) { // i = 0. num = 20. Det vil sige, at når 'i' bliver plusset med 1 hele tiden, vil den maks nå 20. 'i++' = plusser med 1.
    myFlowerArray[i] =  new Flower(num-i, _petals, x[i], y[i], _pc); // Blomstens variabler. 
    
    myFlowerArray[i].display(); // Her bliver blomsten med array tegnet.
  }
}
