function ajouterLigne() {
    var newLigne = document.getElementById("modeleLigne").cloneNode(true);
    var lastLigne = document.getElementById("lastLigne");
    var parentTbody = document.getElementById("invoice-lines");

    newLigne.removeAttribute("id"); 
    newLigne.querySelector('.desc').value = "";
    newLigne.querySelector('.qte').value = "0";
    newLigne.querySelector('.prix').value = "0";
    newLigne.querySelector('.totalLigne').value = "0.00";

    parentTbody.insertBefore(newLigne, lastLigne);
    
    calculate();
}


function remplir() {
    var listeObjets = new Array("bureau", "lampe", "clé usb 8go", "souris", "écran 17 pouces", "clavier");
    
    var listePrix = document.getElementsByClassName("prix");
    var listeQte = document.getElementsByClassName("qte");
    var listeDesc = document.getElementsByClassName("desc");
    
    for (var i = 0; i < listePrix.length; i++) {
        var indexAlea = Math.floor(Math.random() * listeObjets.length);
        listeDesc[i].value = listeObjets[indexAlea];
        
        var qteAlea = Math.floor(10 * Math.random() + 1); 
        listeQte[i].value = qteAlea;
        
        var prixAlea = Math.floor(100 * Math.random() + 1);
        listePrix[i].value = prixAlea;
    }
    
    calculate();
}


function calculate() {
    var listePrix = document.getElementsByClassName("prix");
    var listeQte = document.getElementsByClassName("qte");
    // CORRECTION APPORTÉE : La classe est "totalLigne" dans le HTML, pas "totalligne"
    var listeTtl = document.getElementsByClassName("totalLigne"); 
    
    var sousTotal = 0;
    
    for (var i = 0; i < listePrix.length; i++) {
        // Utilisation de || 0 pour gérer les inputs vides (qui donneraient NaN)
        var qte = parseInt(listeQte[i].value) || 0;
        var prix = parseFloat(listePrix[i].value) || 0;
        
        var totalLigne = qte * prix;
        
        listeTtl[i].value = totalLigne.toFixed(2);
        
        sousTotal += totalLigne;
    }
    
    document.getElementById("sous-total").innerHTML = sousTotal.toFixed(2);
    
    
    var remiseTaux = parseFloat(document.getElementById("remise-input").value) / 100 || 0;
    var taxeTaux = parseFloat(document.getElementById("taxe-taux").value) / 100 || 0;
    var fraisExpedition = parseFloat(document.getElementById("frais-expedition").value) || 0;
    
    
    var sousTotalRemise = sousTotal - (sousTotal * remiseTaux);
    document.getElementById("sous-total-remise").innerHTML = sousTotalRemise.toFixed(2);
    
    
    var taxeTotale = sousTotalRemise * taxeTaux;
    document.getElementById("taxe-totale").innerHTML = taxeTotale.toFixed(2);
    
    
    var soldeDu = sousTotalRemise + taxeTotale + fraisExpedition;
    
    document.getElementById("solde-du").innerHTML = soldeDu.toFixed(2) + "€";
}

document.addEventListener('DOMContentLoaded', function() {
    calculate();
});