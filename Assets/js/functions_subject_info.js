var assignLearningResultTable;

document.addEventListener('DOMContentLoaded', function(){
    let load = window.location.href;
    let arr = load.split("/");
    let subjectId = arr[arr.length-1];

    assignLearningResultTable = $('#subjectInfoTable').DataTable({
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/SubjectInfo/findConcretResultBySubjectId/" + subjectId,
            "dataSrc":""
        },
        "columns":[
            {"data":"id"},
            {"data":"rid"},
            {"data":"rad"},
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
    
   var dataFormAddLR = document.querySelector("#formAddConcreteLearningResult");
   var dataFormEditLR = document.querySelector("#formEditLearningResult");

   dataFormAddLR.onsubmit = function(e) {
    e.preventDefault();
    
    const selectedCheckboxes = Array.from(document.querySelectorAll('input[name="learning_results[]"]:checked'))
        .map(checkbox => checkbox.value);
    const subjectId = document.querySelector("#subjectId").value;
    
    if (selectedCheckboxes.length === 0) {
        swal(subjectId, "Debe seleccionar al menos un resultado de aprendizaje", "error");
        return false;
    }

    dataFormAddLR.append('subjectId', document.querySelector("#subjectId").value);
    selectedCheckboxes.forEach((value, index) => {
        dataFormAddLR.append(`learning_results[${index}]`, value);
    });

    postPutExecution('SubjectInfo/addConcreteResult/' + subjectId, dataFormAddLR, '#addLearningResultModal', formAddConcreteLearningResult);
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
    let load = window.location.href;
    let arr = load.split("/");
    let subjectId = arr[arr.length-1];

    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url + 'SubjectInfo/getRemainingLearningResults/' + subjectId;
    request.open("GET", ajaxUrl, true);
    request.send();

    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
            let learningResults = JSON.parse(request.responseText);
            let fieldset = document.querySelector('#formAddConcreteLearningResult .scrollable-fieldset');
            fieldset.innerHTML = '';

            if(learningResults.length > 0) {
                learningResults.forEach(function(lr) {
                    let div = document.createElement('div');
                    div.className = 'form-check';

                    let input = document.createElement('input');
                    input.className = 'form-check-input';
                    input.type = 'checkbox';
                    input.name = 'learning_results[]';
                    input.value = lr.id;
                    input.id = 'lr_' + lr.id;

                    let label = document.createElement('label');
                    label.className = 'form-check-label';
                    label.htmlFor = 'lr_' + lr.id;
                    label.textContent = lr.id + ' - ' + lr.descripcion;

                    div.appendChild(input);
                    div.appendChild(label);
                    fieldset.appendChild(div);
                });
            } else {
                fieldset.innerHTML = '<p>No hay resultados de aprendizaje disponibles para agregar.</p>';
            }

            $('#addLearningResultModal').modal('show');
        }
    }
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
    let lrId = deleteButton.getAttribute('lr');
    let assignmentId = deleteButton.getAttribute('assignmentId');

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
            deleteExecution('SubjectInfo/deleteConcreteResult/'+ lrId +'/'+ assignmentId);
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