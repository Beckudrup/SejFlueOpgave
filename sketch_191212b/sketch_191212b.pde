//Her laves der flue listen som er uendelig stor og den bliver ved med at tegne nye fluer 
ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup(){
  size(500,500);
}

//Denne draw køre 30 gange per sekund. 
//Det forloopet gør er at den 
void draw(){
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
}
//Når du klikker på en knap laves der en ny flue og tilføjer den til listen
void keyPressed(){
  flueListe.add(new Flue());
}
//Når du klikker på din mus laves der en ny flue og tilføjer den til listen
void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY));
}

/////////////////////////////////////////////////////////
class Flue{
  //Flue variabler
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  
  Flue(){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
  }
  //
  Flue(float a, float b){
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
  }
  //Rykker fluen
  void flyt(){
    distanceFlyttet = distanceFlyttet + 0.5;
  }
//Her er blueprintet for fluen, så vi ved hvordan man laver den
  void tegnFlue(){
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
