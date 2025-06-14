var assignLearningResultTable;

document.addEventListener('DOMContentLoaded', function(){
    let load = window.location.href;
    let arr = load.split("/");
    let lastItem = arr[arr.length-1];

    assignLearningResultTable = $('#subjectInfoTable').DataTable({
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/SubjectInfo/findConcretResultBySubjectId/" + lastItem,
            "dataSrc":""
        },
        "columns":[
            {"data":"id"},
            {"data":"nombre"},
            {"data":"descripcion"},
            {"data":"acciones"}
        ],
        dom: 'lBfrtip',
        buttons: [
            {
                "extend": "copyHtml5",
                "text": "<i class='far fa-copy'></i> Copiar",
                "titleAttr":"Copiar",
                "className": "btn btn-secondary"
            },{
                "extend": "excelHtml5",
                "text": "<i class='fas fa-file-excel'></i> Excel",
                "titleAttr":"Exportar a Excel",
                "className": "btn btn-success"
            },{
                "extend": "pdfHtml5",
                "text": "<i class='fas fa-file-pdf'></i> PDF",
                "titleAttr":"Exportar a PDF",
                "className": "btn btn-danger"
            },{
                "extend": "csvHtml5",
                "text": "<i class='fas fa-file-csv'></i> CSV",
                "titleAttr":"Exportar a CSV",
                "className": "btn btn-warning"
            }
        ],
        "resonsieve":"true",
        "bDestroy": true,
        "iDisplayLength": 10
    });
    
   var dataFormAddLR = document.querySelector("#formAddLearningResult");
   var dataFormEditLR = document.querySelector("#formEditLearningResult");

   dataFormAddLR.onsubmit = function(e){
        e.preventDefault();
        var strName = document.querySelector("#txtNameAdd").value;
        var strDescription = document.querySelector("#txtDescriptionAdd").value;
        if(strName == "" || strDescription == ""){
            swal("Advertencia", "Todos los campos son obligatorios", "error");
            return false;
        }
        postPutExecution('SubjectInfo/addConcreteResult/' + lastItem, dataFormAddLR, '#addLearningResultModal', formAddLearningResult);
   }


    dataFormEditLR.onsubmit = function(e){
        e.preventDefault();
        var intCode = document.querySelector("#txtCodeEdit").value; 
        var strName = document.querySelector("#txtNameEdit").value;
        var strDescription = document.querySelector("#txtDescriptionEdit").value;
        if(intCode == "" || strName == "" || strDescription == ""){
            swal("Advertencia", "Todos los campos son obligatorios", "error");
            return false;
        }
        postPutExecution('SubjectInfo/putConcreteResult/' + intCode, dataFormEditLR, '#editLearningResultModal', formEditLearningResult);
    }


});

function addLerningResultModal(){
    $('#addLearningResultModal').modal('show');
}

function postPutExecution(url, dataFormLR, modalName, formModal){
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url + url;
    let formData = new FormData(dataFormLR);
    request.open('POST', ajaxUrl, true);
        request.send(formData);
        request.onreadystatechange = function(){
            $(modalName).modal("hide");
            formModal.reset();
            swal("Resultados de aprendizaje", "Datos procesados correctamente.", "success");
            assignLearningResultTable.ajax.reload();                    
        }
}


function editConcreteResultButton(button){
    let idLearningResult = button.getAttribute('lr');
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'SubjectInfo/findConcretResultById/' + idLearningResult;
    request.open("GET", ajaxUrl, true);
    request.send();

    request.onreadystatechange = function(){
        let objData = JSON.parse(request.responseText);
        document.querySelector("#txtCodeEdit").value = objData.id;
        document.querySelector("#txtNameEdit").value = objData.nombre;
        document.querySelector("#txtDescriptionEdit").value = objData.descripcion;
    }
    $('#editLearningResultModal').modal('show');
}

function deleteConcreteResultButton(deleteButton){
    let code = deleteButton.getAttribute('lr');
    swal({
        title: "Eliminar resultado concreto",
        text: "¿Realmente quiere eliminar el resultado concreto?",
        icon: "warning",
        buttons: {
            cancel: "¡No, cancelar!",
            confirm: "¡Sí, eliminar!",
          },
        closeOnconfirm: false
    }).then(result => {
        if(result){
            deleteExecution('SubjectInfo/deleteConcreteResult/'+ code);
        } else {
            swal("Cancelado", "El resultado concreto está a salvo", "error");
        }
        
    });
}

function deleteExecution(url){
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+url;
    request.open('POST', ajaxUrl, true);
        request.send();
        request.onreadystatechange = function(){
            if(request.readyState == 4){
                let objData = JSON.parse(request.responseText);
                if(objData.status){
                    swal("¡Eliminado!", objData.msg, "success");
                    assignLearningResultTable.ajax.reload();
                } else {
                    swal("Cancelado", objData.msg, "error");
                }
            }
        }
}