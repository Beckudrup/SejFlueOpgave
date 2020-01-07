//Her laves der flue listen som er uendelig stor og den bliver ved med at tegne nye fluer 
ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup(){
  size(500,500);
}

//Denne draw køre 30 gange per sekund. 
//Det forloopet gør er at den kan blive ved med at tegne nye flue og smide dem ind i listen
void draw(){
  clear();
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
}
//Når du klikker på en knap laves der en ny flue og tilføjer den til listen. 
//hvis du klikker e kommer der en større flue
void keyPressed(){
  
  if (keyPressed){
    if (key == 'e'||key == 'E'){
    
  flueListe.add(new Flue(random(1,2.1)));}
  else{
  flueListe.add(new Flue(1));}
}
}
//Når du klikker på din mus laves der en ny flue og tilføjer den til listen
void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY,1));
}

/////////////////////////////////////////////////////////
class Flue{
  //Flue variabler
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  float scale;
  float fart = 0.2;
  Flue(float a){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
    scale = a;
  }
  //Fluens konstruktøre
  Flue(float a, float b,float c){
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
    scale = c;
  }
  //Rykker fluen og skifter dens retning når den rør skærmen
  void flyt(){
    distanceFlyttet = distanceFlyttet + fart;
    println(distanceFlyttet);
    if((cos(vinkel)* (distanceFlyttet*scale) + positionX) > width ||
        (cos(vinkel)*(distanceFlyttet*scale) + positionX) <0)
        {
          fart*=-1;
            
    }
    if ((sin(vinkel)* (distanceFlyttet*scale)+positionY)> height ||
        (sin(vinkel)*(distanceFlyttet*scale) + positionY)<0)
        {
        fart*=-1;

        }
  }
 
//Her er blueprintet for fluen, så vi ved hvordan man laver den
  void tegnFlue(){
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
      scale(scale);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
