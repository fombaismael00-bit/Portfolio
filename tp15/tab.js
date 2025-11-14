function ajouterLigne() {

    var name = document.getElementById("nom").value;
    var ageStr = document.getElementById("age").value;
    var age = parseInt(ageStr, 10); 
    var prenom = document.getElementById("prenom").value;
    
    if (name === "" || ageStr === ""||prenom ==="") {
    alert("un des deux éléments n'est pas complet ou valide");
    } else if (isNaN(age) || age < 10 || age > 20) {
    alert("L'âge n'est pas valide");
    } else {
    var table = document.getElementById("myTable");
    var newRow = table.insertRow(-1);
    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);
    cell1.innerHTML = name;
    cell2.innerHTML = age;
    cell3.innerHTML = prenom;
    }
    }
    
    