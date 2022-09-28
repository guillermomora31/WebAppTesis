


function Cancel(control)
{
    control.CancelEdit();
}
function Grabar(control,valtabla)
{
    if (ASPxClientEdit.ValidateEditorsInContainerById(valtabla))
        {
            control.UpdateEdit();
        }
}                  

function PVerModiFuncion(lwsUserId) {
    CallbackAsigna.PerformCallback(lwsUserId + ':0');

    popupModi1.SetHeaderText("Modificar User's: " + lwsUserId)

}

function PVerUser(lwsUserId) {
    CallbackMenuUser.PerformCallback(lwsUserId);
    popupDataUser.SetHeaderText("Consulta Funciones de: " + lwsUserId)
}


function validar_cedula(cadena) {
    //var cad = document.getElementById("ced").value.trim();
    var cad = cadena;
    var total = 0;
    var longitud = cad.length;
    var longcheck = longitud - 1;

    if (cad !== "" && longitud === 10) {
        for (i = 0; i < longcheck; i++) {
            if (i % 2 === 0) {
                var aux = cad.charAt(i) * 2;
                if (aux > 9) aux -= 9;
                total += aux;
            } else {
                total += parseInt(cad.charAt(i)); // parseInt o concatenará en lugar de sumar
            }
        }

        total = total % 10 ? 10 - total % 10 : 0;

        if (cad.charAt(longitud - 1) == total) {
           // document.getElementById("salida").innerHTML = ("Cedula Válida");
            return 'True';
        } else {
            //document.getElementById("salida").innerHTML = ("Cedula Inválida");
            return 'False';
        }
    }
}


