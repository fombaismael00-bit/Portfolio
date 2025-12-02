

function testqcm() {
    var score = 0;

    
    if (document.getElementById("q1_vrai").checked == true) { score++; }
    if (document.getElementById("q2_vrai").checked == true) { score++; }
    if (document.getElementById("q3_vrai").checked == true) { score++; }

    
    var q4a = document.getElementById("q4_vrai1").checked;
    var q4b = document.getElementById("q4_vrai2").checked;
    var q4c = document.getElementById("q4_faux1").checked;

    if (q4a == true && q4b == true && q4c == false) {
        score++;
    }

    if (document.getElementById("q5_vrai").checked == true) { score++; }
    if (document.getElementById("q6_vrai").checked == true) { score++; }
    if (document.getElementById("q7_vrai").checked == true) { score++; }
    if (document.getElementById("q8_vrai").checked == true) { score++; }
    if (document.getElementById("q9_vrai").checked == true) { score++; }
    if (document.getElementById("q10_vrai").checked == true) { score++; }

    
    alert("Votre score est de : " + score + " / 10");
}


function ouvrirCorrige() {
    window.open("corrige.html", "Corrigé", "width=600,height=800");
}