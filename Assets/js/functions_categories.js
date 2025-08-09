var assignLearningResultTable;

document.addEventListener('DOMContentLoaded', function(){
    let load = window.location.href;
    let arr = load.split("/");
    let lastItem = arr[arr.length-1];

    assignLearningResultTable = $('#subjectCategoryTable').DataTable({
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Category/getSubjectsByCategory/" + lastItem,
            "dataSrc":""
        },
        "columns":[
            {"data":"id"},
            {"data":"nombre"},
            {"data":"rr"},
            {"data":"clasificacion"},
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
});

function getSubjectInfo(button){
    let idLearningResult = button.getAttribute('lr');
    let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    let ajaxUrl = base_url+'Category/getSubjectById/' + idLearningResult;
    request.open("GET", ajaxUrl, true);
    request.onreadystatechange = function () {
        window.location.href = base_url + 'SubjectInfo/SubjectInfo/' + idLearningResult;
       
    };
    request.send();

}
