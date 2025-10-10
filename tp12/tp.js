function calcul_moyenne() {
    var n1 = prompt("Donner la première note:");
    var n2 = prompt("Donner la deuxieme note:");
    var n3 = prompt("Donner la troisième note:");

    var somme = Number(n1) + Number(n2) + Number(n3);

    document.write("Voici la somme :" + somme + "<br>");
    var moyenne = somme / 3;

    document.write("Voici la moyenne :" + moyenne + "<br>");

    if (moyenne < 10) {
        document.write("Redoublant");
        document.write ('</br><a href="index.html">Retour</a>');
    } 
    else if( moyenne <12) {
    document.write("Admis-Passable");
    document.write ('</br><a href="index.html">Retour</a>');
    }
    else if( moyenne <14) {
        document.write("Admis-Bien");
        document.write ('</br><a href="index.html">Retour</a>');
        }
else{
    document.write("Admis-Très Bien");
    document.write ('</br><a href="index.html">Retour</a>');
    
}

}

function test_temperature() {
var n1 =prompt ("Saisir une température");



if (n1 < 10 ) {
    document.write("Froid")
    document.write ('</br><a href="index.html">Retour</a>');
}
else if (n1 < 25 )  {
    document.write("Normal")
    document.write ('</br><a href="index.html">Retour</a>');
}
else{
    document.write("Chaud")
    document.write ('</br><a href="index.html">Retour</a>');
}
}

function comparaison(){
    var c1 = prompt("Saisir un nombre");
    var c2 = prompt("Saisir un deuxieme nombre");
    
    if (c1<c2) {
    document.write("le plus petit est " + c2 + "et le plus grand est" +c1 )
    document.write ('</br><a href="index.html">Retour</a>');
    }
    else {
        document.write("le plus petit est " + c1 + "et le plus grand est" +c2 )
        document.write ('</br><a href="index.html">Retour</a>');
    }
}
